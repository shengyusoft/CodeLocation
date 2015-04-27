package com.wtkj.rms.dailymaintain.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.dailymaintain.model.PointInspectVo;

public interface PointInspectServiceI {

	public List<PointInspectVo> dataGrid(Long userId, PointInspectVo vo,
			PageFilter ph);

	public Long count(Long userId, PointInspectVo vo, PageFilter ph);

	public PointInspectVo get(Long id);

	public void add(PointInspectVo vo, HttpServletRequest request);

	public void edit(PointInspectVo vo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

}
