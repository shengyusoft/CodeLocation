package com.wtkj.rms.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.customer.model.po.QuotationDetail;

public interface QuotationDetailServiceI {

	public List<QuotationDetail> dataGrid(QuotationDetail q, PageFilter ph);

	public Long count(QuotationDetail q, PageFilter ph);

	public QuotationDetail get(Long id);

	public void add(QuotationDetail q, HttpServletRequest request);

	public void edit(QuotationDetail q, HttpServletRequest request);

	public void delete(Long id) throws Exception;

	public void delete(String ids) throws Exception;

	public List<QuotationDetail> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<QuotationDetail> checkRelate(String ids);
}
