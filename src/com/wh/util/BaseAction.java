package com.wh.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;

public class BaseAction {
	
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;	
	protected HttpServletResponse response;
	protected HttpSession session;
	
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){  
        this.request = request;  
        this.response = response;  
        this.session = request.getSession();  
    }
	
    /**
     * 向前台写json格式的数据
     * @param object 被转换的对象
     */
	public synchronized void writeJson(Object object) {
		response = ServletActionContext.getResponse();
		try {
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 向前台写json格式的数据
	 * @param response 由调用者指定response对象
	 * @param object 被转换的对象
	 */
	public void writeJson(HttpServletResponse response, Object object) {
		try {
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
			response.setContentType("application/json;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 向前台写字符串数据，调用Object对象的toString()方法
	 * @param object 任意对象
	 */
	public void writeString(Object object) {
		response = ServletActionContext.getResponse();
		try {
			String str = object.toString();
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(str);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
