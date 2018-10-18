package com.js.activiti.service.impl;

import java.util.List;
import java.util.Map;

import org.activiti.engine.repository.Deployment;

import qlight.frames.base.dao.BaseDao;

import com.js.activiti.service.WorkFlowService;
import com.js.util.ActivitiUtils;
import com.js.util.PageModel;

/**
 * 工作流
 * @author superC
 *
 */
public class WorkFlowServiceImpl implements WorkFlowService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	@Override
	public List<Deployment> deploymentPage(PageModel pm, Map<String, String> sm) {
		
		Integer pageNumber = pm.getPageNumber();
		Integer pageSize = pm.getPageSize();
		Integer pageStart = null;
		if(pageNumber>1){
			pageStart = (pageNumber-1)*pageSize;
		}else{
			pageStart = 1;
		}
		List<Deployment> list = ActivitiUtils.findDeploymentListPage(pageStart, pageSize);
		return list;
	}
	
}
