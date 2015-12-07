package com.wtkj.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class Grid implements java.io.Serializable {

	private Long total = 0L;
	@SuppressWarnings("rawtypes")
	private List rows = new ArrayList();

	// 其他数据
	private Map<Object, Object> dataMap;

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	@SuppressWarnings("rawtypes")
	public List getRows() {
		return rows;
	}

	@SuppressWarnings("rawtypes")
	public void setRows(List rows) {
		this.rows = rows;
	}

	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}

}
