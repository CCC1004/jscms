package com.js.activiti.service;

import java.util.List;
import java.util.Map;

import org.activiti.engine.repository.Deployment;

import com.js.util.PageModel;




public interface WorkFlowService {

	List<Deployment> deploymentPage(PageModel pm,Map<String, String> sm);


}
