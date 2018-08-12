package com.wh.util;

import java.io.Serializable;

public class PageModel<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int pageSize;
	private int pageNumber;
	private String sort;
	private String order;
	private long total;
	private T rows;	
	private String msg;
	
	public PageModel() {
		super();
	}
	
	public PageModel(int pageSize, int pageNumber, String sort, String order, long total, T rows, String msg) {
		super();
		this.pageSize = pageSize;
		this.pageNumber = pageNumber;
		this.sort = sort;
		this.order = order;
		this.total = total;
		this.rows = rows;
		this.msg = msg;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public long getTotal() {
		return total;
	}
	
	public void setTotal(long total) {
		this.total = total;
	}
	
	public T getRows() {
		return rows;
	}
	
	public void setRows(T rows) {
		this.rows = rows;
	}
	
	public String getMsg() {
		return msg;
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
