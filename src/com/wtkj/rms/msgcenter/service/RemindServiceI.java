package com.wtkj.rms.msgcenter.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.msgcenter.model.po.Remind;

public interface RemindServiceI {

	public List<Remind> dataGrid(Remind r, PageFilter ph);

	public Long count(Remind r, PageFilter ph);

	public Remind get(Long id);

	public void add(Remind r, HttpServletRequest request);

	public void edit(Remind r, HttpServletRequest request);

	public void delete(String ids);

	public List<Remind> findAll(String type);
}
