package com.js.application.service;

import java.util.List;
import java.util.Map;

import qlight.util.page.Page;

import com.js.application.model.TableDescribe;
import com.js.util.PageModel;

/**
 * 
 * @author superC
 *
 */
public interface ExcelToDocService {

	/**
	 * 保存所需数据
	 */
	String saveData(List<TableDescribe> tdList);
	
	/**
	 * 获取所有数据
	 * @return
	 */
	Page<TableDescribe> getAllTableDescribe(PageModel pm,Map<String, String> sm);
	
}
