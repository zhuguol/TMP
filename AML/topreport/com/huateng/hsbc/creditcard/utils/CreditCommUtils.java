package com.huateng.hsbc.creditcard.utils;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.ROOTDAO;
import com.huateng.ebank.business.common.ROOTDAOUtils;
import com.huateng.ebank.entity.data.mng.DataDic;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.report.common.service.ReportCommonService;

public class CreditCommUtils {
	private static Log log = LogFactory.getLog(CreditCommUtils.class);
	
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static boolean isEmpty(String str) {
		if(str==null||"".equals(str.trim())) {
			return true;
		}else {
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str) {
		if(str==null||"".equals(str.trim())) {
			return false;
		}else {
			return true;
		}
	}
	
	public static boolean strEqual(String str1,String str2) {
		if(isEmpty(str1)&&isEmpty(str2)){
			return true;
		}else if(str1!=null&&str1.equals(str2)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * null判断
	 */
	public static String isNull(String str){
		if(str==null){
			return "";
		}
		return str;
	}
	
	/**
	 * Intger null判断
	 */
	public static int isNullIntger(BigDecimal b){
		if(b==null){
			return 0;
		}
		DecimalFormat df = new DecimalFormat("0");
		return Integer.parseInt(df.format(b));
	}
	
	/**
	 * BigDecimal null判断
	 */
	public static String isNullBigDecimal(BigDecimal b,int num){
		if(b==null){
			return "";
		}
		if(num>=0){
			StringBuffer rule = new StringBuffer("0.");
			for(int i=0;i<num;i++){
				rule.append("0");
			}
			DecimalFormat df = new DecimalFormat(rule.toString());
			return String.valueOf(df.format(b));
		}else{
			return String.valueOf(b);
		}
	}
	
	/**
	 * null判断  时间装换
	 */
	public static String isNullTime(String date){
		if(date==null){
			return "";
		}
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			Date d = sdf1.parse(date);
			return sdf2.format(d);
		} catch (ParseException e) {
			return date;
		}
	}
	
	public static String getLimitWorkDate(ROOTDAO rootDao) throws CommonException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int interval = Integer.parseInt(ReportCommonService.getInstance().getSysparamsByPk("ALERT", "SHOWDAY").getParamVal());
		String sql = "select a.natural_date from AML_SSHLDYP a where a.natural_date<=sysdate and a.is_holiday='0' order by a.natural_date desc";
		List list = rootDao.queryListBySql(sql);
		Timestamp time = (Timestamp) list.get(interval-1);
		return sdf.format(time.getTime());
	}
	
	public static String getLastWorkDate(ROOTDAO rootDao) throws CommonException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String sql = "select a.natural_date from AML_SSHLDYP a where a.natural_date<=sysdate and a.is_holiday='0' order by a.natural_date desc";
		List list = rootDao.queryListBySql(sql);
		Timestamp time = (Timestamp) list.get(1);
		return sdf.format(time.getTime());
	}
	
	public static boolean isWorkDate(ROOTDAO rootDao,String date) throws CommonException{
		String sql = "select a.natural_date from AML_SSHLDYP a where a.natural_date = to_date('"+date+"','yyyymmdd') and a.is_holiday='0'";
		List list = rootDao.queryListBySql(sql);
		if(list==null||list.size()==0){
			return false;
		}else{
			return true;
		}
	}
	
