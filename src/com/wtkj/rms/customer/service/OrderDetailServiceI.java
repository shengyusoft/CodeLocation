package com.wtkj.rms.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.customer.model.po.OrderDetail;

public interface OrderDetailServiceI {

	public List<OrderDetail> dataGrid(OrderDetail o, PageFilter ph);

	public Long count(OrderDetail q, PageFilter ph);

	public OrderDetail get(Long id);

	public Long add(OrderDetail q, HttpServletRequest request);

	public void edit(OrderDetail q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<OrderDetail> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<OrderDetail> checkRelate(String ids);
}
