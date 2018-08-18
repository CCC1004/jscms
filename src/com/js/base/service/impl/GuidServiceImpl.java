package com.js.base.service.impl;

import java.util.UUID;

import qlight.frames.base.service.ValueService;

public class GuidServiceImpl implements ValueService {

	@Override
	public String getValue() {
		String guid = UUID.randomUUID().toString().replace("-", "");
		return guid;
	}

}