	public static String getLimitWorkDateForAutoExtract(ROOTDAO rootDao) throws CommonException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int interval = Integer.parseInt(ReportCommonService.getInstance().getSysparamsByPk("ALERT", "SHOWDAY").getParamVal());
		String sql = "select a.natural_date from AML_SSHLDYP a where a.natural_date<=sysdate and a.is_holiday='0' order by a.natural_date desc";
		List list = rootDao.queryListBySql(sql);
		Timestamp time = (Timestamp) list.get(interval);
		return sdf.format(time.getTime());
	}
	
	public static Map<String, List<Object>> compareFields(Object obj1,Object obj2, String[] compareArr) {

		try {

			Map<String, List<Object>> map = new HashMap<String, List<Object>>();
			List<String> compareList = null;
			if (compareArr != null && compareArr.length > 0) {
				// array转化为list
				compareList = Arrays.asList(compareArr);
			}else{
				return null;
			}
			if (obj1.getClass() == obj2.getClass()) {// 只有两个对象都是同一类型的才有可比性
				Class clazz = obj1.getClass();
				// 获取object的属性描述
				PropertyDescriptor[] pds = Introspector.getBeanInfo(clazz,Object.class).getPropertyDescriptors();
				for (PropertyDescriptor pd : pds) {// 这里就是所有的属性了
					String name = pd.getName();// 属性名
					if (!compareList.contains(name)) {// 如果当前属性选择忽略比较，跳到下一次循环
						continue;
					}
					Method readMethod = pd.getReadMethod();// get方法
					// 在obj1上调用get方法等同于获得obj1的属性值
					Object o1 = readMethod.invoke(obj1);
					// 在obj2上调用get方法等同于获得obj2的属性值
					Object o2 = readMethod.invoke(obj2);
					
					if(o1 instanceof String||o2 instanceof String){
						if(isEmpty((String)o1)&&isEmpty((String)o2)){
							continue;
						}
					}
					
					if (o1 == null && o2 == null) {
						continue;
					} else if (o1 == null && o2 != null) {
						List<Object> list = new ArrayList<Object>();
						list.add(o1);
						list.add(o2);
						map.put(name, list);
						continue;
					}
					if (!o1.equals(o2)) {// 比较这两个值是否相等,不等就可以放入map了
						List<Object> list = new ArrayList<Object>();
						list.add(o1);
						list.add(o2);
						map.put(name, list);
					}
				}
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	/**
	 * 导出的数据字典项转换
	 */
	public static String getDataDic(String dataNo, String dataTypeNo) {
		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		String dataName = null;
		if (StringUtils.isEmpty(dataNo) || StringUtils.isEmpty(dataTypeNo)) {
			return dataNo;
		}
		String hql = "from DataDic where dataTypeNo = '" + dataTypeNo+ "' and dataNo ='" + dataNo + "'";
		List<DataDic> list = null;
		try {
			list = rootdao.queryByQL2List(hql);
		} catch (CommonException e) {
//			e.printStackTrace();
			log.error("getDataDic异常",e);
		}
		if (list.size() > 0) {
			dataName = list.get(0).getDataName();
		} else {
			dataName = dataNo;
		}
		return dataName;
	}
	
	public static String getQueryExportUserId() throws CommonException {
		GlobalInfo gi = GlobalInfo.getCurrentInstance();
		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		String sql = " SELECT A.FUNCID FROM TLR_ROLE_REL T LEFT JOIN ROLE_FUNC_REL A ON T.ROLE_ID = A.ROLE_ID WHERE T.TLRNO = '" + gi.getTlrno()+"'";
		List<String> list = rootdao.queryListBySql(sql);
		
		String[] qcqa = ReportCommonService.getInstance().getSysparamsByPk("CREDITCARD", "TODO_QCQA").getParamVal().split(",");
		//信用卡审核
		for(int i=0;i<qcqa.length;i++){
			if(list.contains(qcqa[i])){
				return "Y";
			}
		}
		
		String[] todosuper = ReportCommonService.getInstance().getSysparamsByPk("CREDITCARD", "TODO_SUPER").getParamVal().split(",");
		//SUPER
		for(int i=0;i<todosuper.length;i++){
			if(list.contains(todosuper[i])){
				return "Y";
			}
		}
		
		return "N";
	}
	
	public static List<Integer> getRandomIndex(int all,int need){
		List<Integer> result = new ArrayList<Integer>();
		if(need>=all){
			for(int i=0;i<need;i++){
				result.add(i);
			}
		}else{
			SecureRandom r = new SecureRandom();
			while(result.size()<need){
				int index = r.nextInt(all);
				if(!result.contains(index)){
					result.add(index);
				}
			}
		}
		return result;
	}
	
	public static String xssEncode(String s) {
		if (s == null || s.isEmpty()) {
			return s;
		}
		StringBuilder sb = new StringBuilder(s.length() + 16);
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			switch (c) {
			case '>':
				break;
			case '<':
				break;
			case '\'':
				break;
			case '\"':
				break;
			case '&':
				break;
			case '\\':
				break;
			case '#':
				break;
			default:
				sb.append(c);
				break;
			}
		}
		return sb.toString();
	}
}
