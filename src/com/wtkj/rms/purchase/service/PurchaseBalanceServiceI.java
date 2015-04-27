package com.wtkj.rms.purchase.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.purchase.model.po.PurchaseBalance;

public interface PurchaseBalanceServiceI {

	public List<PurchaseBalance> dataGrid(PurchaseBalance o, PageFilter ph);

	public Long count(PurchaseBalance q, PageFilter ph);

	public PurchaseBalance get(Long id);

	public Long add(PurchaseBalance q, HttpServletRequest request);

	public void edit(PurchaseBalance q, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<PurchaseBalance> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<PurchaseBalance> checkRelate(String ids);
}
