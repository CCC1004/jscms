package com.wh.test.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;





import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.wh.test.service.IUserInfoService;
import com.wh.util.BaseAction;
import com.wh.util.PageModel;

import qlight.frames.security.model.AuUserinfo;
import qlight.util.page.Page;

public class TestAction extends BaseAction {

	private IUserInfoService userInfoService;
	
	public void list(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		PageModel pm = new PageModel();
		pm.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pm.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
		pm.setSort(request.getParameter("sort"));
		pm.setOrder(request.getParameter("order"));
		
		Map<String, String> sm = new HashMap<String, String>();
		sm.put("userid", request.getParameter("userid"));
		sm.put("username", request.getParameter("username"));
		
		Page<AuUserinfo> p = userInfoService.listUser(pm,sm);
		pm.setTotal(p.getTotalCount());
		pm.setRows(p.getResult());
		
		writeJson(response, pm);
	}

	public IUserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(IUserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	
}