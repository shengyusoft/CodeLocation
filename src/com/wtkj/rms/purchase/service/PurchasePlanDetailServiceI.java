package com.wtkj.rms.purchase.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.purchase.model.po.PurchasePlanDetail;

public interface PurchasePlanDetailServiceI {

	public List<PurchasePlanDetail> dataGrid(PurchasePlanDetail o, PageFilter ph);

	public Long count(PurchasePlanDetail q, PageFilter ph);

	public PurchasePlanDetail get(Long id);

	public Long add(PurchasePlanDetail q, HttpServletRequest request);

	public void edit(PurchasePlanDetail q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<PurchasePlanDetail> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<PurchasePlanDetail> checkRelate(String ids);
}
