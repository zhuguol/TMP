package com.huateng.excel.imp.east;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.orm.hibernate3.SessionFactoryUtils;

import resource.bean.creditreport.EastFile;
import sun.org.mozilla.javascript.internal.regexp.SubString;

import com.huateng.ebank.business.common.ROOTDAOUtils;
import com.huateng.ebank.framework.exceptions.CommonException;

public class BatchImportForEast {
	
    /**
     * @desc 读取解压后的文件
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String importxlsx(File file, String fileDate) throws Exception {
        String back = null;
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        Statement stDel = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        int rowNum = 2;//从第二行开始读取
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            List columList = new ArrayList();
            // 1、文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            String fileName = file.getName().toUpperCase();// 文件名称
            String file_name = fileName.split("_")[0];//截取下划线前面的文件名称
            rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME  from TB_TABLEINFO where FILE_NAME = '"+ file_name + "'  ORDER BY ORDNUM");
            while (rs.next()) {
                columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                tableName = rs.getString("TABLE_NAME");
            }
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columList.size();
            List<String[]> list = new ArrayList<String[]>();
        	if(fileName.endsWith("XLSX")){
            	list = XLSXCovertCSVReader.readerExcel(file.getPath(), count);
            }else if(fileName.endsWith("PRN")){
            	list = XLSXCovertCSVReader.readerPRN(file);
            }else if(fileName.endsWith("CSV")){
            	list = XLSXCovertCSVReader.readerCSV(file);
            }
            
            if (list == null) {
                back = "【" + fileName + "】文件没有可用的数据！";
                return back;
            }
           
            // 2、执行导入之前清除文件日期下该表的数据
            stDel = conn.createStatement();
            stDel.executeUpdate("delete from " + tableName + " where etl_date = '"+ fileDate + "'");
            // 3、拼接insert语句
            StringBuffer insertSQL = new StringBuffer("insert into " + tableName + " (");
            // 循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    insertSQL.append(columList.get(j - 1) + ") values (");
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            pstInsert = conn1.prepareStatement(insertSQL.toString());
            conn1.setAutoCommit(false);
            // 4、插入excle文件的值
            for (int i = 0; i < list.size(); i++) {
            	num++;
                String[] record = list.get(i);
                for (int j = 1; j <= count; j++) {
                    if (j < count) {
                        pstInsert.setString(j, record[j - 1]);
                    } else {
                        pstInsert.setString(j, fileDate);
                    }
                }
                pstInsert.addBatch();
                if (num % 2000 == 0) {
                	pstInsert.executeBatch();
                    conn1.commit();
                    rowNum =  rowNum + 2000;
                }
            }
            pstInsert.executeBatch();
            conn1.commit();
            System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            return back;
        }catch(BatchUpdateException e){
        	e.printStackTrace();
        	if(num==0){
        		return file.getName() + "文件解析失败，错误原因：" + e.toString();
        	}else{
        		rowNum = rowNum + e.getUpdateCounts().length; //e.getUpdateCounts().length从0开始
        		return file.getName() + "文件第【"+rowNum+"】行解析失败，错误原因：" + e.toString();
        	}
        }catch (Exception e) {
        	e.printStackTrace();
        	return file.getName() + "文件解析失败，错误原因：" + e.toString();
        } finally {
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (stDel != null) {
            	stDel.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    
    
    /**
     * @desc 读取解压后的文件
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String importFINxlsx(File file, String fileDate, List columList ,String tableName, int subNum) throws Exception {
        String back = null;
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        Statement stDel = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        int rowNum = 5;//从第5行开始读取
        try {
        	//String maxNum = ReportUtils.getSysParamsValue("UPLOAD", "FINMAXNUM");
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            String fileName = file.getName().toUpperCase();// 文件名称
            String code = fileName.split("_")[1].substring(0, subNum);//从文件名中截取机构号
            int count = columList.size();
            //1、将文件内容读取到list中
            List<String[]> list = new ArrayList<String[]>();
            Workbook wb = null;
        	is = new FileInputStream(file);
        	if (fileName.endsWith("XLSX")) {// 根据导入文件名称判断读取03还是10版excel
                wb = new XSSFWorkbook(is);
            } else {
                wb = new HSSFWorkbook(is);
            }
        	for (int i = 0; i < wb.getNumberOfSheets(); i++) {
        		Sheet sheet = wb.getSheetAt(i);
                for (int rownum = 4; rownum < sheet.getLastRowNum(); rownum++) {//只读取到文件的711行
                    Row row = sheet.getRow(rownum);
                    String[] record = new String[4];
                    record[0] = getValue(row.getCell(0));
                    record[1] = getValue(row.getCell(1));
                    record[2] = getValue(row.getCell(2));
                    record[3] = code;
                    if(record[0].indexOf("制表机构")>-1){
                    	break;
                    }
                    list.add(record);
                }
            }
            if (list == null) {
                back = "【" + fileName + "】文件没有可用的数据！";
                return back;
            }
            // 2、拼接insert语句
            StringBuffer insertSQL = new StringBuffer("insert into " + tableName + " (");
            // 循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    insertSQL.append(columList.get(j - 1) + ") values (");
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            pstInsert = conn1.prepareStatement(insertSQL.toString());
            conn1.setAutoCommit(false);
            //3、插入list中的数据
            for (int i = 0; i < list.size(); i++) {
            	num++;
                String[] record = list.get(i);
                for (int j = 1; j <= count; j++) {
                    if (j < count) {
                        pstInsert.setString(j, record[j - 1]);
                    } else {
                        pstInsert.setString(j, fileDate);
                    }
                }
                pstInsert.addBatch();
                if (num % 2000 == 0) {
                	pstInsert.executeBatch();
                    conn1.commit();
                    rowNum =  rowNum + 2000;
                }
            }
            pstInsert.executeBatch();
            conn1.commit();
            System.out.println("======成功读取文件【" + fileName + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            return back;
        }catch(BatchUpdateException e){
        	e.printStackTrace();
        	if(num==0){
        		return file.getName() + "文件解析失败，错误原因：" + e.toString();
        	}else{
        		rowNum = rowNum + e.getUpdateCounts().length; //e.getUpdateCounts().length从0开始
        		return file.getName() + "文件第【"+rowNum+"】行解析失败，错误原因：" + e.toString();
        	}
        }catch (Exception e) {
        	e.printStackTrace();
        	return file.getName() + "文件解析失败，错误原因：" + e.toString();
        } finally {
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (stDel != null) {
            	stDel.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    

    /**
     * @desc 导入EXCLE文件
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String EXimportxlsx(File file, String fileDate, String areaFlag, String fileName,
            EastFile eastFile) throws Exception {
        String back = "";
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        int rowNum = 2;//从第二行开始读取
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            List columList = new ArrayList();
            // 1、根据xlsx文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            // String fileName = file.getName().toUpperCase();// 文件名称
            rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME  from TB_TABLEINFO where FILE_NAME = '"+ fileName + "'  ORDER BY ORDNUM");
            while (rs.next()) {
                columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                tableName = rs.getString("TABLE_NAME");

            }
            eastFile.setTableName(tableName);
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columList.size();
            List<String[]> list = XLSXCovertCSVReader.readerExcel(file.getPath(), count);
            if (list == null) {
                back = "【" + file.getName() + "】文件没有可用的数据！";
                return back;
            }
            String deleteSql = null;
            String insertSql = null;
            //2、导入前删除数据，根据ETL_DATE和DATA_FLAG
            deleteSql = "delete from " + tableName + " where ETL_DATE = '" + fileDate + "' and DATA_FLAG = '"+ areaFlag + "'";
            st.executeUpdate(deleteSql);
            // 3、拼接insert语句
            insertSql = "insert into " + tableName + " ( ETL_DATE,DATA_FLAG,";
            StringBuffer insertSQL = new StringBuffer(insertSql);
            // 循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    if (StringUtils.isEmpty(areaFlag)) {
                        insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "',");
                    } else {
                        insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "','" + areaFlag
                                + "',");
                    }
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            pstInsert = conn1.prepareStatement(insertSQL.toString());
            conn1.setAutoCommit(false);
            // 4、插入excle文件的值
    	    for (int i = 0; i < list.size(); i++) {
    	      num++;
              String[] record = list.get(i);
              for (int j = 1; j <= count; j++) {
                  pstInsert.setString(j, record[j - 1]);
              }
              pstInsert.addBatch();
              if (num % 2000 == 0) {
            	  pstInsert.executeBatch();
                  conn1.commit();
                  rowNum =  rowNum + 2000;
              }
            }
    	    pstInsert.executeBatch();
            conn1.commit();
            eastFile.setDataNum(new BigDecimal(num));
            if(StringUtils.isEmpty(back)){
            	System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            }
            return back;
        }
//        catch(BatchUpdateException e){//唯一索引冲突无法准确报出行数，先不用
//        	e.printStackTrace();
//        	if(num==0){
//        		return file.getName() + "文件解析失败，错误原因：" + e.toString();
//        	}else{
//        		for(int xxxx:e.getUpdateCounts()){
//        			System.out.println("执行结果："+xxxx);
//        		}
//        		rowNum = rowNum + e.getUpdateCounts().length; //e.getUpdateCounts().length从0开始
//        		return file.getName() + "文件第【"+rowNum+"】行解析失败，错误原因：" + e.toString();
//        	}
//        }
        catch (Exception e) {
//       	 	if(e.toString().indexOf("org.xml.sax.SAXException: java.lang.ArrayIndexOutOfBoundsException")!=-1){
//       	 		String[] str = e.toString().split(":");
//       	 		int i = Integer.parseInt(str[2].split(",")[0].trim())+1;
//       	       	back = file.getName() + "文件解析失败，错误原因："+i+"列数据超过限定！";
//       	       	return back;
//       	 	}else{
	       	 	e.printStackTrace();
	        	back = file.getName() + "文件解析失败，错误原因：" + e.toString();
	        	return back;
//       	 	}
        }finally{
            if (file != null) {
                file.delete();
            }
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    /**
     * @desc 导入EXCLE文件
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String EXimportxlsxChange(File file, String fileDate, String areaFlag, String fileName,
            EastFile eastFile) throws Exception {
        String back = "";
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        int rowNum = 2;//从第二行开始读取
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            List columList = new ArrayList();
            // 1、根据xlsx文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            // String fileName = file.getName().toUpperCase();// 文件名称
            rs = st.executeQuery(" SELECT TABLE_NAME,COLUMN_NAME FROM TB_TABLEINFO WHERE FILE_NAME = 'RBB_CHANGE_INFO' ORDER BY ORDNUM ");
            while (rs.next()) {
                columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                tableName = rs.getString("TABLE_NAME");
            }
            eastFile.setTableName(tableName);
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columList.size();
            List<String[]> list = XLSXCovertCSVReader.readerExcel(file.getPath(), count);
            if (list == null) {
                back = "【" + file.getName() + "】文件没有可用的数据！";
                return back;
            }
            String deleteSql = null;
            String insertSql = null;
            //2、导入前删除数据，根据ETL_DATE和DATA_FLAG
            deleteSql = "delete from " + tableName + " where ETL_DATE = '" + fileDate + "' and DATA_FLAG = '"+ areaFlag + "'";
            st.executeUpdate(deleteSql);
            // 3、拼接insert语句
            insertSql = "insert into " + tableName + " ( ETL_DATE,DATA_FLAG,";
            StringBuffer insertSQL = new StringBuffer(insertSql);
            // 循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    if (StringUtils.isEmpty(areaFlag)) {
                        insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "',");
                    } else {
                        insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "','" + areaFlag
                                + "',");
                    }
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            pstInsert = conn1.prepareStatement(insertSQL.toString());
            conn1.setAutoCommit(false);
            // 4、插入excle文件的值
    	    for (int i = 0; i < list.size(); i++) {
    	      num++;
              String[] record = list.get(i);
              for (int j = 1; j <= count; j++) {
                  pstInsert.setString(j, record[j - 1]);
              }
              pstInsert.addBatch();
              if (num % 2000 == 0) {
            	  pstInsert.executeBatch();
                  conn1.commit();
                  rowNum =  rowNum + 2000;
              }
            }
    	    pstInsert.executeBatch();
            conn1.commit();
            eastFile.setDataNum(new BigDecimal(num));
            if(StringUtils.isEmpty(back)){
            	System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            }
            return back;
        }
//        catch(BatchUpdateException e){//唯一索引冲突无法准确报出行数，先不用
//        	e.printStackTrace();
//        	if(num==0){
//        		return file.getName() + "文件解析失败，错误原因：" + e.toString();
//        	}else{
//        		for(int xxxx:e.getUpdateCounts()){
//        			System.out.println("执行结果："+xxxx);
//        		}
//        		rowNum = rowNum + e.getUpdateCounts().length; //e.getUpdateCounts().length从0开始
//        		return file.getName() + "文件第【"+rowNum+"】行解析失败，错误原因：" + e.toString();
//        	}
//        }
        catch (Exception e) {
//       	 	if(e.toString().indexOf("org.xml.sax.SAXException: java.lang.ArrayIndexOutOfBoundsException")!=-1){
//       	 		String[] str = e.toString().split(":");
//       	 		int i = Integer.parseInt(str[2].split(",")[0].trim())+1;
//       	       	back = file.getName() + "文件解析失败，错误原因："+i+"列数据超过限定！";
//       	       	return back;
//       	 	}else{
	       	 	e.printStackTrace();
	        	back = file.getName() + "文件解析失败，错误原因：" + e.toString();
	        	return back;
//       	 	}
        }finally{
            if (file != null) {
                file.delete();
            }
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    /**
     * @desc 导入无序的EXCLE文件
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String EXimportSpecialxlsx(File file, String fileDate, String areaFlag, String fileName,
            EastFile eastFile) throws Exception {
        String back = "";
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        int rowNum = 2;//从第二行开始读取
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            Map columMap = new HashMap();
            List columList = new ArrayList();
            // 1、根据xlsx文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME,COMMENTS  from TB_TABLEINFO where FILE_NAME = '"+ fileName + "'  ORDER BY ORDNUM");
            while (rs.next()) {
                columMap.put(rs.getString("COMMENTS"), rs.getString("COLUMN_NAME"));//存放字段说明文字和字段名称的键值对
                tableName = rs.getString("TABLE_NAME");
            }
            eastFile.setTableName(tableName);
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columMap.size();
            //读取文件，保留第一行表头
            List<String[]> list = XLSXCovertCSVReader.readerExcel(file.getPath(), count);
            if (list == null) {
                back = "【" + file.getName() + "】文件没有可用的数据！";
                return back;
            }
            //2、根据导入文件第一行，获取insert字段顺序
            if(list.size()>0){
            	String[] record = list.get(0);//获取第一行字段顺序
            	if(record.length!=count){
            		 back = "【" + file.getName() + "】文件列数与规定不一致，请确认！";
                     return back;
            	}
            	for(int j = 0; j<count; j++) {
            		Object columName = columMap.get(record[j]);
            		if(columName==null){
            			 back = "【" + file.getName() + "】文件【"+record[j]+"】列找不到对应字段，请确认！";
                         return back;
            		}
            		columList.add(columName);
                }
            }
            //3、导入前删除数据，根据ETL_DATE和DATA_FLAG
            String deleteSql = null;
            String insertSql = null;
            deleteSql = "delete from " + tableName + " where ETL_DATE = '" + fileDate + "' and DATA_FLAG = '"+ areaFlag + "'";
            st.executeUpdate(deleteSql);
            //4、拼接insert语句
            insertSql = "insert into " + tableName + " ( ETL_DATE,DATA_FLAG,";
            StringBuffer insertSQL = new StringBuffer(insertSql);
            //循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "','" + areaFlag+ "',");
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            pstInsert = conn1.prepareStatement(insertSQL.toString());
            conn1.setAutoCommit(false);
            // 4、插入excle文件的值
    	    for (int i = 1; i < list.size(); i++) {//插入值，从文件第二行开始
    	      num++;
              String[] record = list.get(i);
              for (int j = 1; j <= count; j++) {
                  pstInsert.setString(j, record[j - 1]);
              }
              pstInsert.addBatch();
              if (num % 2000 == 0) {
            	  pstInsert.executeBatch();
                  conn1.commit();
                  rowNum =  rowNum + 2000;
              }
            }
    	    pstInsert.executeBatch();
            conn1.commit();
            eastFile.setDataNum(new BigDecimal(num));
            if(StringUtils.isEmpty(back)){
            	System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            }
            return back;
        }
        catch (Exception e) {
        	e.printStackTrace();
        	back = file.getName() + "文件解析失败，错误原因：" + e.toString();
        	return back;
        }finally{
            if (file != null) {
                file.delete();
            }
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    
    /**
     * @desc 导入Bill_Info_Invoice和Bill_Info_Invoice_e的EXCLE文件
     * 		   这2个文件导入前做校验，如果存在错误则提示错误的定位
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String EXimportBillInfoInvoicexlsx(File file, String fileDate, String areaFlag, String fileName,
            EastFile eastFile) throws Exception {
        String back = "";
        InputStream is = null;
        Connection conn = null;
        Connection conn1 = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        int num = 0;
        //int rowNum = 2;//从第二行开始读取
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            List columList = new ArrayList();
            // 1、根据xlsx文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            // String fileName = file.getName().toUpperCase();// 文件名称
            rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME  from TB_TABLEINFO where FILE_NAME = '"+ fileName + "'  ORDER BY ORDNUM");
            while (rs.next()) {
                columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                tableName = rs.getString("TABLE_NAME");

            }
            eastFile.setTableName(tableName);
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columList.size();
          
            List<String[]> list = null;
            
            //解析文件，进行校验
            is = new FileInputStream(file);
    		List<String> err_list = new ArrayList<String>();
    		String err_msg = "文件   【" + fileName + "】 ";
    		String errmsg = null;
    		Workbook wb = null;
    		if (file.getName().toUpperCase().endsWith("XLSX")) {// 根据导入文件名称判断读取03还是10版excel
    			wb = new XSSFWorkbook(is);
    		} else {
    			wb = new HSSFWorkbook(is);
    		}
    		Sheet sheet = null;
    	    String sheetName = null;
    	    //存下对应行的页码。
    		if(fileName.startsWith("BILL_BNFO_INVOICE_E_")){
    			list = new ArrayList<String[]>();
    			for (int i = 0; i < wb.getNumberOfSheets(); i++) {
    				sheet = wb.getSheetAt(i);
    				int error_row = 1;
    				//Map<String,Integer> idMap = new HashMap<String,Integer>();
    				for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
    					String arr[] = new String[9];
    					if (!isBlankRow(sheet.getRow(rowNum))) {
    						Row row = sheet.getRow(rowNum);
    						error_row = rowNum + 1;
    						String tradDate = getCellStringValue(row.getCell(0)).trim();
	    					if(!"".equals(tradDate)){	
    							if (!isValidDate(tradDate)) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【交易日期】TRAD_DATE 格式错误，正确格式为\"年年年年月月日日\"！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[0] = tradDate;
    						String tradType = getCellStringValue(row.getCell(1)).trim();
    						if(!"".equals(tradType)){
	    						if (tradType.length() > 25) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【Type】 TRAD_TYPE 的长度不能超过25！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[1] = tradType;
    						String custNo = getCellStringValue(row.getCell(2)).trim();
    						if(!"".equals(custNo)){
	    						if (custNo.length() > 70) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户号码】CUST_NO 的长度不能超过70！";
	    							err_list.add(err_msg+errmsg);
	    						}else{
	    							String regex = "^[0-9]{3}-[0-9]{6}$";
	    							boolean bool = custNo.matches(regex);
	    							if(!bool){
	    								sheetName = sheet.getSheetName();
	    								errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户号码】CUST_NO 的格式错误，正确格式为\"XXX-XXXXXX\"！";
	        							err_list.add(err_msg+errmsg);
	    							}
	    						}
    						}
    						arr[2] = custNo;
    						String custName = getCellStringValue(row.getCell(3)).trim();
	    					if(!"".equals(custName)){	
    							if (getLength(custName) > 70) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户名称】CUST_NAME 的长度不能超过70！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[3] = custName;
    						String billNo = getCellStringValue(row.getCell(4)).trim();
	    					if(!"".equals(billNo)){	
    							if (billNo.length() > 60) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【票据号码】BILL_NO 的长度不能超过60！";
	    							err_list.add(err_msg+errmsg);
	    						} else {
	    							String regex = "^[^ ]+$";
	    							boolean bool = billNo.matches(regex);
	    							if(!bool){
	    								sheetName = sheet.getSheetName();
	    								errmsg = "sheet[" + sheetName + "]第" + error_row + "行【票据号码】BILL_NO 格式错误，数据中间不能有空格！";
	        							err_list.add(err_msg+errmsg);
	    							}
	    						}
	    					}
    						arr[4] = billNo;
    						String invoiceCode = getCellStringValue(row.getCell(5)).trim();
    						if(!"".equals(invoiceCode)){
	    						if (invoiceCode.length() > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票代码】INVOICE_CODE 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[5] = invoiceCode;
    						String invoiceNo = getCellStringValue(row.getCell(6)).trim();
    						if(!"".equals(invoiceNo)){
	    						if (invoiceNo.length() > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票号码】INVOICE_NO 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[6] = invoiceNo;
    						String serialNo = getCellStringValue(row.getCell(7)).trim();
	    					if(!"".equals(serialNo)){	
    							if (getLength(serialNo) > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【流水号】SERIAL_NO 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[7] = serialNo;
    						// 金额判断时要求必须为数字格式。可以是空字符串，但是不能为空格。
    						String invoiceAmt2 = getCellStringValue(row.getCell(8)).trim();	
    						if (!"".equals(invoiceAmt2)) {
    							if (!isNumber(invoiceAmt2)) {
    								sheetName = sheet.getSheetName();
    								errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票金额】INVOICE_AMT 的数据格式错误！";
    								err_list.add(err_msg+errmsg);
    							}
    						}
    						arr[8] = invoiceAmt2;
    						//放入list集合
    						list.add(arr);
    						//String pk = custNo+billNo+serialNo;//唯一主键
//    						if(idMap.containsKey(pk)){
//    							errmsg = "sheet[" + sheet.getSheetName() + "]第" + idMap.get(pk) + "行和sheet[" + sheet.getSheetName() + "]第" + error_row + "行"
//    									+ "唯一序列重复,请检查【 客户号码】CUST_NO,【 票据号码 】BILL_NO与【流水号】SERIAL_NO 是否重复！";
//    							err_list.add(err_msg+errmsg);
//    						}else{
//    							idMap.put(pk, error_row);
//    						}
    					}
    				}
    			}
    		}else{
    			list = new ArrayList<String[]>();
    			for (int i = 0; i < wb.getNumberOfSheets(); i++) {
    				sheet = wb.getSheetAt(i);
    				int error_row = 1;	
    				Map<String,Integer> idMap = new HashMap<String,Integer>();
    				for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
    					String arr[] = new String[15];
    					if (!isBlankRow(sheet.getRow(rowNum))) {
    						Row row = sheet.getRow(rowNum);
    						error_row = rowNum + 1;
    						String tradDate = getCellStringValue(row.getCell(0)).trim();
    						if(!"".equals(tradDate)){
	    						if (!isValidDate(tradDate)) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【交易日期】TRAD_DATE 格式错误，正确格式为\"年年年年月月日日\"！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[0] = tradDate;
    						String tradType = getCellStringValue(row.getCell(1)).trim();
	    					if(!"".equals(tradType)){	
    							if (tradType.length() > 25) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【Type】 TRAD_TYPE 的长度不能超过25！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[1] = tradType;
    						String custNo = getCellStringValue(row.getCell(2)).trim();
    						if(!"".equals(custNo)){
	    						if (custNo.length() > 70) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户号码】CUST_NO 的长度不能超过70！";
	    							err_list.add(err_msg+errmsg);
	    						} else {
	    							String regex = "^[0-9]{3}-[0-9]{6}$";
	    							boolean bool = custNo.matches(regex);
	    							if(!bool){
	    								sheetName = sheet.getSheetName();
	        							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户号码】CUST_NO 的格式错误，正确格式为\"XXX-XXXXXX\"！";
	        							err_list.add(err_msg+errmsg);
	    							}
	    						}
    						}
    						arr[2] = custNo;
    						String custName = getCellStringValue(row.getCell(3)).trim();
	    					if(!"".equals(custName)){
    							if (getLength(custName) > 70) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【客户名称】CUST_NAME 的长度不能超过70！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[3] = custName;
    						String billNo = getCellStringValue(row.getCell(4)).trim();
	    					if(!"".equals(billNo)){	
    							if (billNo.length() > 60) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【票据号码】BILL_NO 的长度不能超过60！";
	    							err_list.add(err_msg+errmsg);
	    						} else {
	    							String regex = "^[^ ]+$";
	    							boolean bool = billNo.matches(regex);
	    							if(!bool){
	    								sheetName = sheet.getSheetName();
	    								errmsg = "sheet[" + sheetName + "]第" + error_row + "行【票据号码】BILL_NO 格式错误，数据中间不能有空格！";
	        							err_list.add(err_msg+errmsg);
	    							}
	    						}
	    					}
    						arr[4] = billNo;
    						String issuDate = getCellStringValue(row.getCell(5)).trim();
    						if(!"".equals(issuDate)){
	    						if (!isValidDate(issuDate)) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【签发日期】ISSU_DATE 格式错误，正确格式为\"年年年年月月日日\"！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[5] = issuDate;
    						String drawerAcct = getCellStringValue(row.getCell(6)).trim();
	    					if(!"".equals(drawerAcct)){
    							if (drawerAcct.length() > 60) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【出票人账号】DRAWER_ACCT 的长度不能超过60！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[6] = drawerAcct;
    						String payBankName = getCellStringValue(row.getCell(7)).trim();
	    					if(!"".equals(payBankName)){	
    							if (getLength(payBankName) > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【付款行名称】 PAY_BANK_NAME 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[7] = payBankName;
    						String payeeName = getCellStringValue(row.getCell(8)).trim();
    						if(!"".equals(payeeName)){	
	    						if (getLength(payeeName) > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【收款人名称】PAYEE_NAME 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[8] = payeeName;
    						String payeeAcct = getCellStringValue(row.getCell(9)).trim();
    						if(!"".equals(payeeAcct)){
	    						if (payeeAcct.length() > 60) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【收款人账号】PAYEE_ACCT 的长度不能超过60！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[9] = payeeAcct;
    						String payeeOpenBank = getCellStringValue(row.getCell(10)).trim();
	    					if(!"".equals(payeeOpenBank)){
    							if (getLength(payeeOpenBank) > 72) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【收款人开户行】PAYEE_OPEN_BANK 的长度不能超过72！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[10] = payeeOpenBank;
    						String invoiceCode = getCellStringValue(row.getCell(11)).trim();
    						if(!"".equals(invoiceCode)){
	    						if (invoiceCode.length() > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票代码】INVOICE_CODE 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[11] = invoiceCode;
    						String invoiceNo = getCellStringValue(row.getCell(12)).trim();
	    					if(!"".equals(invoiceNo)){	
    							if (invoiceNo.length() > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票号码】INVOICE_NO 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
	    					}
    						arr[12] = invoiceNo;
    						String serialNo = getCellStringValue(row.getCell(13)).trim();
    						if(!"".equals(serialNo)){
	    						if (getLength(serialNo) > 200) {
	    							sheetName = sheet.getSheetName();
	    							errmsg = "sheet[" + sheetName + "]第" + error_row + "行【流水号】SERIAL_NO 的长度不能超过200！";
	    							err_list.add(err_msg+errmsg);
	    						}
    						}
    						arr[13] = serialNo;
    						// 金额判断时要求必须为数字格式。可以是空字符串，但是不能为空格。
    						String invoiceAmt2 = getCellStringValue(row.getCell(14)).trim();
    						if (!"".equals(invoiceAmt2)) {
    							if (!isNumber(invoiceAmt2)) {
    								sheetName = sheet.getSheetName();
    								errmsg = "sheet[" + sheetName + "]第" + error_row + "行【发票金额】INVOICE_AMT 的数据格式错误！";
    								err_list.add(err_msg+errmsg);
    							}
    						}
    						arr[14] = invoiceAmt2;
    						//放入list集合
    						list.add(arr);
    						String pk = custNo+billNo+serialNo;//唯一主键
    						if(idMap.containsKey(pk)){
    							errmsg = "sheet[" + sheet.getSheetName() + "]第" + idMap.get(pk) + "行和sheet[" + sheet.getSheetName() + "]第" + error_row + "行"
    									+ "唯一序列重复,请检查【 客户号码】CUST_NO,【 票据号码 】BILL_NO与【流水号】SERIAL_NO 是否重复！";
    							err_list.add(err_msg+errmsg);
    						}else{
    							idMap.put(pk, error_row);
    						}
    					}
    				}
    			}
    			
    		}
    		if(!err_list.isEmpty()){//数据校验没通过
    			//StringBuffer buf = new StringBuffer();
    			for(String str : err_list){
    				//buf.append(str+"\r\n");
    				back = back+str+"<br/>";
    			}
    			return back;
    		}else{//通过数据校验
    			if (list == null) {
                    back = "【" + file.getName() + "】文件没有可用的数据！";
                    return back;
                }
                String deleteSql = null;
                String insertSql = null;
                //2、导入前删除数据，根据ETL_DATE和DATA_FLAG
                deleteSql = "delete from " + tableName + " where ETL_DATE = '" + fileDate + "' and DATA_FLAG = '"+ areaFlag + "'";
                st.executeUpdate(deleteSql);
                // 3、拼接insert语句
                insertSql = "insert into " + tableName + " ( ETL_DATE,DATA_FLAG,";
                StringBuffer insertSQL = new StringBuffer(insertSql);
                // 循环写入导入的字段名称
                for (int j = 1; j <= count; j++) {
                    if (j < count) {
                        insertSQL.append(columList.get(j - 1) + ",");
                    } else {
                        if (StringUtils.isEmpty(areaFlag)) {
                            insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "',");
                        } else {
                            insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "','" + areaFlag
                                    + "',");
                        }
                    }
                }
                for (int j = 1; j <= count; j++) {
                    if (j < count) {
                        insertSQL.append("? ,");
                    } else {
                        insertSQL.append("? )");
                    }
                }
                conn1 = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
                pstInsert = conn1.prepareStatement(insertSQL.toString());
                conn1.setAutoCommit(false);
                // 4、插入excle文件的值
        	    for (int i = 0; i < list.size(); i++) {
        	      num++;
                  String[] record = list.get(i);
                  for (int j = 1; j <= count; j++) {
                      pstInsert.setString(j, record[j - 1]);
                  }
                  pstInsert.addBatch();
                  if (num % 2000 == 0) {
                	  pstInsert.executeBatch();
                      conn1.commit();
                  }
                }
        	    pstInsert.executeBatch();
                conn1.commit();
                eastFile.setDataNum(new BigDecimal(num));
                if(StringUtils.isEmpty(back)){
                	System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
                }
                return back;
    		}
    		
            
        }
//        catch(BatchUpdateException e){//唯一索引冲突无法准确报出行数，先不用
//        	e.printStackTrace();
//        	if(num==0){
//        		return file.getName() + "文件解析失败，错误原因：" + e.toString();
//        	}else{
//        		for(int xxxx:e.getUpdateCounts()){
//        			System.out.println("执行结果："+xxxx);
//        		}
//        		rowNum = rowNum + e.getUpdateCounts().length; //e.getUpdateCounts().length从0开始
//        		return file.getName() + "文件第【"+rowNum+"】行解析失败，错误原因：" + e.toString();
//        	}
//        }
        catch (Exception e) {
//       	 	if(e.toString().indexOf("org.xml.sax.SAXException: java.lang.ArrayIndexOutOfBoundsException")!=-1){
//       	 		String[] str = e.toString().split(":");
//       	 		int i = Integer.parseInt(str[2].split(",")[0].trim())+1;
//       	       	back = file.getName() + "文件解析失败，错误原因："+i+"列数据超过限定！";
//       	       	return back;
//       	 	}else{
	       	 	e.printStackTrace();
	        	back = file.getName() + "文件解析失败，错误原因：" + e.toString();
	        	return back;
//       	 	}
        }finally{
            if (file != null) {
                file.delete();
            }
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn1 != null) {
                conn1.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    /**
     * @desc excel获取岗位对应的权限
     * @return
     * @throws Exception
     * @throws CommonException
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static String TXTimport(File file, String fileDate, String areaFlag, String fileName,
            EastFile eastFile) throws Exception {
        String back = "";
        InputStream is = null;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement pstInsert = null;
        try {
            conn = SessionFactoryUtils.getDataSource(ROOTDAOUtils.getROOTDAO().getSessionFactory()).getConnection();
            List columList = new ArrayList();
            // 1、根据xlsx文件名称获取对应的表名和相应的字段（将文件日期etl_date的顺序放在最后）
            String tableName = null;
            st = conn.createStatement();
            rs = st.executeQuery("select TABLE_NAME,COLUMN_NAME  from TB_TABLEINFO where FILE_NAME = '" + fileName + "'  ORDER BY ORDNUM");
            while (rs.next()) {
                columList.add(rs.getString("COLUMN_NAME")); // 将字段按顺序放入list中
                tableName = rs.getString("TABLE_NAME");
            }
            eastFile.setTableName(tableName);
            if (tableName == null) {
                back = "【" + file.getName() + "】文件不在导入文件范围内，请确认文件名称是否正确！";
                return back;
            }
            int count = columList.size();
            List<String[]> list = XLSXCovertCSVReader.readerTXT(file, count);
            if (list == null||list.size()==0) {
                back = "【" + file.getName() + "】文件没有可用的数据！";
                return back;
            }
            String deleteSql = null;
            String insertSql = null;
            deleteSql = "delete from " + tableName + " where ETL_DATE = '" + fileDate + "' and DATA_FLAG = '"+ areaFlag + "'";
            st.executeUpdate(deleteSql);
            // 3、拼接insert语句
            insertSql = "insert into " + tableName + " ( ETL_DATE,DATA_FLAG,";
            StringBuffer insertSQL = new StringBuffer(insertSql);
            // 循环写入导入的字段名称
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append(columList.get(j - 1) + ",");
                } else {
                    insertSQL.append(columList.get(j - 1) + ") values ('" + fileDate + "','" + areaFlag+ "',");
                }
            }
            for (int j = 1; j <= count; j++) {
                if (j < count) {
                    insertSQL.append("? ,");
                } else {
                    insertSQL.append("? )");
                }
            }
            pstInsert = conn.prepareStatement(insertSQL.toString());
            // 4、插入excle文件的值
            int num = 0;
            for (int i = 0; i < list.size(); i++) {
            	num++;
                String[] record = list.get(i);
                for (int j = 1; j <= count; j++) {
                    pstInsert.setString(j, record[j - 1].trim());
                }
//                try{//多行报错，先注释需要再加
              	  pstInsert.executeUpdate();
//                }  catch (Exception e) { 
//                	e.printStackTrace();
//	              	if(num==0){
//	              		back = back + file.getName() + "文件解析失败，错误原因：" + e.toString()+"<br/>"; 
//	              	}else{
//	              		int rowNum = 2+num;//文件从第二行开始读
//	              		back = back + file.getName() + "文件第【"+num+"】行解析失败，错误原因：" + e.toString()+"<br/>"; 
//	              	}
//               }
            }
            eastFile.setDataNum(new BigDecimal(num));
            if(StringUtils.isEmpty(back)){
            	System.out.println("======成功读取文件【" + file.getName() + "】，共导入数据" + num + "条========" + new Date()+ "=========");
            }
            return back;
        } catch (Exception e) {
            throw new Exception(file.getName() + "文件解析失败，错误原因：" + e.toString());
        } finally {
            if (file != null) {
                file.delete();
            }
            if (pstInsert != null) {
                pstInsert.close();// 及时关闭PreparedStatement，防止超出打开游标的最大数
            }
            if (is != null) {
                is.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    // 转换数据格式
    private static String getValue(Cell cell) {
    	if(cell!=null){
    		 if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
	            return String.valueOf(cell.getBooleanCellValue());
	        }else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
	            return String.valueOf(cell.getNumericCellValue());
	        }else if (cell.getCellType() == cell.CELL_TYPE_FORMULA){//A1411_667691209HBCB HBCB20170930.xls文件最后一列为公式，将其转换为数值
	        	return String.valueOf(cell.getNumericCellValue());
	        }else {
	            return String.valueOf(cell.getStringCellValue());
	        }
    	}else{
    		return "";
    	}
    }

    // excle转成csv后每个单元格字符都加了"",此处去除前后的"
    private static String getValue(String record) {
        if (record != null && record.length() > 0) {
            if ("\"".equals(record.substring(0, 1)) && "\"".equals(record.substring(record.length() - 1))) {
                record = record.substring(1, record.length() - 1);
            }
        }
        return record;
    }
    
    // 判断整行是否为空
 	public static boolean isBlankRow(Row row) {
 		if (row == null)
 			return true;
 		boolean result = true;
 		for (int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {
 			Cell cell = row.getCell(i, Row.RETURN_BLANK_AS_NULL);
 			String value = "";
 			if (cell != null) {
 				switch (cell.getCellType()) {
 				case HSSFCell.CELL_TYPE_STRING:
 					value = cell.getStringCellValue();
 					break;
 				case HSSFCell.CELL_TYPE_NUMERIC:
 					value = String.valueOf((int) cell.getNumericCellValue());
 					break;
 				case HSSFCell.CELL_TYPE_BOOLEAN:
 					value = String.valueOf(cell.getBooleanCellValue());
 					break;
 				case HSSFCell.CELL_TYPE_FORMULA:
 					value = String.valueOf(cell.getCellFormula());
 					break;
 				// case Cell.CELL_TYPE_BLANK:
 				// break;
 				default:
 					break;
 				}

 				if (!value.trim().equals("")) {
 					result = false;
 					break;
 				}
 			}
 		}
 		return result;
 	}
 	
 	public static String getCellStringValue(Cell cell) {
		String cellValue = "";

		if (cell != null) {
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_STRING:// 字符串类型
				cellValue = cell.getStringCellValue();
				if (cellValue.trim().equals("") || cellValue.trim().length() <= 0)
					cellValue = "";
				break;
			case HSSFCell.CELL_TYPE_NUMERIC: // 数值类型
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					cellValue = sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString();
				} else {
					//这里将无论何种数字格式都识别为String 
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);					
//					cellValue = String.valueOf(cell.getNumericCellValue());
					cellValue = cell.getStringCellValue().trim();//得到值
				}
				break;
			case HSSFCell.CELL_TYPE_FORMULA: // 公式
				//cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
				//cellValue = String.valueOf(cell.getNumericCellValue());
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				cellValue = cell.getStringCellValue().trim();//得到值
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				break;
			default:
				break;
			}
			return cellValue.replaceAll(String.valueOf((char) 160), "");
		} else {
			return cellValue;
		}
	}
 	
 	//判断是int类型的字符串或者double类型的字符串。
	public static boolean isNumber(String str){
		String reg = "^-?[0-9]+(.[0-9]+)?$";
		return str.matches(reg);
	}
	
	/**
	 * 判断参数的格式是否为“yyyyMMdd”格式的合法日期字符串
	 * 
	 */
	public static boolean isValidDate(String str) {
		boolean boo = true;
		if(str.length()!=8){
			return boo = false;
		}else{
			SimpleDateFormat sfm = new SimpleDateFormat("yyyyMMdd");
			try{
				Date date = sfm.parse(str);
				return boo = true;
			}catch(Exception e){
				e.printStackTrace();
				return boo = false;
			}
		}
	}
	
	/**
	 * 上传文件字段中汉字占几个字节
	 * @param str
	 * @return
	 */
	public static int getLength(String str){
		int length = 0;
		for (int i = 0; i < str.length(); i++) {
			int ascii = Character.codePointAt(str, i);
			if (ascii >= 0 && ascii <= 255) {
				length++;
			} else {
				length += 2;
			}
		}
		return length;
	}
}
