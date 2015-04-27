package com.wtkj.rms.purchase.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.purchase.model.po.PurchasePlan;

public interface PurchasePlanServiceI {

	public List<PurchasePlan> dataGrid(PurchasePlan o, PageFilter ph);

	public Long count(PurchasePlan q, PageFilter ph);

	public PurchasePlan get(Long id);

	public Long add(PurchasePlan q, HttpServletRequest request);

	public void edit(PurchasePlan q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<PurchasePlan> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<PurchasePlan> checkRelate(String ids);
}
