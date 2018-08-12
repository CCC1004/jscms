package com.wh.test.service.imp;

import java.util.Map;

import qlight.frames.base.dao.ibatis.Condition;
import qlight.frames.base.dao.ibatis.Order;
import qlight.frames.security.dao.AuUserInfoDao;
import qlight.frames.security.model.AuUserinfo;
import qlight.util.page.Page;

import com.wh.test.service.IUserInfoService;
import com.wh.util.PageModel;

public class UserInfoServiceImpl implements IUserInfoService {

	private AuUserInfoDao auUserInfoDao;
	
	public Page<AuUserinfo> listUser(PageModel pm, Map<String, String> sm) {
		Condition cond = new Condition();
		
		Order order = null;
		if(pm.getOrder().equals("asc")){
			order = Order.asc(pm.getSort());
		}else{
			order = Order.desc(pm.getSort());
		}
		
		cond.addCriterion("userid like '%"+sm.get("userid")+"%'");
		cond.addCriterion("username like '%"+sm.get("username")+"%'");
		cond.addOrder(order);
		Page<AuUserinfo> page = auUserInfoDao.page(cond, pm.getPageNumber(), pm.getPageSize());
		return page;
	}

	public AuUserInfoDao getAuUserInfoDao() {
		return auUserInfoDao;
	}

	public void setAuUserInfoDao(AuUserInfoDao auUserInfoDao) {
		this.auUserInfoDao = auUserInfoDao;
	}

}
