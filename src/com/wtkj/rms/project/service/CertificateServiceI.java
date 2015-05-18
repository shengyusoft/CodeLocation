package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.Dictionary;
import com.wtkj.rms.project.model.Certificate;


public interface CertificateServiceI {

	public List<Certificate> dataGrid(Certificate certificate, PageFilter ph);

	public Long count(Certificate certificate, PageFilter ph);

	public Certificate get(Long id);

	public void add(Certificate certificate, HttpServletRequest request);

	public void edit(Certificate certificate, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Certificate> findAll();
	
	public List<Certificate> combox(String type);

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<Certificate> checkRelate(String ids);
}
