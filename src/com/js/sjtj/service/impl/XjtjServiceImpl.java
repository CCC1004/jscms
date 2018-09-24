package com.js.sjtj.service.impl;

import java.util.List;
import java.util.Map;

import qlight.frames.base.dao.BaseDao;

import com.js.sjtj.service.XjtjService;

public class XjtjServiceImpl implements XjtjService {

	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}


	/**
	 * 巡检统计
	 * @return
	 */
	public List<Map<String, Object>> echartsData(){
		
		String sql = "SELECT re.RESULT, COUNT(*) AS COUNTS FROM vm_pdo_insp_result re GROUP BY re.RESULT HAVING re.RESULT IS NOT NULL"; 
		
		List<Map<String, Object>> list = baseDao.ExecSql(sql);
		return list;
				
	}

}
