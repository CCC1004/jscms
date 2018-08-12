package com.wh.util;

import java.util.Random;
import java.util.UUID;

public class UploadUtils {
	/**
	 * 获取文件真实名称
	 * 由于浏览器的不同获取的名称可能为:c:/upload/1.jpg或者1.jpg ---123aas.jpg
	 * 最终获取的为  1.jpg
	 * @param name 上传上来的文件名称
	 * @return	真实名称
	 */
	public static String getRealName(String name){
		//获取最后一个"/"
		int index = name.lastIndexOf("\\");
		return name.substring(index+1);
	}
	
	
	/**
	 * 获取随机名称
	 * @return uuid 随机名称
	 */
	public static String getUUIDName(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	
	/**
	 * 获取文件目录,可以获取256个随机目录
	 * @return 随机目录
	 */
	public static String getDir(){
		String s="0123456789ABCDEF";
		Random r = new Random();
		return "/"+s.charAt(r.nextInt(16))+"/"+s.charAt(r.nextInt(16));
	}
}
