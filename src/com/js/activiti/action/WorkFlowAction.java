package com.js.activiti.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.apache.struts2.ServletActionContext;

import com.js.activiti.service.WorkFlowService;
import com.js.base.actioin.BaseAction;
import com.js.util.ActivitiUtils;
import com.js.util.PageModel;

/**
 * 工作流
 * @author superC
 *
 */
public class WorkFlowAction extends BaseAction{
	
	
	private File file;
	private String fileName;
	private String deploymentName;//部署流程名称
	
	private String result;
	private WorkFlowService workFlowService;
	public ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	
	
	/**
	 * 部署流程列表管理
	 */
	public String deployProcessList(){
		return "toDeployList";
	}
	
	/**
	 * 查询部署对象列表 （表act_re_deployment）
	 * pm 分页参数
	 * sm 查询参数
	 */
	public void deploymentPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		PageModel pm = new PageModel();
		pm.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pm.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
		
		Map<String, String> sm = new HashMap<String, String>();
		
		List<Deployment> list = workFlowService.deploymentPage(pm,sm);
		
		pm.setTotal(list.size());
		pm.setRows(list);
		
		writeJson(response, pm);
	}
	
	public void processDefinitionPage(){
		
	}
	
	/**
	 * 上传流程文件，部署流程
	 */
	public String deploy(){
		ZipInputStream zipInputStream;
		try {
			zipInputStream = new ZipInputStream(new FileInputStream(file));
			processEngine.getRepositoryService()//与流程定义和部署对象相关的Service
				.createDeployment()//创建一个部署对象
				.name(deploymentName)//添加部署的名称
				.addZipInputStream(zipInputStream)//指定zip格式的文件完成部署
				.deploy();//完成部署
			result = "1";
		} catch (FileNotFoundException e) {
			result = "2";
			e.printStackTrace();
		}
		return "toDeployList";
	}
	
	/**
	 * 任务列表管理
	 */
	public String taskList(){
		return "toTaskList";
	}

	
	
	/**
	 * getter/setter
	 */
	
	public WorkFlowService getWorkFlowService() {
		return workFlowService;
	}

	public void setWorkFlowService(WorkFlowService workFlowService) {
		this.workFlowService = workFlowService;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDeploymentName() {
		return deploymentName;
	}

	public void setDeploymentName(String deploymentName) {
		this.deploymentName = deploymentName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	
}
