package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.ShotcutInfoVo;

public interface ShotcutServiceI {

	public List<ShotcutInfoVo> dataGrid(ShotcutInfoVo vo, PageFilter ph,
			Long userId);

	public Long count(ShotcutInfoVo vo, PageFilter ph, Long userId);

	public void delete(String ids) throws Exception;

	public void add(String ids, Long userId);

	public void edit(ShotcutInfoVo vo, Long userId);

	public ShotcutInfoVo get(Long id);

}
