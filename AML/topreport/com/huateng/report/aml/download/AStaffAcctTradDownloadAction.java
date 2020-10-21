package com.huateng.report.aml.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import resources.bean.report.form.AStaffAcctTrad;
import resources.bean.report.form.AStaffAcctTradInfo;
import resources.bean.report.form.AStaffAcctTradM;

import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.ROOTDAO;
import com.huateng.ebank.business.common.ROOTDAOUtils;
import com.huateng.ebank.framework.util.DataFormat;
import com.huateng.ebank.framework.util.ExceptionUtil;
import com.huateng.ebank.framework.util.WebDownloadFile;
import com.huateng.ebank.framework.web.servlet.BaseServlet;
import com.huateng.excel.imp.DataMyUtil;
import com.huateng.report.utils.ReportUtils;

public class AStaffAcctTradDownloadAction extends BaseServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		Connection connect = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			this.init(request);
			//交易起始日期
			String etlDateStart = null;
			//交易结束日期
			String etlDateEnd = null;
			//客户号
            String custNo = null;
            //客户名称/姓名
            String custName = null;
            //客户身份证件号码
            String custIdCertNo = null;
            //调查阶段
            String statuss = null;
            //告警号
            String alertIds = null;
            //分行号
            String branCodes = null;
            //员工编号
            String staffNumbers = null;
            //记录状态
            String approveStatuss = null;
            //20200824 add
            //上报起始日期
            String reportDateStart = null;
            //上报结束日期
            String reportDateEnd = null;
            //(初步调查)上报的可疑类型
            String potentialCaseTypes = null;
            //(收到反馈)判定的可疑类型
            String concludedTypes = null;
			//获取文件存放路径
			String path = ReportUtils.getSysParamsValue("Downoload", "AML");
			//下载模板名称
            String tableName = URLDecoder.decode(request.getParameter("tableName") == null ? "" : request.getParameter("tableName"),"UTF-8");
            String alertIdFlag = URLDecoder.decode(request.getParameter("arraySelected") == null ? "" : request.getParameter("arraySelected"),"UTF-8");
            //将数组转换成集合
            List alertIdList = new ArrayList();
            if(!"".equals(alertIdFlag.trim())){
            	String[] alertIdStrArr = alertIdFlag.split(",");
            	for(int i = 0; i < alertIdStrArr.length ; i++){
            		if(!"".equals(alertIdStrArr[i].trim())){
            			alertIdList.add(alertIdStrArr[i]);
            		}
            	}
            }
            if("AStaffAcctTrad".equals(tableName) || "AStaffAcctTradM".equals(tableName)){
            	//交易起始日期
    			etlDateStart = URLDecoder.decode(request.getParameter("etlDateStart") == null ? "" : request.getParameter("etlDateStart"),"UTF-8");
    			//交易结束日期
    			etlDateEnd = URLDecoder.decode(request.getParameter("etlDateEnd") == null ? "" : request.getParameter("etlDateEnd"),"UTF-8");
    			//客户号
                custNo = URLDecoder.decode(request.getParameter("custNo") == null ? "" : request.getParameter("custNo"),"UTF-8");
                //客户名称/姓名
                custName = URLDecoder.decode(request.getParameter("custName") == null ? "" : request.getParameter("custName"),"UTF-8");
                //客户身份证件号码
                custIdCertNo = URLDecoder.decode(request.getParameter("custIdCertNo") == null ? "" : request.getParameter("custIdCertNo"),"UTF-8");
                //调查阶段
                statuss = URLDecoder.decode(request.getParameter("statuss") == null ? "" : request.getParameter("statuss"),"UTF-8");
                //告警号
                alertIds = URLDecoder.decode(request.getParameter("alertIds") == null ? "" : request.getParameter("alertIds"),"UTF-8");
                //分行号
                branCodes = URLDecoder.decode(request.getParameter("branCodes") == null ? "" : request.getParameter("branCodes"),"UTF-8");
                //员工编号
                staffNumbers = URLDecoder.decode(request.getParameter("staffNumbers") == null ? "" : request.getParameter("staffNumbers"),"UTF-8");
                //记录状态
                approveStatuss = URLDecoder.decode(request.getParameter("approveStatuss") == null ? "" : request.getParameter("approveStatuss"),"UTF-8");
                //20200824 add
                //上报起始日期
                reportDateStart = URLDecoder.decode(request.getParameter("reportDateStart") == null ? "" : request.getParameter("reportDateStart"),"UTF-8");
                //上报结束日期
                reportDateEnd = URLDecoder.decode(request.getParameter("reportDateEnd") == null ? "" : request.getParameter("reportDateEnd"),"UTF-8");
                //(初步调查)上报的可疑类型
                potentialCaseTypes = URLDecoder.decode(request.getParameter("potentialCaseTypes") == null ? "" : request.getParameter("potentialCaseTypes"),"UTF-8");
                //(收到反馈)判定的可疑类型
                concludedTypes = URLDecoder.decode(request.getParameter("concludedTypes") == null ? "" : request.getParameter("concludedTypes"),"UTF-8");
            }
            //获取系统时间
            String currentTime = DataMyUtil.getFullDateTime();
            //截取前14位，yyyyMMddHHmmss
			currentTime = currentTime.substring(0,14);
			InputStream is = null;
			if("AStaffAcctTrad".equals(tableName) || "AStaffAcctTradTaskNew".equals(tableName)){
				is = this.getClass().getClassLoader().getResourceAsStream("AStaffAcctTrad.xlsx");//获取模板文件
			}else{
				is = this.getClass().getClassLoader().getResourceAsStream("AStaffAcctTradM.xlsx");//获取模板文件
			}
			String destFileName = null;
			if("AStaffAcctTrad".equals(tableName)){
				destFileName = path + "filetmp/员工交易监测调研日报"+ currentTime + ".xlsx";
			}else if("AStaffAcctTradM".equals(tableName)){
				destFileName = path + "filetmp/员工交易监测调研月报"+ currentTime + ".xlsx";
			}else if("AStaffAcctTradTaskNew".equals(tableName)){
				destFileName = path + "filetmp/员工交易监测日报管理"+ currentTime + ".xlsx";
			}else{//AStaffAcctTradMTaskNew
				destFileName = path + "filetmp/员工交易监测月报管理"+ currentTime + ".xlsx";
			}
			
			File file = new File(destFileName);
			copyFile(is, file, true);
			List<Object> beanList = writeExcel(file, etlDateStart, etlDateEnd, custNo, custName, custIdCertNo, statuss, alertIds, branCodes, staffNumbers, approveStatuss, reportDateStart, reportDateEnd, potentialCaseTypes, concludedTypes,alertIdList, tableName);//填充XLSX文件
			WebDownloadFile.downloadFile(resp, file, file.getName());
			//修改记录状态，保存下载用户信息
			ROOTDAO rootDao = ROOTDAOUtils.getROOTDAO();
			GlobalInfo gInfo = GlobalInfo.getCurrentInstance();
			if("AStaffAcctTrad".equals(tableName)){
				AStaffAcctTrad bean = null;
				for(int i= 0; i < beanList.size(); i++){
					bean = (AStaffAcctTrad)beanList.get(i);
					if(!DataFormat.isEmpty(bean.getStaffNumber())){//员工编号不能为空
						if("00".equals(bean.getApproveStatus())){//未处理	
							bean.setApproveStatus("01");//已下载
							bean.setRecordUpdTlr(gInfo.getTlrno());
			    			bean.setRecordUpdTm(currentTime);
			    			rootDao.update(bean);
						}else{
							bean.setRecordUpdTm(currentTime);
			    			rootDao.update(bean);
						}
					}
				}
			}
			if("AStaffAcctTradM".equals(tableName)){
				AStaffAcctTradM beans = null;
				for(int i= 0; i < beanList.size(); i++){
					beans = (AStaffAcctTradM)beanList.get(i);
					if(!DataFormat.isEmpty(beans.getStaffNumber())){//员工编号不能为空
						if("00".equals(beans.getApproveStatus())){//未处理,直接设置-调查者-初步调查日期-记录修改人-记录修改时间-记录状态为已调研
							beans.setApproveStatus("01");//已下载
							beans.setRecordUpdTlr(gInfo.getTlrno());
				    		beans.setRecordUpdTm(currentTime);
				    		rootDao.update(beans);
						}else{//已下载,直接设置-调查者-初步调查日期-记录状态为已调研
							beans.setRecordUpdTm(currentTime);
				    		rootDao.update(beans);
						}
					}
				}
			}
			//用于监控页面加载圈
            ServletContext serContext = this.getServletContext();
			String tlrno = gInfo.getTlrno();
			if("AStaffAcctTrad".equals(tableName)){
				serContext.setAttribute(tableName +"_"+tlrno, "员工交易监测调研日报");
			}else if("AStaffAcctTradM".equals(tableName)){
				serContext.setAttribute(tableName +"_"+tlrno, "员工交易监测调研月报");
			}else if("AStaffAcctTradTaskNew".equals(tableName)){
				serContext.setAttribute(tableName +"_"+tlrno, "员工交易监测日报管理");
			}else{//AStaffAcctTradMTaskNew
				serContext.setAttribute(tableName +"_"+tlrno, "员工交易监测月报管理");
			}
	    	if(file != null){
	            file.delete();  
	        }
		}catch(Exception e){
			e.printStackTrace();
            String errMsg = e.toString();
            request.setAttribute("errormsg", errMsg);
            request.getRequestDispatcher("/common/error.jsp").forward(request, resp);
            resp.sendRedirect(request.getContextPath() + "/common/error.jsp");
		}finally{
        	if(rs!=null){
        		try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        	} 
        	if(st!=null){
        		try {
					st.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        	} 
        	if(connect!=null){
        		try {
					connect.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        	} 
        }
	}
			
    public static List<Object> writeExcel(File file, String etlDateStart, String etlDateEnd, String custNo, String custName, String custIdCertNo, String statuss, String alertIds, String branCodes, String staffNumbers, String approveStatuss, String reportDateStart, String reportDateEnd, String potentialCaseTypes, String concludedTypes,List alertIdList, String tableName)throws Exception {
    	InputStream is = new FileInputStream(file);
    	XSSFWorkbook workbook = new XSSFWorkbook(is); 
    	List<Object> beanList = null;
    	beanList = AStaffAcctTradDownloadAction.getAStaffAcctTradList(etlDateStart, etlDateEnd, custNo, custName, custIdCertNo, statuss, alertIds, branCodes, staffNumbers, approveStatuss, reportDateStart, reportDateEnd, potentialCaseTypes, concludedTypes, alertIdList, tableName);
    	//获取客户交易信息
    	List<Object> beanListInfo = AStaffAcctTradDownloadAction.getAStaffAcctTradInfoList(beanList,tableName);
    	for(int j = 0; j < workbook.getNumberOfSheets(); j++){
    		Sheet sheet = workbook.getSheetAt(j);
    		if("日报客户信息".equals(sheet.getSheetName().toString())){
    			AStaffAcctTrad bean = null;
    			//填充单元格  行和列都从0开始		
    	    	for(int i= 0; i < beanList.size(); i++){
    	    		bean = (AStaffAcctTrad)beanList.get(i);
    	    		Row row = sheet.createRow(i + 1);
    	    		row.createCell(0).setCellValue(bean.getDataDate() == null ? "" : bean.getDataDate());//交易日期
    	    		row.createCell(1).setCellValue(bean.getAlertId() == null ? "" : bean.getAlertId());//告警号
    	    		row.createCell(2).setCellValue(bean.getRuleCode() == null ? "" : bean.getRuleCode());//规则代码
    	    		row.createCell(3).setCellValue(bean.getBranCode() == null ? "" : bean.getBranCode());//分行号
    	    		row.createCell(4).setCellValue(bean.getCustNo() == null ? "" : bean.getCustNo());//客户号
	    			row.createCell(5).setCellValue(bean.getCustName() == null ? "" : bean.getCustName());//客户姓名/名称
	    			row.createCell(6).setCellValue(bean.getCustIdCertNo() == null ? "" : bean.getCustIdCertNo());//客户身份证件/证明文件号码
	    			row.createCell(7).setCellValue(bean.getCtnt() == null ? "" : bean.getCtnt());//客户国籍
	    			row.createCell(8).setCellValue(bean.getCtar() == null ? "" : bean.getCtar());//客户住址/经营地址 (C1,C2,C3,P1,P2,P3,W1)
	    			row.createCell(9).setCellValue(bean.getStaffNumber() == null ? "" : bean.getStaffNumber());//员工编号
	    			row.createCell(10).setCellValue(bean.getStaffDepartment() == null ? "" : bean.getStaffDepartment());//员工所在部门
	    			row.createCell(11).setCellValue(bean.getStaffJobTitle() == null ? "" : bean.getStaffJobTitle());//员工职位名称
	    			
	    			if("AStaffAcctTrad".equals(tableName)){//操作员下载
		    			if("00".equals(bean.getApproveStatus())){
		    				row.createCell(12).setCellValue(GlobalInfo.getCurrentInstance().getTlrno());//记录修改人
		    			}else if("01".equals(bean.getApproveStatus()) || "02".equals(bean.getApproveStatus())
		    					|| "03".equals(bean.getApproveStatus()) || "04".equals(bean.getApproveStatus())
		    					|| "05".equals(bean.getApproveStatus())){
		    				row.createCell(12).setCellValue(bean.getRecordUpdTlr()==null?"":bean.getRecordUpdTlr());//记录修改人
		    			}
	    			}else{//任务分派下载
	    				row.createCell(12).setCellValue(bean.getRecordUpdTlr()==null?"":bean.getRecordUpdTlr());//记录修改人
	    			}
	    			
	    			row.createCell(13).setCellValue(("D".equals(bean.getReportDOrM().trim()))==true?"D-日报":"M-月报");//日报/月报
	    			row.createCell(14).setCellValue(bean.getAppearanceTime() == null ? "" : bean.getAppearanceTime());//(日报当月/月报当季)被抓出次数
	    			row.createCell(15).setCellValue(bean.getCheckDate() == null ? "" : bean.getCheckDate());//初步调查日期
	    			row.createCell(16).setCellValue(bean.getInvestigator() == null ? "" : bean.getInvestigator());//调查者
	    			
	    			if("00".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("00-OPS结案");//调查阶段
	    			}else if("01".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("01-已上报FCTM");//调查阶段
	    			}else if("02".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("02-FCTM结案");//调查阶段
	    			}else if("03".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("03-已上报GB/GF 指定部门");//调查阶段
	    			}else if("04".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("04-GB/GF 指定部门结案");//调查阶段
	    			}else{
	    				row.createCell(17).setCellValue("");//调查阶段
	    			}
	    			
	    			row.createCell(18).setCellValue(bean.getManagerName() == null ? "" : bean.getManagerName());//直线经理姓名
	    			row.createCell(19).setCellValue(bean.getInvesResultByOps() == null ? "" : bean.getInvesResultByOps());//初步调查结论(by OPS)
	    			row.createCell(20).setCellValue(bean.getCaseId() == null ? "" : bean.getCaseId());//上报案件编号
	    			row.createCell(21).setCellValue(bean.getReportDate() == null ? "" : bean.getReportDate());//上报日期
	    			
	    			if("00".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("00-FCR");//(初步调查)上报的可疑类型
	    			}else if("01".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("01-Misconduct");//(初步调查)上报的可疑类型
	    			}else if("02".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("02-SAFE");//(初步调查)上报的可疑类型
	    			}else{
	    				row.createCell(22).setCellValue("");//(初步调查)上报的可疑类型
	    			}
	    			
	    			row.createCell(23).setCellValue(bean.getFeedbackDate() == null ? "" : bean.getFeedbackDate());//收到反馈时间
	    			
	    			if("00".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("00-FCR");//(收到反馈)判定的可疑类型
	    			}else if("01".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("01-Misconduct");//(收到反馈)判定的可疑类型
	    			}else if("02".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("02-SAFE");//(收到反馈)判定的可疑类型
	    			}else{
	    				row.createCell(24).setCellValue("");//(收到反馈)判定的可疑类型
	    			}
	    			
	    			row.createCell(25).setCellValue(bean.getFeedbackFrom() == null ? "" : bean.getFeedbackFrom());//反馈结果(从FCTM或者GB/GF指定部门)
	    			
	    			if("00".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("00-Y:FCTM");//是否判定可疑(及由哪方判定)
	    			}else if("01".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("01-Y:GB/GF 指定部门");//是否判定可疑(及由哪方判定)
	    			}else if("02".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("02-N");//是否判定可疑(及由哪方判定)
	    			}else{
	    				row.createCell(26).setCellValue("");//是否判定可疑(及由哪方判定)
	    			}
	    			
	    			row.createCell(27).setCellValue(bean.getAlterUar() == null ? "" : bean.getAlterUar());//反馈案件编号
	    			
	    			if("AStaffAcctTrad".equals(tableName)){//操作员下载
		    			if("00".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("01".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("02".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("02-已调研");//记录状态-已调研
		    			}else if("03".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("03-自查审核成功");//记录状态-自查审核成功
		    			}else if("04".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("04-审核失败(重新调研)");//记录状态-审核失败，重新调研
		    			}else if("05".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("05-自查已调研");//记录状态-自查已调研
		    			}
	    			}else{//任务分派下载
	    				if("00".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("00-未处理");//记录状态-未处理
		    			}else if("01".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("02".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("02-已调研");//记录状态-已调研
		    			}else if("03".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("03-自查审核成功");//记录状态-自查审核成功
		    			}else if("04".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("04-审核失败(重新调研)");//记录状态-审核失败，重新调研
		    			}else if("05".equals(bean.getApproveStatus())){
		    				row.createCell(28).setCellValue("05-自查已调研");//记录状态-自查已调研
		    			}
	    			}
	    			
	    			row.createCell(29).setCellValue(bean.getQcComment() == null ? "" : bean.getQcComment());//质检意见
	    			row.createCell(30).setCellValue(bean.getApproveUpdTlr() == null ? "" : bean.getApproveUpdTlr());//审核人员
	    		}
    		}else if("月报客户信息".equals(sheet.getSheetName().toString())){
    			AStaffAcctTradM bean = null;
    			//填充单元格  行和列都从0开始		
    	    	for(int i= 0; i < beanList.size(); i++){
    	    		bean = (AStaffAcctTradM)beanList.get(i);
    	    		Row row = sheet.createRow(i + 1);
    	    		row.createCell(0).setCellValue(bean.getDataDate() == null ? "" : bean.getDataDate());//交易日期
    	    		row.createCell(1).setCellValue(bean.getAlertId() == null ? "" : bean.getAlertId());//告警号
    	    		row.createCell(2).setCellValue(bean.getRuleCode() == null ? "" : bean.getRuleCode());//规则代码
    	    		row.createCell(3).setCellValue(bean.getBranCode() == null ? "" : bean.getBranCode());//分行号
    	    		row.createCell(4).setCellValue(bean.getCustNo() == null ? "" : bean.getCustNo());//客户号
	    			row.createCell(5).setCellValue(bean.getCustName() == null ? "" : bean.getCustName());//客户姓名/名称
	    			row.createCell(6).setCellValue(bean.getCustIdCertNo() == null ? "" : bean.getCustIdCertNo());//客户身份证件/证明文件号码
	    			row.createCell(7).setCellValue(bean.getCtnt() == null ? "" : bean.getCtnt());//客户国籍
	    			row.createCell(8).setCellValue(bean.getCtar() == null ? "" : bean.getCtar());//客户住址/经营地址 (C1,C2,C3,P1,P2,P3,W1)
	    			row.createCell(9).setCellValue(bean.getStaffNumber() == null ? "" : bean.getStaffNumber());//员工编号
	    			row.createCell(10).setCellValue(bean.getStaffDepartment() == null ? "" : bean.getStaffDepartment());//员工所在部门
	    			row.createCell(11).setCellValue(bean.getStaffJobTitle() == null ? "" : bean.getStaffJobTitle());//员工职位名称
	    			
	    			if("AStaffAcctTradM".equals(tableName)){//操作员下载
		    			if("00".equals(bean.getApproveStatus())){
		    				row.createCell(12).setCellValue(GlobalInfo.getCurrentInstance().getTlrno());//记录修改人
		    			}else if("01".equals(bean.getApproveStatus()) || "02".equals(bean.getApproveStatus())
		    					|| "03".equals(bean.getApproveStatus()) || "04".equals(bean.getApproveStatus())
		    					|| "05".equals(bean.getApproveStatus())){
		    				row.createCell(12).setCellValue(bean.getRecordUpdTlr());//记录修改人
		    			}
	    			}else{//任务分派下载
	    				row.createCell(12).setCellValue(bean.getRecordUpdTlr()==null?"":bean.getRecordUpdTlr());//记录修改人
	    			}
	    			
	    			row.createCell(13).setCellValue(("D".equals(bean.getReportDOrM().trim()))==true?"D-日报":"M-月报");//日报/月报
	    			row.createCell(14).setCellValue(bean.getAppearanceTime() == null ? "" : bean.getAppearanceTime());//(日报当月/月报当季)被抓出次数
	    			row.createCell(15).setCellValue(bean.getCheckDate() == null ? "" : bean.getCheckDate());//初步调查日期
	    			row.createCell(16).setCellValue(bean.getInvestigator() == null ? "" : bean.getInvestigator());//调查者
	    			
	    			if("00".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("00-OPS结案");//调查阶段
	    			}else if("01".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("01-已上报FCTM");//调查阶段
	    			}else if("02".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("02-FCTM结案");//调查阶段
	    			}else if("03".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("03-已上报GB/GF 指定部门");//调查阶段
	    			}else if("04".equals(bean.getStatus())){
	    				row.createCell(17).setCellValue("04-GB/GF 指定部门结案");//调查阶段
	    			}else{
	    				row.createCell(17).setCellValue("");//调查阶段
	    			}
	    			
	    			row.createCell(18).setCellValue(bean.getManagerName() == null ? "" : bean.getManagerName());//直线经理姓名
	    			row.createCell(19).setCellValue(bean.getInvesResultByOps() == null ? "" : bean.getInvesResultByOps());//初步调查结论
	    			row.createCell(20).setCellValue(bean.getCaseId() == null ? "" : bean.getCaseId());//上报案件编号
	    			row.createCell(21).setCellValue(bean.getReportDate() == null ? "" : bean.getReportDate());//上报日期
	    			
	    			if("00".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("00-FCR");//(初步调查)上报的可疑类型
	    			}else if("01".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("01-Misconduct");//(初步调查)上报的可疑类型
	    			}else if("02".equals(bean.getPotentialCaseType())){
	    				row.createCell(22).setCellValue("02-SAFE");//(初步调查)上报的可疑类型
	    			}else{
	    				row.createCell(22).setCellValue("");//(初步调查)上报的可疑类型
	    			}
	    			
	    			row.createCell(23).setCellValue(bean.getFeedbackDate() == null ? "" : bean.getFeedbackDate());//收到反馈时间
	    			
	    			if("00".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("00-FCR");//(收到反馈)判定的可疑类型
	    			}else if("01".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("01-Misconduct");//(收到反馈)判定的可疑类型
	    			}else if("02".equals(bean.getConcludedType())){
	    				row.createCell(24).setCellValue("02-SAFE");//(收到反馈)判定的可疑类型
	    			}else{
	    				row.createCell(24).setCellValue("");//(收到反馈)判定的可疑类型
	    			}
	    			
	    			row.createCell(25).setCellValue(bean.getFeedbackFrom() == null ? "" : bean.getFeedbackFrom());//反馈结果(从FCTM或者GB/GF指定部门)
	    			
	    			if("00".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("00-Y:FCTM");//是否判定可疑(及由哪方判定)
	    			}else if("01".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("01-Y:GB/GF 指定部门");//是否判定可疑(及由哪方判定)
	    			}else if("02".equals(bean.getComfirmedSusp())){
	    				row.createCell(26).setCellValue("02-N");//是否判定可疑(及由哪方判定)
	    			}else{
	    				row.createCell(26).setCellValue("");//是否判定可疑(及由哪方判定)
	    			}
	    			
	    			row.createCell(27).setCellValue(bean.getAlterUar() == null ? "" : bean.getAlterUar());//反馈案件编号
	    			row.createCell(28).setCellValue(bean.getAlterFlag() == null ? "" : bean.getAlterFlag());//当月日报上报案件编号
	    			
	    			if("AStaffAcctTradM".equals(tableName)){//操作员下载
		    			if("00".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("01".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("02".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("02-已调研");//记录状态-已调研
		    			}else if("03".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("03-自查审核成功");//记录状态-自查审核成功
		    			}else if("04".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("04-审核失败(重新调研)");//记录状态-审核失败，重新调研
		    			}else if("05".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("05-自查已调研");//记录状态-自查已调研
		    			}
	    			}else{
	    				if("00".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("00-未处理");//记录状态-未处理
		    			}else if("01".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("01-已下载");//记录状态-已下载
		    			}else if("02".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("02-已调研");//记录状态-已调研
		    			}else if("03".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("03-自查审核成功");//记录状态-自查审核成功
		    			}else if("04".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("04-审核失败(重新调研)");//记录状态-审核失败，重新调研
		    			}else if("05".equals(bean.getApproveStatus())){
		    				row.createCell(29).setCellValue("05-自查已调研");//记录状态-自查已调研
		    			}
	    			}
	    			
	    			row.createCell(30).setCellValue(bean.getQcComment() == null ? "" : bean.getQcComment());//质检意见
	    			row.createCell(31).setCellValue(bean.getApproveUpdTlr() == null ? "" : bean.getApproveUpdTlr());//审核人员
    	    	}
    		}else if("日报交易信息".equals(sheet.getSheetName().toString())){
    			AStaffAcctTradInfo beanInfo = null;
    			AStaffAcctTrad bean = null;
    			//填充单元格  行和列都从0开始		
    	    	for(int i = 0; i < beanListInfo.size(); i++){
    	    		Row row = sheet.createRow(i + 1);
    	    		beanInfo = (AStaffAcctTradInfo)beanListInfo.get(i);
    	    		for(int a = 0; a < beanList.size(); a++){
    	    			bean = (AStaffAcctTrad)beanList.get(a);
    	    			if(beanInfo.getAlertId().equals(bean.getAlertId())){
    	    				row.createCell(0).setCellValue(bean.getDataDate() == null ? "" : bean.getDataDate());//交易日期
    	    	    		row.createCell(1).setCellValue(bean.getAlertId() == null ? "" : bean.getAlertId());//告警号
    	    	    		row.createCell(2).setCellValue(bean.getRuleCode() == null ? "" : bean.getRuleCode());//规则代码
    	    	    		row.createCell(3).setCellValue(bean.getBranCode() == null ? "" : bean.getBranCode());//分行号
    	    	    		row.createCell(4).setCellValue(bean.getCustNo() == null ? "" : bean.getCustNo());//客户号
    		    			row.createCell(5).setCellValue(bean.getCustName() == null ? "" : bean.getCustName());//客户姓名/名称
    		    			row.createCell(6).setCellValue(bean.getCustIdCertNo() == null ? "" : bean.getCustIdCertNo());//客户身份证件/证明文件号码
    		    			row.createCell(7).setCellValue(bean.getCtnt() == null ? "" : bean.getCtnt());//客户国籍
    		    			row.createCell(8).setCellValue(bean.getCtar() == null ? "" : bean.getCtar());//客户住址/经营地址 (C1,C2,C3,P1,P2,P3,W1)
    		    			row.createCell(9).setCellValue(bean.getStaffNumber() == null ? "" : bean.getStaffNumber());//员工编号
    		    			row.createCell(10).setCellValue(bean.getStaffDepartment() == null ? "" : bean.getStaffDepartment());//员工所在部门
    		    			row.createCell(11).setCellValue(bean.getStaffJobTitle() == null ? "" : bean.getStaffJobTitle());//员工职位名称
    		    			row.createCell(12).setCellValue(beanInfo.getBussFlag() == null ? "" : beanInfo.getBussFlag());//业务标识
    		    			row.createCell(13).setCellValue(beanInfo.getAcctType() == null ? "" : beanInfo.getAcctType());//客户账户类型
    		    			row.createCell(14).setCellValue(beanInfo.getAcctNo() == null ? "" : beanInfo.getAcctNo());//客户账号
    		    			row.createCell(15).setCellValue(beanInfo.getBankCardType() == null ? "" : beanInfo.getBankCardType());//客户银行卡类型
    		    			row.createCell(16).setCellValue(beanInfo.getBankCardNo() == null ? "" : beanInfo.getBankCardNo());//客户银行卡号码
    	    	    		row.createCell(17).setCellValue(beanInfo.getTstm() == null ? "" : beanInfo.getTstm());//交易发生日期
    	    	    		row.createCell(18).setCellValue(beanInfo.getTradPlace() == null ? "" : beanInfo.getTradPlace());//交易发生地
    	    	    		row.createCell(19).setCellValue(beanInfo.getPayMatchNoType() == null ? "" : beanInfo.getPayMatchNoType());//收付款方匹配号码类型
    	    	    		row.createCell(20).setCellValue(beanInfo.getTradType() == null ? "" : beanInfo.getTradType());//交易方式
    	    	    		row.createCell(21).setCellValue(beanInfo.getNonCotrTradType() == null ? "" : beanInfo.getNonCotrTradType());//非柜台交易方式
    	    	    		row.createCell(22).setCellValue(beanInfo.getNonCotrTradTypeCode() == null ? "" : beanInfo.getNonCotrTradTypeCode());//非柜台交易方式的设备代码
    	    	    		row.createCell(23).setCellValue(beanInfo.getFundPayFlag() == null ? "" : beanInfo.getFundPayFlag());//资金收付标志
    	    	    		row.createCell(24).setCellValue(beanInfo.getFundPayPurpos() == null ? "" : beanInfo.getFundPayPurpos());//资金用途
    	    	    		row.createCell(25).setCellValue(beanInfo.getCcyCd() == null ? "" : beanInfo.getCcyCd());//交易币种
    	    	    		row.createCell(26).setCellValue(Double.parseDouble(beanInfo.getTradAmt() == null?"0": beanInfo.getTradAmt().toString()));//交易金额
    	    	    		row.createCell(27).setCellValue(Double.parseDouble(beanInfo.getCnyTradAmt() == null?"0": beanInfo.getCnyTradAmt().toString()));//交易金额(折人民币)
    	    	    		row.createCell(28).setCellValue(beanInfo.getOpsFinaOrgName() == null ? "" : beanInfo.getOpsFinaOrgName());//对方金融机构网点名称
    		    			row.createCell(29).setCellValue(beanInfo.getOpsFinaOrgAreaCode() == null ? "" : beanInfo.getOpsFinaOrgAreaCode());//对方金融机构网点行政区划代码
    		    			row.createCell(30).setCellValue(beanInfo.getTradAdvsName() == null ? "" : beanInfo.getTradAdvsName());//交易对手姓名/名称
    		    			row.createCell(31).setCellValue(beanInfo.getTradAdvsIdCertNo() == null ? "" : beanInfo.getTradAdvsIdCertNo());//交易对手身份证件/证明文件号码
    		    			row.createCell(32).setCellValue(beanInfo.getTradAdvsAcctNo() == null ? "" : beanInfo.getTradAdvsAcctNo());//交易对手账号
    		    			row.createCell(33).setCellValue(beanInfo.getTbnm() == null ? "" : beanInfo.getTbnm());//交易代办人姓名
    		    			row.createCell(34).setCellValue(beanInfo.getTbid() == null ? "" : beanInfo.getTbid());//交易代办人身份证件/证明文件号码
    		    			break;
    	    			}
    	    		}
	    		}
    		}else if("月报交易信息".equals(sheet.getSheetName().toString())){
    			AStaffAcctTradInfo beanInfo = null;
    			AStaffAcctTradM bean = null;
    			//填充单元格  行和列都从0开始		
    	    	for(int i = 0; i < beanListInfo.size(); i++){
    	    		Row row = sheet.createRow(i + 1);
    	    		beanInfo = (AStaffAcctTradInfo)beanListInfo.get(i);
    	    		for(int a = 0; a < beanList.size(); a++){
    	    			bean = (AStaffAcctTradM)beanList.get(a);
    	    			if(beanInfo.getAlertId().equals(bean.getAlertId())){
    	    				row.createCell(0).setCellValue(bean.getDataDate() == null ? "" : bean.getDataDate());//交易日期
    	    	    		row.createCell(1).setCellValue(bean.getAlertId() == null ? "" : bean.getAlertId());//告警号
    	    	    		row.createCell(2).setCellValue(bean.getRuleCode() == null ? "" : bean.getRuleCode());//规则代码
    	    	    		row.createCell(3).setCellValue(bean.getBranCode() == null ? "" : bean.getBranCode());//分行号
    	    	    		row.createCell(4).setCellValue(bean.getCustNo() == null ? "" : bean.getCustNo());//客户号
    		    			row.createCell(5).setCellValue(bean.getCustName() == null ? "" : bean.getCustName());//客户姓名/名称
    		    			row.createCell(6).setCellValue(bean.getCustIdCertNo() == null ? "" : bean.getCustIdCertNo());//客户身份证件/证明文件号码
    		    			row.createCell(7).setCellValue(bean.getCtnt() == null ? "" : bean.getCtnt());//客户国籍
    		    			row.createCell(8).setCellValue(bean.getCtar() == null ? "" : bean.getCtar());//客户住址/经营地址 (C1,C2,C3,P1,P2,P3,W1)
    		    			row.createCell(9).setCellValue(bean.getStaffNumber() == null ? "" : bean.getStaffNumber());//员工编号
    		    			row.createCell(10).setCellValue(bean.getStaffDepartment() == null ? "" : bean.getStaffDepartment());//员工所在部门
    		    			row.createCell(11).setCellValue(bean.getStaffJobTitle() == null ? "" : bean.getStaffJobTitle());//员工职位名称
    		    			row.createCell(12).setCellValue(beanInfo.getBussFlag() == null ? "" : beanInfo.getBussFlag());//业务标识
    		    			row.createCell(13).setCellValue(beanInfo.getAcctType() == null ? "" : beanInfo.getAcctType());//客户账户类型
    		    			row.createCell(14).setCellValue(beanInfo.getAcctNo() == null ? "" : beanInfo.getAcctNo());//客户账号
    		    			row.createCell(15).setCellValue(beanInfo.getBankCardType() == null ? "" : beanInfo.getBankCardType());//客户银行卡类型
    		    			row.createCell(16).setCellValue(beanInfo.getBankCardNo() == null ? "" : beanInfo.getBankCardNo());//客户银行卡号码
    	    	    		row.createCell(17).setCellValue(beanInfo.getTstm() == null ? "" : beanInfo.getTstm());//交易发生日期
    	    	    		row.createCell(18).setCellValue(beanInfo.getTradPlace() == null ? "" : beanInfo.getTradPlace());//交易发生地
    	    	    		row.createCell(19).setCellValue(beanInfo.getPayMatchNoType() == null ? "" : beanInfo.getPayMatchNoType());//收付款方匹配号码类型
    	    	    		row.createCell(20).setCellValue(beanInfo.getTradType() == null ? "" : beanInfo.getTradType());//交易方式
    	    	    		row.createCell(21).setCellValue(beanInfo.getNonCotrTradType() == null ? "" : beanInfo.getNonCotrTradType());//非柜台交易方式
    	    	    		row.createCell(22).setCellValue(beanInfo.getNonCotrTradTypeCode() == null ? "" : beanInfo.getNonCotrTradTypeCode());//非柜台交易方式的设备代码
    	    	    		row.createCell(23).setCellValue(beanInfo.getFundPayFlag() == null ? "" : beanInfo.getFundPayFlag());//资金收付标志
    	    	    		row.createCell(24).setCellValue(beanInfo.getFundPayPurpos() == null ? "" : beanInfo.getFundPayPurpos());//资金用途
    	    	    		row.createCell(25).setCellValue(beanInfo.getCcyCd() == null ? "" : beanInfo.getCcyCd());//交易币种
    	    	    		row.createCell(26).setCellValue(Double.parseDouble(beanInfo.getTradAmt() == null?"0": beanInfo.getTradAmt().toString()));//交易金额
    		    			row.createCell(27).setCellValue(Double.parseDouble(beanInfo.getCnyTradAmt() == null?"0": beanInfo.getCnyTradAmt().toString()));//交易金额(折人民币)
    		    			row.createCell(28).setCellValue(beanInfo.getOpsFinaOrgName() == null ? "" : beanInfo.getOpsFinaOrgName());//对方金融机构网点名称
    		    			row.createCell(29).setCellValue(beanInfo.getOpsFinaOrgAreaCode() == null ? "" : beanInfo.getOpsFinaOrgAreaCode());//对方金融机构网点行政区划代码
    		    			row.createCell(30).setCellValue(beanInfo.getTradAdvsName() == null ? "" : beanInfo.getTradAdvsName());//交易对手姓名/名称
    		    			row.createCell(31).setCellValue(beanInfo.getTradAdvsIdCertNo() == null ? "" : beanInfo.getTradAdvsIdCertNo());//交易对手身份证件/证明文件号码
    		    			row.createCell(32).setCellValue(beanInfo.getTradAdvsAcctNo() == null ? "" : beanInfo.getTradAdvsAcctNo());//交易对手账号
    		    			row.createCell(33).setCellValue(beanInfo.getTbnm() == null ? "" : beanInfo.getTbnm());//交易代办人姓名
    		    			row.createCell(34).setCellValue(beanInfo.getTbid() == null ? "" : beanInfo.getTbid());//交易代办人身份证件/证明文件号码
    		    			break;
    	    			}
    	    		}
	    		}
    		}
    	}
    	
	    FileOutputStream fileOut = new FileOutputStream(file);
	    workbook.write(fileOut);
	    try{
	    	workbook.close();
	    	fileOut.close();
	    }catch(Exception e2) {
	    	e2.printStackTrace();
	    }
		return beanList;
    }
    	
    @SuppressWarnings("unused")
    private static int excelColStrToNum(String colStr) {
    	int num = 0;
    	int result = 0;
    	int length = colStr.length();
    	for (int i = 0; i < length; i++) {
    		char ch = colStr.charAt(length - i - 1);
    		num = (int) (ch - 'A' + 1);
    		num *= Math.pow(26, i);
    		result += num;
    	}
    	return result;
    }
    	
    public static boolean copyFile(String srcFileName, File destFile, boolean overlay){
    	File srcFile = new File(srcFileName);
    	//判断源文件是否存在
    	if(!srcFile.exists()){
    		return false;
    	}else if (!srcFile.isFile()){
    		return false;
    	}
    	//判断目标文件是否存在
    	if(destFile.exists()){
    	 //如果目标文件存在并允许覆盖
    		if(overlay) {
    			// 删除已经存在的目标文件，无论目标文件是目录还是单个文件
    			destFile.delete();
    		}
    	}else{
    		//如果目标文件所在目录不存在，则创建目录
    		if(!destFile.getParentFile().exists()) {
    			//目标文件所在目录不存在
    			if(!destFile.getParentFile().mkdirs()) {
    				//复制文件失败：创建目标文件所在目录失败
    				return false;
    			}
    		}
    	}
    	//复制文件
    	int byteread = 0; //读取的字节数
    	InputStream in = null;
    	OutputStream out = null;
    	try{
    		in = new FileInputStream(srcFile);
    		out = new FileOutputStream(destFile);
    		byte[] buffer = new byte[1024];
    		while ((byteread = in.read(buffer)) != -1) {
    			out.write(buffer, 0, byteread);
    		}
    		return true;
    	}catch (FileNotFoundException e) {
    		return false;
    	}catch (IOException e) {
    		return false;
    	}finally{
    		try{
    			if(out != null)
    				out.close();
    			if(in != null)
    				in.close();
    		}catch(IOException e) {
    			e.printStackTrace();
    		}
    	}
    }
    	
    //复制模板	
    public static boolean copyFile(InputStream in, File destFile, boolean overlay){
    	if(destFile.exists()){
    		//如果目标文件存在并允许覆盖
    		if(overlay){
    			//删除已经存在的目标文件，无论目标文件是目录还是单个文件
    			destFile.delete();
    		}
    	}else{
    		//如果目标文件所在目录不存在，则创建目录
    		if(!destFile.getParentFile().exists()){
    			//目标文件所在目录不存在
    			if(!destFile.getParentFile().mkdirs()){
    				//复制文件失败：创建目标文件所在目录失败
    				return false;
    			}
    		}
    	}
    	//复制文件
    	int byteread = 0;//读取的字节数
    	OutputStream out = null;
    	try{
    		out = new FileOutputStream(destFile);
    		byte[] buffer = new byte[1024];
    		while ((byteread = in.read(buffer)) != -1){
    			out.write(buffer, 0, byteread);
    		}
    		return true;
    	}catch(FileNotFoundException e){
    		return false;
    	}catch(IOException e){
    		return false;
    	}finally{
    		try {
    			if(out != null){
    				out.close();
    			}
    			if(in != null){
    				in.close();
    			}
    		}catch(IOException e){
    			e.printStackTrace();
    		}
    	}
    }
    
    //获取客户信息数据集
    @SuppressWarnings("unchecked")
	public static List<Object> getAStaffAcctTradList(String etlDateStart, String etlDateEnd, String custNo, String custName, String custIdCertNo, String statuss, String alertIds, String branCodes, String staffNumbers, String approveStatuss, String reportDateStart, String reportDateEnd, String potentialCaseTypes, String concludedTypes, List alertIdList, String tableName) throws Exception {
		ROOTDAO rootDao = ROOTDAOUtils.getROOTDAO();
		List<String> condList = new ArrayList<String>();
		List<Object> beanList = new ArrayList<Object>();
		StringBuffer sql = null;
		if("AStaffAcctTrad".equals(tableName) || "AStaffAcctTradTaskNew".equals(tableName)){
			sql = new StringBuffer("from AStaffAcctTrad where 1=1 ");
		}else{
			sql = new StringBuffer("from AStaffAcctTradM where 1=1 ");
		}
		if(!alertIdList.isEmpty()){
			sql.append(" and alertId in ( ");
			for(int i = 0; i < alertIdList.size(); i ++){
				if(i < alertIdList.size() - 1){
					sql.append("?,");
					condList.add(alertIdList.get(i).toString());
				}else{
					sql.append("? )");
					condList.add(alertIdList.get(i).toString());
				}
			}
			if("AStaffAcctTrad".equals(tableName) || "AStaffAcctTradM".equals(tableName)){
				sql.append(" and (approveStatus = '00' or recordUpdTlr = ?)");
				condList.add(GlobalInfo.getCurrentInstance().getTlrno());
			}
		}else{
			//防止员工交易监测管理走这个方法
			if("AStaffAcctTradTaskNew".equals(tableName)){//防止员工交易监测管理走这个方法
				ExceptionUtil.throwCommonException("员工交易监测日报管理数据下载失败！");
			}else if("AStaffAcctTradMTaskNew".equals(tableName)){
				ExceptionUtil.throwCommonException("员工交易监测月报管理数据下载失败！");
			}
			//交易起始日期
			if(!DataFormat.isEmpty(etlDateStart)){
				sql.append(" AND dataDate >= ? ");
				condList.add(etlDateStart);
			}
			//交易结束日期
			if(!DataFormat.isEmpty(etlDateEnd)){
				sql.append(" AND dataDate <= ? ");
				condList.add(etlDateEnd);
			}
			//客户号
			if(!DataFormat.isEmpty(custNo)){
				sql.append(" AND custNo like ? ");
				condList.add("%" + custNo + "%");
			}
            //客户名称/姓名
			if(!DataFormat.isEmpty(custName)){
				sql.append(" AND upper(custName) like ? ");
				condList.add("%" + custName.toUpperCase() + "%");
			}
            //客户身份证件号码
			if(!DataFormat.isEmpty(custIdCertNo)){
				sql.append(" AND custIdCertNo like ? ");
				condList.add("%" + custIdCertNo + "%");
			}
			//调查阶段
            if(!DataFormat.isEmpty(statuss)){
				sql.append(" AND status = ? ");
				condList.add(statuss);
			}
            //告警号
            if(!DataFormat.isEmpty(alertIds)){
            	sql.append(" AND alertId like ? ");
				condList.add("%" + alertIds + "%");
			}
            //分行号
            if(!DataFormat.isEmpty(branCodes)){
            	sql.append(" AND branCode = ? ");
				condList.add(branCodes);
			}
            //员工编号
            if("01".equals(staffNumbers)){//01-员工编号存在
    			sql.append(" AND staffNumber is not null ");
    		}else if("00".equals(staffNumbers)){//00-员工编号不存在
    			sql.append(" AND staffNumber is null ");
    		}//02-全部，员工编号不管是否存在
            //记录状态
            if(!DataFormat.isEmpty(approveStatuss)){
				sql.append(" AND approveStatus = ? ");
				condList.add(approveStatuss);
				if(!"00".equals(approveStatuss)){
					sql.append(" AND recordUpdTlr = ? ");
					condList.add(GlobalInfo.getCurrentInstance().getTlrno());
				}
			}else{
				sql.append(" AND (approveStatus = '00' or recordUpdTlr = ?)");
				condList.add(GlobalInfo.getCurrentInstance().getTlrno());
			}
            //20200824 add
            //上报起始日期
            if(!DataFormat.isEmpty(reportDateStart)){
            	sql.append(" AND reportDate >= ? ");
				condList.add(reportDateStart);
			}
            //上报结束日期
            if(!DataFormat.isEmpty(reportDateEnd)){
            	sql.append(" AND reportDate <= ? ");
				condList.add(reportDateEnd);
			}
            //(初步调查)上报的可疑类型
            if(!DataFormat.isEmpty(potentialCaseTypes)){
            	sql.append(" AND potentialCaseType = ? ");
				condList.add(potentialCaseTypes);
			}
            //(收到反馈)判定的可疑类型
            if(!DataFormat.isEmpty(concludedTypes)){
            	sql.append(" AND concludedType = ? ");
				condList.add(concludedTypes);
			}
            sql.append(" order by dataDate asc , alertId asc ");
		}
		beanList = rootDao.queryByCondition(sql.toString(), condList.toArray());
		return beanList;
	}
    
    //获取客户交易信息数据集
    @SuppressWarnings("unchecked")
	public static List<Object> getAStaffAcctTradInfoList(List<Object> beanList, String tbName) throws Exception {
    	ROOTDAO rootDao = ROOTDAOUtils.getROOTDAO();
    	List<String> list = new ArrayList<String>();
    	List<String> condList = new ArrayList<String>();
    	List<Object> tradInfoList = new ArrayList<Object>();
    	AStaffAcctTrad bean = null;
    	AStaffAcctTradM beanM = null;
    	if(!beanList.isEmpty()){
	    	for(int i= 0; i < beanList.size(); i++){
	    		if("AStaffAcctTrad".equals(tbName) || "AStaffAcctTradTaskNew".equals(tbName)){
	    			bean = (AStaffAcctTrad)beanList.get(i);
	    			list.add(bean.getAlertId());
	    		}else{
	    			beanM = (AStaffAcctTradM)beanList.get(i);
	    			list.add(beanM.getAlertId());
	    		}
	    	}
	    	StringBuffer sql = new StringBuffer("from AStaffAcctTradInfo where 1=1 ");
	    	sql.append(" and alertId in ( ");
			for(int i = 0; i < list.size(); i ++){
				if(i < list.size() - 1){
					sql.append("?,");
					condList.add(list.get(i).toString());
				}else{
					sql.append("? )");
					condList.add(list.get(i).toString());
				}
			}
			tradInfoList = rootDao.queryByCondition(sql.toString(), condList.toArray());
    	}
		return tradInfoList;
	}
}