package com.js.sjtj.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.js.base.actioin.BaseAction;
import com.js.sjtj.service.XjtjService;

/**
 * 巡检统计	
 * 		巡检信息PF_ROSD_PDO_INSP_B
 * @author superC
 *
 */
public class XjtjAction extends BaseAction{
	
	private XjtjService xjtjService;

	public String toInspCount(){
		return "toInspCount";
	}
	
	/**
	 * 巡检统计
	 */
	public void echartsData(){
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Map<String, Object>> data = xjtjService.echartsData();
		writeJson(response,data);
	}
	

	public XjtjService getXjtjService() {
		return xjtjService;
	}

	public void setXjtjService(XjtjService xjtjService) {
		this.xjtjService = xjtjService;
	}
	
}
