package com.js.application.action;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import qlight.util.page.Page;

import com.js.application.model.TableDescribe;
import com.js.application.service.ExcelToDocService;
import com.js.base.actioin.BaseAction;
import com.js.util.ExportDoc;
import com.js.util.PageModel;

/**
 * 将excel中的数据，转换为doc模板样式并导出
 * @author superC
 *
 */
public class ExcelToDocAction extends BaseAction{

//	private static final String EXCEL_PATH = "";//excel文件
	
	private String excelPath;
	private List<String> tbList;//所需表标识符集合
	
	private String result;//返回结果
	
	//调用读取Excel方法，获取所需数据
	private ReadExcel readExcel = new ReadExcel();
	
	private ExcelToDocService etdService;
	
	/**
	 * 将excel中，我们所需的数据存储至数据库
	 *	
	 */
	public String saveData(){
		
		if(excelPath!=""){
			if(tbList!=null){
				/*
				 * 获取所有所需的数据
				 */
				List<TableDescribe> tableDesList = readExcel.readXls(excelPath,tbList);
				/*
				 * 保存至数据库 
				 */
				result = etdService.saveData(tableDesList);
			}else{
				result = "4";//表标识符不能为空
			}
		}else{
			result = "3";//excel路径不能为空
		}
		//保存
		if(result.equals(1)){
			return "toTableIdentList";
		}else{
			return "toInsertIdent";
		}
	}
	
	
	/**
	 * 获取excel数据
	 */
	public Map<String, Object> gextEcelData(){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		/*
		 * 获取所有所需的数据
		 */
		List<TableDescribe> tableDesList = readExcel.readXls(excelPath,tbList);
		
		
		dataMap.put("name", null);
		dataMap.put("tableName", null);
		dataMap.put("sheelList", null);
		return dataMap;
	}
	
	
	/**
	 * 导出doc文件
	 */
	public void expWordFile(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		/*
		 * 创建文件夹，准备生成doc文件
		 */
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(new Date()).replace("-", "");
        //设置文件需要上传到的路径
        String pathStr = "/file/doc/" + date;
        //获取全路径
		String realPath = request.getSession().getServletContext().getRealPath(pathStr);
		File dir = new File(realPath);
		if (!dir.exists()) {
			dir.mkdirs();
        }
		String docName = UUID.randomUUID().toString().trim().replaceAll("-", "");
		String filePath =realPath+"/"+ docName+".doc";
		
		/*
		 * 获取数据
		 */
		Map<String, Object> dataMap = gextEcelData();
		
		/*
		 * 调用工具类，创建doc
		 */
		ExportDoc exp = new ExportDoc();
		exp.createDoc("ssksjwd.xml", filePath, dataMap);//--创建doc
		
		/*
		 * 导出doc文件
		 */
		
		
	}
	

	public String toInsertIdent(){
		return "toInsertIdent";
	}
	
	public String toTableIdentList(){
		return "toTableIdentList";
	}

	/**
	 * 获取列表数据（分页）
	 * pm 分页参数
	 * sm 查询参数
	 */
	public void tdListPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		PageModel pm = new PageModel();
		pm.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pm.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
		pm.setSort(request.getParameter("sort"));
		pm.setOrder(request.getParameter("order"));
		
		Map<String, String> sm = new HashMap<String, String>();
		sm.put("ti", request.getParameter("ti"));
		sm.put("tnm", request.getParameter("tnm"));
		
		Page<TableDescribe> p = etdService.getAllTableDescribe(pm,sm);
		pm.setTotal(p.getTotalCount());
		pm.setRows(p.getResult());
		
		writeJson(response, pm);
	}

	/**
	 * ajax输出字符串
	 * 
	 * @param param
	 */
	protected void print(String param) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.print(param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pw.flush();
			pw.close();
		}
	}

	/*
	 * getter/setter
	 */
	
	public List<String> getTbList() {
		return tbList;
	}

	public String getExcelPath() {
		return excelPath;
	}


	public void setExcelPath(String excelPath) {
		this.excelPath = excelPath;
	}


	public void setTbList(List<String> tbList) {
		this.tbList = tbList;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public ExcelToDocService getEtdService() {
		return etdService;
	}

	public void setEtdService(ExcelToDocService etdService) {
		this.etdService = etdService;
	}

}
