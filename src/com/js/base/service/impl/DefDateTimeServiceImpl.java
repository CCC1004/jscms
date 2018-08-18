package com.js.base.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import qlight.frames.base.service.ValueService;


public class DefDateTimeServiceImpl implements ValueService{

    public String getValue(){
        DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format (new Date());
    }

}
