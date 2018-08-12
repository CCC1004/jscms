package com.wh.test.service;

import java.util.List;
import java.util.Map;

import com.wh.util.PageModel;

import qlight.frames.security.model.AuUserinfo;
import qlight.util.page.Page;

public interface IUserInfoService {

	public Page<AuUserinfo> listUser(PageModel pm,Map<String, String> sm);
}
