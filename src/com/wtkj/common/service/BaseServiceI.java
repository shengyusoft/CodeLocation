package com.wtkj.common.service;

import java.util.List;
import java.util.Map;

import com.wtkj.common.PageFilter;

public interface BaseServiceI<M extends java.io.Serializable> {

	public List<M> dataGrid(Class<M> clazz, PageFilter ph,Map<String, Object> params);

	public Long count(Class<M> clazz, PageFilter ph,Map<String, Object> params);

	public void add(M m);

	public void delete(M m);

	public void delete(Class<M> clazz, String ids);

	public void edit(M m);

	public M get(Class<M> clazz,Map<String, Object> params);
}
