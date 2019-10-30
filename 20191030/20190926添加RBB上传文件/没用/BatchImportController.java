package com.huateng.excel.imp;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.lingala.zip4j.core.ZipFile;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import resource.bean.creditreport.EastFile;
import resource.bean.creditreport.ZipPassword;
import resource.bean.report.SysParams;

import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.ROOTDAO;
import com.huateng.ebank.business.common.ROOTDAOUtils;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.excel.imp.east.BatchImportForEast;
import com.huateng.excel.imp.east.EASTUtils;
import com.huateng.report.common.service.ReportCommonService;
import com.huateng.report.utils.ReportUtils;

/**
 * author: kin wong
 *
 * class desc:批量导入统一控制器
 */
public class BatchImportController extends MultiActionController { 
    public static final long FILE_MAX_SIZE = 1024 * 1024 * 10;
    //specialList中的文件字段顺序随机的，需要我们按照第一行字段说明去判断字段顺序
    public static final List<String> specialList=Arrays.asList(new String[]{"CORPORATE_WEALTH","PERSONAL_WEALTH"});

    public CommonsMultipartResolver getMultipartResolver() {
        return multipartResolver;
    }

    protected Logger logger = Logger.getLogger(getClass());

    protected String result;// 结果返回页面

    protected CommonsMultipartResolver multipartResolver;// 文件上传

    public void setResult(String result) {
        this.result = result;
    }

    public String getResult() {
        return result;
    }

    public void setMultipartResolver(CommonsMultipartResolver multipartResolver) {
        this.multipartResolver = multipartResolver;
    }
    
