package com.wtkj.rms.goods.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.goods.model.Supplier;
import com.wtkj.rms.goods.service.SupplierServiceI;

@Service
public class SupplierServiceImpl implements SupplierServiceI {

	@Autowired
	private BaseDaoI<Supplier> supplierDao;

	@Override
	public void add(Supplier vo, HttpServletRequest request) {
		supplierDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Supplier p = supplierDao.get(Supplier.class, id);
		supplierDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from supplier where id in (" + ids + ")";
		try {
			supplierDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Supplier vo, HttpServletRequest request) {
		supplierDao.update(vo);
	}

	@Override
	public Supplier get(Long id) {
		return supplierDao.get(Supplier.class, id);

	}

	@Override
	public List<Supplier> dataGrid(Supplier vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Supplier t ";
		List<Supplier> l = supplierDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<Supplier> findAll() {
		return supplierDao.find(" from Supplier t ");
	}

	@Override
	public Long count(Supplier vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Supplier t ";
		return supplierDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(Supplier vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public List<Supplier> checkRelate(String ids) {
		return null;
	}

}
