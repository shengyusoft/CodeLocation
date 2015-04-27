package com.wtkj.rms.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.customer.model.po.Quotation;

public interface QuotationServiceI {

	public List<Quotation> dataGrid(Quotation quotation, PageFilter ph);

	public Long count(Quotation q, PageFilter ph);

	public Quotation get(Long id);

	public Long add(Quotation q, HttpServletRequest request);

	public void edit(Quotation q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Quotation> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<Quotation> checkRelate(String ids);
}