    /**
     * @desc 解析加密的ZIP文件--GMO部门的zip文件
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "deprecation", "unused", "rawtypes" })
    public ModelAndView importGMOZIP(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
        File uploadFile = null;
        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest mrequest = resolver.resolveMultipart(request);
        HttpSession httpSession = request.getSession();
        GlobalInfo globalInfo = (GlobalInfo) httpSession.getAttribute(GlobalInfo.KEY_GLOBAL_INFO);
        GlobalInfo.setCurrentInstance(globalInfo);
        // 封装页面返回对象
        List errorList = new ArrayList();
        ModelMap mmap = new ModelMap();
        mmap.addObject("errors", errorList);
        ModelAndView modelAndView = new ModelAndView(result, mmap);
        List<MultipartFile> multipartFiles = mrequest.getFiles("uploadFile");
        String path = null;
        mrequest.setCharacterEncoding("UTF-8");
        MultipartFile file = mrequest.getFile("uploadFile");
        String fileFullName = file.getOriginalFilename();
        try {
            System.out.println("======开始导入ZIP文件【" + fileFullName + "】========" + new Date() + "=========");
            String fileName = fileFullName.substring(0, fileFullName.lastIndexOf("."));
            // 1、判断压缩包是否超过上传日期
            String fileDate = null;
            try{
            	 fileDate = fileName.substring(fileName.length() - 6);
                 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
                 String dayNum = ReportUtils.getSysParamsValue("UPLOAD", "PASSDAY");
                 Date date = sdf.parse(fileDate);
                 Calendar calendar = Calendar.getInstance();
                 calendar.setTime(date);
                 calendar.add(Calendar.MONTH, 1);
                 calendar.add(Calendar.DATE, Integer.parseInt(dayNum));
                 if (calendar.getTime().getTime() < new Date().getTime()) {
                     String msg = "压缩文件超过上传日期，无法上传！";
                     errorList.add(msg);
                     System.out.println(msg);
                     //globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(), globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                     return modelAndView;
                 }
            }catch(Exception e){
            	e.printStackTrace();
            	String msg = "压缩包名称错误，正确名称格式为【xxxx_yyyyMM.zip或xxxx_xxxx_yyyyMM.zip】！";
            	errorList.add(msg);
            	System.out.println(msg);
            	//globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
            	return modelAndView;
            }
           
            // 2、判断压缩包是否已经设置密码
            path = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + fileName;// 解压后的文件存放路径
            mkdirIfNotExists(path);
            String password = getPassword(fileFullName);
            if (password == null) {
                String msg = "没有找到上传压缩包的密码，请找CHECKER人员确认该压缩包是否已经设置密码！";
                errorList.add(msg);
                System.out.println(msg);
                //globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                return modelAndView;
            }
            // 3、复制压缩文件到指定目录下并解压
            String fullFileName = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + File.separator + fileFullName;// 压缩包存放路径（上传后保留压缩包）
            uploadFile = new File(fullFileName);
            file.transferTo(uploadFile);// 将上传的zip文件拷贝到服务器目录下
            ZipFile srcFile = new ZipFile(fullFileName);
            srcFile.setFileNameCharset("GBK");
            srcFile.setPassword(password.toCharArray());
            try{
            	srcFile.extractAll(path);
            }catch (Exception e){
            	e.printStackTrace();
            	String msg = "压缩包密码错误，请找CHECKER人员确认该压缩包密码设置是否正确！";
            	errorList.add(msg);
            	System.out.println(msg);
            	//globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
            	return modelAndView;
            }
            System.out.println("======成功解密ZIP文件【" + fileFullName + "】========" + new Date() + "=========");
            // 4、读取解压后的文件
            String msg = null;
            msg = traverseFolder(path, fileDate);
            if (msg != null) {
                errorList.add(msg);
                System.out.println(msg);
                //globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                return modelAndView;
            }
            //globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入成功！" }, "");
            System.out.println("======成功导入ZIP文件【" + file.getOriginalFilename() + "】========" + new Date()+ "=========");
        } catch (Exception e) {
            e.printStackTrace();
            errorList.add(e.toString());
            //globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + e.toString() }, "");
            System.out.println("======导入ZIP文件【" + file.getOriginalFilename() + "】失败========" + new Date()+ "=========");
        } finally {
            if (path != null) {
                deleteAllFilesOfDir(new File(path)); // 删除解压后的文件，保留上传的压缩包文件
            }
            return modelAndView;
        }
        
    }
    
    
    /**
     * @desc 解析加密的ZIP文件--FIN部门的zip文件
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "deprecation", "unused", "rawtypes" })
    public ModelAndView importFINZIP(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
        File uploadFile = null;
        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest mrequest = resolver.resolveMultipart(request);
        HttpSession httpSession = request.getSession();
        GlobalInfo globalInfo = (GlobalInfo) httpSession.getAttribute(GlobalInfo.KEY_GLOBAL_INFO);
        GlobalInfo.setCurrentInstance(globalInfo);
        // 封装页面返回对象
        List errorList = new ArrayList();
        ModelMap mmap = new ModelMap();
        mmap.addObject("errors", errorList);
        ModelAndView modelAndView = new ModelAndView(result, mmap);
        List<MultipartFile> multipartFiles = mrequest.getFiles("uploadFile");
        String path = null;
        mrequest.setCharacterEncoding("UTF-8");
        MultipartFile file = mrequest.getFile("uploadFile");
        String fileFullName = file.getOriginalFilename();
        try {
            System.out.println("======开始导入ZIP文件【" + fileFullName + "】========" + new Date() + "=========");
            String fileName = fileFullName.substring(0, fileFullName.lastIndexOf("."));
            // 1、判断压缩包是否超过上传日期
            String fileDate = null;
            try{
            	 fileDate = fileName.substring(fileName.length() - 6);
                 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
                 String dayNum = ReportUtils.getSysParamsValue("UPLOAD", "PASSDAY");
                 Date date = sdf.parse(fileDate);
                 Calendar calendar = Calendar.getInstance();
                 calendar.setTime(date);
                 calendar.add(Calendar.MONTH, 1);
                 calendar.add(Calendar.DATE, Integer.parseInt(dayNum));
                 if (calendar.getTime().getTime() < new Date().getTime()) {
                     String msg = "压缩文件超过上传日期，无法上传！";
                     errorList.add(msg);
                     System.out.println(msg);
                     globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(), globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                     return modelAndView;
                 }
            }catch(Exception e){
            	e.printStackTrace();
            	String msg = "压缩包名称错误，正确名称格式为【xxxx-yyyyMM.zip】！";
            	errorList.add(msg);
            	System.out.println(msg);
            	globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
            	return modelAndView;
            }
           
            // 2、判断压缩包是否已经设置密码
            path = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + fileName;// 解压后的文件存放路径
            mkdirIfNotExists(path);
            String password = getPassword(fileFullName);
            if (password == null) {
                String msg = "没有找到上传压缩包的密码，请找CHECKER人员确认该压缩包是否已经设置密码！";
                errorList.add(msg);
                System.out.println(msg);
                globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                return modelAndView;
            }
            // 3、复制压缩文件到指定目录下并解压
            String fullFileName = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + File.separator + fileFullName;// 压缩包存放路径（上传后保留压缩包）
            uploadFile = new File(fullFileName);
            file.transferTo(uploadFile);// 将上传的zip文件拷贝到服务器目录下
            ZipFile srcFile = new ZipFile(fullFileName);
            srcFile.setFileNameCharset("GBK");
            srcFile.setPassword(password.toCharArray());
            try{
            	srcFile.extractAll(path);
            }catch (Exception e){
            	e.printStackTrace();
            	String msg = "压缩包密码错误，请找CHECKER人员确认该压缩包密码设置是否正确！";
            	errorList.add(msg);
            	System.out.println(msg);
            	globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
            	return modelAndView;
            }
            System.out.println("======成功解密ZIP文件【" + fileFullName + "】========" + new Date() + "=========");
            // 4、读取解压后的文件
            String msg = null;
            msg = traverseFINFolder(path, fileDate ,fileName.split("-")[0]);
            if (msg != null) {
                errorList.add(msg);
                System.out.println(msg);
                globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + msg }, "");
                return modelAndView;
            }
            globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入成功！" }, "");
            System.out.println("======成功导入ZIP文件【" + file.getOriginalFilename() + "】========" + new Date()+ "=========");
        } catch (Exception e) {
            e.printStackTrace();
            errorList.add(e.toString());
            globalInfo.setLogToBizLog(globalInfo, "Updater.log", new String[] { globalInfo.getTlrno(),globalInfo.getBrno(), "【" + fileFullName + "】文件导入失败，失败原因：" + e.toString() }, "");
            System.out.println("======导入ZIP文件【" + file.getOriginalFilename() + "】失败========" + new Date()+ "=========");
        } finally {
            if (path != null) {
                deleteAllFilesOfDir(new File(path)); // 删除解压后的文件，保留上传的压缩包文件
            }
            return modelAndView;
        }
    }

    /**
     * @desc 单个文件上传
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unused", "deprecation", "unchecked", "rawtypes" })
    public ModelAndView uploadFilsesImport(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
    	 List<File> uploadFileList = new ArrayList<File>();
         ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
         //获取查询字符串,比如客户端发送:http://localhost/test.do?a=b&c=d&e=f 通过request.getQueryString()得到的是:a=b&c=d&e=f
         //API 中注释写到：’意思是：获取带参数查询。post方法传的参数，getQueryString（）得不到， 它只对get方法得到的数据有效
         String f = request.getQueryString();
         //通过MultipartResolver用于解析处理文件上传
         MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
         //对请求的数据进行解析，然后将文件数据解析成 MultipartFile 
         //并封装在 MultipartHttpServletRequest (继承了 HttpServletRequest) 对象中
         MultipartHttpServletRequest mrequest = resolver.resolveMultipart(request);
         HttpSession httpSession = request.getSession();
         GlobalInfo globalInfo = (GlobalInfo) httpSession.getAttribute(GlobalInfo.KEY_GLOBAL_INFO);
         GlobalInfo.setCurrentInstance(globalInfo);
         // 封装页面返回对象
         List errorList = new ArrayList();
         ModelMap mmap = new ModelMap();
         mmap.addObject("errors", errorList);
         ModelAndView modelAndView = new ModelAndView(result, mmap);
         
         List<String> roleNameList = EASTUtils.getDepartByUserId(globalInfo.getTlrno());//获取用户所在部门，可以是多个
         List<String> fileNamList = EASTUtils.getImportFileName(roleNameList);//根据部门获取导入文件权限
 		 String path = null;
         try {
            mrequest.setCharacterEncoding("UTF-8");
            List<MultipartFile> fileList = mrequest.getFiles("uploadFile");
            path = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + "filetmp"+File.separator+globalInfo.getTlrno()+File.separator;
 	        //文件目录不存在则创建文件目录，带层级
            mkdirIfNotExists(path);
 	        for (MultipartFile file : fileList) {
 	        	//file.getOriginalFilename()是得到上传时的文件名加后缀
 	        	String orgfileName = file.getOriginalFilename().toUpperCase();//获取文件名称
 	        	if(orgfileName!=null&&!"".equals(orgfileName)){
 	 	        	String fileName = null;
 	 	        	if(orgfileName.indexOf("_")>0){
 	 	        		fileName = orgfileName.substring(0,orgfileName.lastIndexOf("_"));//截取掉日期
 	 	        	}else{
 	 	        		errorList.add("【"+orgfileName+"】文件名称不正确，请确认！");
 	 	        		return modelAndView;
 	 	        	}
 	 	        	//判断操作员是否有导入文件的权限
 	 	        	boolean importFlag = false;
 	 	        	for(String str : fileNamList){
 	 	        		if(fileName.indexOf("_CHANGE_INFO")>-1 && 
 	                			fileName.indexOf("WMR_CHANGE_INFO")==-1 && 
 	                			fileName.indexOf("CCS_CHANGE_INFO")==-1 ){
 	 	        			if("RBB_CHANGE_INFO".startsWith(str)){
 	 	 	        			importFlag = true;
 	 	 	        		}
 	 	 	        	}else{
 	 	 	        		if(orgfileName.startsWith(str)){
 	 	 	        			importFlag = true;
 	 	 	        		}
 	 	 	        	}
 	 	        	}
 	 	        	if(fileNamList.size()>0&&!importFlag){
 	 	        		errorList.add("没有导入【"+orgfileName+"】文件的权限，请确认！");
 	 	        		return modelAndView;
 	 	        	}
 	 	        	String filePath = path + file.getOriginalFilename();
 	 	        	File uploadFile = new File(filePath);
 	 	            uploadFileList.add(uploadFile);
 	 	            file.transferTo(uploadFile); //将上传的文件拷贝到服务器uploadFile目录下
					// 在此判断(检测字段是否符合标准并弹出错误信息)					
//					if (orgfileName.indexOf("BILL_BNFO_INVOICE")!=-1) {						
//						String etlDate = orgfileName.substring(orgfileName.lastIndexOf("_")+1, orgfileName.length() - 5);// 截取掉日期
//						String dataFlag = orgfileName.substring(orgfileName.lastIndexOf("_")-3, orgfileName.length() - 12);// 截取行代码
//						List<String> errolists = new FieldCheck().FieldsCheck(orgfileName, filePath, globalInfo,
//								etlDate, dataFlag);
//						if (!errolists.isEmpty()) {
//							for(String errolist : errolists){
//								errorList.add(errolist);
//							}
//							return modelAndView;
//						}
//					}
					//字段检测结束
 	        	}
 	        }
 	        //遍历上传目录下所有文件
             String back = excelTraverseFolder(path, globalInfo ,fileNamList).toString();
             if (!StringUtils.isEmpty(back)) {
                 errorList.add(back);
             }
         } catch (Exception e) {
             e.printStackTrace();
             errorList.add("系统内部出错，错误信息：" + e.toString());
         } finally {
             if (path != null) {
                 deleteAllFilesOfDir(new File(path));
             }
         }
         return modelAndView;
    }

    /**
     * 遍历一个文件夹下的所有文件
     * 
     * @param path
     * @throws Exception
     */
    public String traverseFolder(String path, String fileDate) throws Exception {
        String back = null;
        try {
            File file = new File(path);
            if (file.exists()) {
                File[] files = file.listFiles();
                String fileNum = ReportUtils.getSysParamsValue2("UPLOAD", "GMO");
                if (fileNum==null||files.length != Integer.parseInt(fileNum)) {
                    back = "压缩包内的文件数量与要求不符！";
                    return back; 
                } else {
                    for (File file2 : files) {
                		String msg = BatchImportForEast.importxlsx(file2, fileDate);
                		if (msg != null) {
                            back = msg;
                            return back;
                        }
                    }
                    return back;
                }
            } else {
                back = "没有找到可导入的文件!";
                return back;
            }
        } catch (Exception e) {
        	e.printStackTrace();
        	return e.toString();
        }
    }
    
    
    /**
     * 遍历一个文件夹下的所有文件
     * 
     * @param path
     * @throws Exception
     */
    public String traverseFINFolder(String path, String fileDate, String zipName) throws Exception {
        String back = null;
        Connection conn = null;
        Statement st = null;
        Statement stDel = null;
        ResultSet rs = null;
        try {
            File file = new File(path);
            if (file.exists()) {
                File[] files = file.listFiles();
                SysParams param = ReportCommonService.getInstance().getSysparamsByPk("UPLOAD", "FIN");
                String fileNum = param.getParamVal();
                String subNum = param.getMemo();//机构号截取数
                if (fileNum==null||files.length != Integer.parseInt(fileNum)) {
                    back = "压缩包内的文件数量与要求不符！";
                    return back; 
                } else {
                	conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
                	 // 1、文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
                	List columList = new ArrayList();
                    String tableName = null;
                    st = conn.createStatement();
                    rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME  from TB_TABLEINFO where FILE_NAME = '"+ zipName + "'  ORDER BY ORDNUM");
                    while (rs.next()) {
                        columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                        tableName = rs.getString("TABLE_NAME");
                    }
                    if (tableName == null) {
                        back = "上传的压缩包文件不在导入文件范围内，请确认文件名称是否正确！";
                        return back;
                    }
                    //2、执行导入之前清除文件日期下该表的数据
                    stDel = conn.createStatement();
                    stDel.executeUpdate("delete from " + tableName + " where etl_date = '"+ fileDate + "'");
                    //3、循环读取文件并插入数据
                    for (File file2 : files) {
                		String msg = BatchImportForEast.importFINxlsx(file2, fileDate,columList,tableName,Integer.parseInt(subNum));
                		if (msg != null) {
                            back = msg;
                            return back;
                        }
                    }
                    return back;
                }
            } else {
                back = "没有找到可导入的文件!";
                return back;
            }
        } catch (Exception e) {
        	e.printStackTrace();
        	return e.toString();
        }finally {
            if (stDel != null) {
            	stDel.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    /**
     * Excel 上传遍历一个文件夹下的所有文件
     * 
     * @param path
     * @throws Exception
     */
    public StringBuffer excelTraverseFolder(String path, GlobalInfo globalInfo, List<String> fileNamList) throws Exception {
        ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
        StringBuffer back = new StringBuffer();
        String fileDate = null;
        try {
            File file = new File(path);
            if (file.exists()) {
                File[] files = file.listFiles();
                for (File file2 : files) {
                    String fileName = null;
                    String areaFlag = null;
                    if (file2.isFile() ) {// 只读取xlsx文件--&& file2.getName().indexOf(".xlsx") > -1
                        String OriginalFilename = file2.getName().toUpperCase();
                        String fileNameWithYYYYMM = null;
                        if(OriginalFilename.indexOf(".") > -1) {
                            fileNameWithYYYYMM = OriginalFilename.substring(0,OriginalFilename.lastIndexOf("."));
                        } else {
                            fileNameWithYYYYMM = OriginalFilename;
                        }
                        if (null != fileNameWithYYYYMM) {
                            String [] array = fileNameWithYYYYMM.split("_");
                            int size = array.length;
                            if (size >= 2) {
                                areaFlag = array[size-2].toUpperCase();
                            }
                        }
                        String fileNameWithoutYYYYMM = OriginalFilename.substring(0,OriginalFilename.lastIndexOf("_"));
                        // 上传文件日期是否一致
                        if (StringUtils.isEmpty(fileDate)) {
                            fileDate = fileNameWithYYYYMM.substring(fileNameWithYYYYMM.length() - 6);
                        } else {
                            if (!fileDate.equals(fileNameWithYYYYMM.substring(fileNameWithYYYYMM.length() - 6))) {
                                return back.append("上传文件日期不一致");
                            }
                        }
                        // 判断文件上传日期 是否符合条件
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
                        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
                        String dayNum = ReportUtils.getSysParamsValue("UPLOAD", "PASSDAY");
                        Date date = sdf.parse(fileDate);
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(date);
                        calendar.add(Calendar.MONTH, 1);
                        calendar.add(Calendar.DATE, Integer.parseInt(dayNum));
                        if (calendar.getTime().getTime() < new Date().getTime()) {
                            back.append("【"+OriginalFilename+"】文件超过上传日期，无法上传！");
                            return back;
                        }
                        if (StringUtils.isEmpty(fileName)) {
                            fileName = fileNameWithoutYYYYMM;
                        }
                        EastFile eastFile = new EastFile();// 创建导入文件对象
                        String errorMeg =null;
                        if (file2.getName().indexOf(".xlsx") > -1) {
                        	if(specialList.contains(fileName)){//特殊文件特殊处理（导入文件列无顺序）
                        		errorMeg = BatchImportForEast.EXimportSpecialxlsx(file2, fileDate, areaFlag,fileName, eastFile);
                        	}else if(fileName.indexOf("BILL_BNFO_INVOICE")>-1){//
                        		errorMeg = BatchImportForEast.EXimportBillInfoInvoicexlsx(file2, fileDate, areaFlag,fileName, eastFile);
                        	}else if(fileName.indexOf("_CHANGE_INFO")>-1 && 
                        			fileName.indexOf("WMR_CHANGE_INFO")==-1 && 
                        			fileName.indexOf("CCS_CHANGE_INFO")==-1 ){
                        		//截取文件名前几位
                        		areaFlag = fileName.substring(0,fileName.indexOf("_"));
                        		errorMeg = BatchImportForEast.EXimportxlsxChange(file2, fileDate, areaFlag,fileName, eastFile);
                        	}else{
                        		errorMeg = BatchImportForEast.EXimportxlsx(file2, fileDate, areaFlag,fileName, eastFile);
                        	}
                        } else {
                            errorMeg = BatchImportForEast.TXTimport(file2, fileDate, areaFlag,fileName, eastFile);
                        }
                        if (!StringUtils.isEmpty(errorMeg)) {
                            back.append(errorMeg);
                            return back;
                        } else {
                            // 保存导入文件 数据 到数据库
                            eastFile.setDepartment(globalInfo.getBrno());
                            eastFile.setFileName(OriginalFilename);
                            eastFile.setFileTime(fileDate);
                            eastFile.setArea(areaFlag);
                            for(String str : fileNamList){//filler1标识导入文件标识（根据文件名称来），用于审核页面的查询
         	 	        		if(OriginalFilename.startsWith(str)){
         	 	        			eastFile.setFiller1(str);
         	 	        			break;
         	 	        		}
         	 	        	}
                            String sql = "SELECT ID,UPLOAD_PERSON,UPLOAD_TIME FROM EAST_FILE E WHERE E.FILE_NAME = ?";
                            Object[] param = new Object[1];
                            param[0] = OriginalFilename;
                            List list = rootdao.queryBySQL3(sql, param);
                            if (list.size() > 0) {
                                eastFile.setId((String) ((HashMap) list.get(0)).get("ID"));
                                eastFile.setUpdatePerson(globalInfo.getTlrno());
                                eastFile.setUpdateTime(sdf2.parse(sdf2.format(new Date())));
                                eastFile.setUploadPerson((String) ((HashMap) list.get(0)).get("UPLOAD_PERSON"));
                                eastFile.setUploadTime((Date) ((HashMap) list.get(0)).get("UPLOAD_TIME"));
                                rootdao.update(eastFile);
                            } else {
                                eastFile.setId(ReportUtils.getUUID());
                                eastFile.setUploadPerson(globalInfo.getTlrno());
                                eastFile.setUploadTime(sdf2.parse(sdf2.format(new Date())));
                                rootdao.save(eastFile);
                            }
                        }
                    }
                }

            } else {
                back.append("没有找到上传的文件!");
                return back;
            }
        } catch (Exception e) {
        	e.printStackTrace();
        	 back.append(e.toString());
             return back;
        }
        return back;
    }

    /**
     * 文件目录不存在则创建文件目录，带层级
     * 
     * @param path
     */
    private void mkdirIfNotExists(String path) {
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    /**
     * 删除文件或者文件夹
     * 
     * @param path
     */
    public static void deleteAllFilesOfDir(File path) {
        if (!path.exists())
            return;
        if (path.isFile()) {
            path.delete();
            return;
        }
        File[] files = path.listFiles();
        for (int i = 0; i < files.length; i++) {
            deleteAllFilesOfDir(files[i]);
        }
        path.delete();
    }

    /**
     * 根据压缩文件名获取压缩包密码
     * 
     * @param path
     */
    private static String getPassword(String fileName) throws Exception {
        String value = null;
        ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
        ZipPassword bean = rootdao.query(ZipPassword.class, fileName);
        if (bean == null) {
            return value;
        } else {
            value = bean.getPassWord();
            return value;
        }
    }

    @SuppressWarnings({ "unchecked", "deprecation", "unused", "rawtypes" })
    public void importTEST(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
        File uploadFile = null;
        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest mrequest = resolver.resolveMultipart(request);
        String path = null;
        try {
            mrequest.setCharacterEncoding("UTF-8");
            MultipartFile file = mrequest.getFile("uploadFile");
            String fileName = file.getOriginalFilename().substring(0,
                    file.getOriginalFilename().lastIndexOf("."));
            path = ReportUtils.getSysParamsValue("UPLOAD", "PATH") + fileName;// 压缩包和解压后的文件存放路径
            //文件目录不存在则创建文件目录，带层级
            mkdirIfNotExists(path);
            String fullFileName = path + File.separator + file.getOriginalFilename();
            uploadFile = new File(fullFileName);
            file.transferTo(uploadFile);
            InputStream is = new FileInputStream(uploadFile);
            ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
            GlobalInfo gi = GlobalInfo.getCurrentInstance();
            Workbook wb = null;
            if (file.getOriginalFilename().endsWith("xlsx")) {// 根据导入文件名称判断读取03还是10版excel
                wb = new XSSFWorkbook(is);
            } else {
                wb = new HSSFWorkbook(is);
            }
            Sheet sheet = null;
            reponse.setContentType("text/plain");// 一下两行关键的设置
            reponse.addHeader("Content-Disposition", "attachment;filename=导出sql.txt");// filename指定默认的名字
            BufferedOutputStream buff = null;
            StringBuffer write = new StringBuffer();
            String enter = "\r\n";
            ServletOutputStream outSTr = null;
            outSTr = reponse.getOutputStream();// 建立
            buff = new BufferedOutputStream(outSTr);
            for (int i = 0; i < wb.getNumberOfSheets(); i++) {
                sheet = wb.getSheetAt(i);
                if (sheet.getSheetName().indexOf("项目贷款表") != -1) {
                    for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                        Row row = sheet.getRow(rowNum);
                        if (rowNum == 2) {
                            write.append("create table " + row.getCell(1) + "(" + enter);
                        } else if (rowNum > 5 && rowNum < sheet.getLastRowNum()) {
                            write.append(row.getCell(3) + "  " + row.getCell(4) + "," + enter);
                        } else if (rowNum == sheet.getLastRowNum()) {
                            write.append(row.getCell(3) + "  " + row.getCell(4) + "  )" + enter);
                        }
                    }
                }
            }
            buff.write(write.toString().getBytes("UTF-8"));
            buff.flush();
            buff.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (path != null) {
                deleteAllFilesOfDir(new File(path));
            }
        }
    }
    
}