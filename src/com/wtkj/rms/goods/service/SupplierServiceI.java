package com.wtkj.rms.goods.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.goods.model.Supplier;

public interface SupplierServiceI {

	public List<Supplier> dataGrid(Supplier supplier, PageFilter ph);

	public Long count(Supplier supplier, PageFilter ph);

	public Supplier get(Long id);

	public void add(Supplier supplier, HttpServletRequest request);

	public void edit(Supplier supplier, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Supplier> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<Supplier> checkRelate(String ids);
}
