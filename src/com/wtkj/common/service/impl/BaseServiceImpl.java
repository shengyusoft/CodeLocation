package com.wtkj.common.service.impl;

import java.util.List;
import java.util.Map;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.service.BaseServiceI;

public abstract class BaseServiceImpl<M extends java.io.Serializable>
		implements BaseServiceI<M> {

	protected BaseDaoI<M> baseDao;

	public abstract void setBaseDao(BaseDaoI<M> baseDao);

	@Override
	public List<M> dataGrid(Class<M> clazz, PageFilter ph,
			Map<String, Object> params) {
		String hql = " from " + getClazzName(clazz) + " t ";
		List<M> l = baseDao.find(hql + orderHql(ph), params, ph.getPage(),
				ph.getRows());
		return l;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public Long count(Class<M> clazz, PageFilter ph, Map<String, Object> params) {
		String hql = " from " + getClazzName(clazz) + " t ";
		return baseDao.count("select count(*) " + hql, params);
	}

	@Override
	public void add(M m) {

		try {
			baseDao.save(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(M m) {
		try {
			baseDao.delete(m);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 批量删除
	 */
	@Override
	public void delete(Class<M> clazz, String ids) {
		try {
			String hql = "delete from " + getClazzName(clazz) + " where id in("
					+ ids + ")";
			baseDao.executeHql(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void edit(M m) {
		try {
			baseDao.saveOrUpdate(m);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public M get(Class<M> clazz, Map<String, Object> params) {
		try {
			baseDao.get("from " + getClazzName(clazz) + "where 1=1", params);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	private String getClazzName(Class<M> clazz) {
		String className = clazz.getName();
		className = className.substring(className.lastIndexOf(".") + 1);
		return className;
	}
}
