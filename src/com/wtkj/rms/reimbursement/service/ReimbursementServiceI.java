package com.wtkj.rms.reimbursement.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.reimbursement.model.po.Reimbursement;

public interface ReimbursementServiceI {

	public List<Reimbursement> dataGrid(Reimbursement Reimbursement, PageFilter ph);

	public Long count(Reimbursement Reimbursement, PageFilter ph);

	public Reimbursement get(Long id);

	public Long add(Reimbursement Reimbursement, HttpServletRequest request);

	public void edit(Reimbursement Reimbursement, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);
	
	public List<Reimbursement> findAll();

	public List<Project> checkRelate(String ids);
}
