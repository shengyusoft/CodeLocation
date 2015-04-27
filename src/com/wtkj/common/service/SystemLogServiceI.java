package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.SystemLogVo;

public interface SystemLogServiceI {

	public List<SystemLogVo> dataGrid(SystemLogVo log, PageFilter ph,
			Long currentUserId);

	public Long count(SystemLogVo log, PageFilter ph, Long currentUserId);

	public void add(SystemLogVo log);

	public void delete(Long id);

	public SystemLogVo get(Long id);

	public void delete(String ids);

	public void clear();

	public String getUserLastLoginTime(Long id);

}
