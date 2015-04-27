package com.wtkj.rms.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.customer.model.po.Customer;
import com.wtkj.rms.customer.service.CustomerServiceI;

@Service
public class CustomerServiceImpl implements CustomerServiceI {

	@Autowired
	private BaseDaoI<Customer> customerDao;

	@Override
	public void add(Customer vo, HttpServletRequest request) {
		customerDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Customer p = customerDao.get(Customer.class, id);
		customerDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from customer where id in (" + ids + ")";
		try {
			customerDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Customer vo, HttpServletRequest request) {
		customerDao.update(vo);
	}

	@Override
	public Customer get(Long id) {
		return customerDao.get(Customer.class, id);

	}

	@Override
	public List<Customer> dataGrid(Customer vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Customer t ";
		List<Customer> l = customerDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<Customer> findAll() {
		return customerDao.find(" from Customer t ");
	}

	@Override
	public Long count(Customer vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Customer t ";
		return customerDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(Customer vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getCompanyName())) {
				hql += " and t.companyName like :name";
				params.put("name", "%%" + vo.getCompanyName() + "%%");
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
	public List<Customer> checkRelate(String ids) {
		return null;
	}

}
