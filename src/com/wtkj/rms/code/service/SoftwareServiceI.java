package com.wtkj.rms.code.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.code.model.vo.SoftwareVo;

public interface SoftwareServiceI {

	public List<SoftwareVo> dataGrid(SoftwareVo vo, PageFilter ph);

	public Long count(SoftwareVo vo, PageFilter ph);

	public SoftwareVo get(Long id);

	public void add(SoftwareVo vo, HttpServletRequest request);

	public void edit(SoftwareVo vo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);
}
