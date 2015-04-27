package com.wtkj.rms.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.customer.model.po.Order;

public interface OrderServiceI {

	public List<Order> dataGrid(Order o, PageFilter ph);

	public Long count(Order q, PageFilter ph);

	public Order get(Long id);

	public Long add(Order q, HttpServletRequest request);

	public void edit(Order q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Order> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<Order> checkRelate(String ids);
}
