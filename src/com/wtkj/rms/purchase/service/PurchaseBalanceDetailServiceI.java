package com.wtkj.rms.purchase.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.purchase.model.po.PurchaseBalanceDetail;

public interface PurchaseBalanceDetailServiceI {

	public List<PurchaseBalanceDetail> dataGrid(PurchaseBalanceDetail o, PageFilter ph);

	public Long count(PurchaseBalanceDetail q, PageFilter ph);

	public PurchaseBalanceDetail get(Long id);

	public Long add(PurchaseBalanceDetail q, HttpServletRequest request);

	public void edit(PurchaseBalanceDetail q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<PurchaseBalanceDetail> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<PurchaseBalanceDetail> checkRelate(String ids);
}
