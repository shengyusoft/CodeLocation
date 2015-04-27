package com.wtkj.rms.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.customer.model.po.Customer;

public interface CustomerServiceI {

	public List<Customer> dataGrid(Customer Customer, PageFilter ph);

	public Long count(Customer Customer, PageFilter ph);

	public Customer get(Long id);

	public void add(Customer Customer, HttpServletRequest request);

	public void edit(Customer Customer, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Customer> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<Customer> checkRelate(String ids);
}
