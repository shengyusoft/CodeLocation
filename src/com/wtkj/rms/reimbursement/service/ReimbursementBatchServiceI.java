package com.wtkj.rms.reimbursement.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.User;
import com.wtkj.rms.reimbursement.model.po.ReimbursementBatch;
import com.wtkj.rms.reimbursement.model.vo.ReimbursementBatchVo;

public interface ReimbursementBatchServiceI {

	public List<ReimbursementBatch> dataGrid(User user, ReimbursementBatchVo ReimbursementBatch, PageFilter ph);

	public Long count(User user, ReimbursementBatchVo ReimbursementBatch, PageFilter ph);

	public ReimbursementBatch get(Long id);

	public Long add(ReimbursementBatch ReimbursementBatch, HttpServletRequest request);

	public void edit(ReimbursementBatch ReimbursementBatch, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);
	
	public List<ReimbursementBatch> findAll();
}
