package com.js.application.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import qlight.frames.base.dao.BaseDao;
import qlight.frames.base.dao.ibatis.Condition;
import qlight.frames.base.dao.ibatis.Order;
import qlight.frames.exception.baseExp.DataAccessException;
import qlight.util.page.Page;

import com.fr.base.core.UUID;
import com.js.application.model.TableDescribe;
import com.js.application.service.ExcelToDocService;
import com.js.util.PageModel;

public class ExcelToDocServiceImpl implements ExcelToDocService {

	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	/**
	 * 保存所需数据
	 */
	public String saveData(List<TableDescribe> tdList) {
		String index = "0";
		for (TableDescribe td : tdList) {
			String uuid = UUID.randomUUID().toString().trim().replace("-", "");
			td.setGuid(uuid);
			try {
				baseDao.create(td);
				index = "1";
			} catch (DataAccessException e) {
				e.printStackTrace();
			}
		}
		return index;
	}

	/**
	 * 获取所有数据
	 * @return
	 */
	public Page<TableDescribe> getAllTableDescribe(PageModel pm,Map<String, String> sm) {
		Condition cond = new Condition();
		//表标识符
		if(StringUtils.isNotBlank(sm.get("ti"))){
			cond.addCriterion("table_ident like '%"+sm.get("ti")+"%'");
		}
		//表名
		if(StringUtils.isNotBlank(sm.get("tnm"))){
			cond.addCriterion("table_name like '%"+sm.get("tnm")+"%'");
		}
		//排序
		Order order = null;
		if(pm.getOrder().equals("asc")){
			order = Order.asc(pm.getSort());
		}else{
			order = Order.desc(pm.getSort());
		}
		cond.addOrder(order);
		cond.addOrder(Order.asc("table_ident"));//表标识符
		Page<TableDescribe> page = baseDao.page(TableDescribe.class,cond, pm.getPageNumber(), pm.getPageSize());
		return page;
	}

}
