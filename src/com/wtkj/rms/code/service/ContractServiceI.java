package com.wtkj.rms.code.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.code.model.vo.ContractVo;

public interface ContractServiceI {

	public List<ContractVo> dataGrid(ContractVo contractVo, PageFilter ph);

	public Long count(ContractVo contractVo, PageFilter ph);

	public ContractVo get(Long id);

	public void add(ContractVo contractVo, HttpServletRequest request);

	public void edit(ContractVo contractVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<ContractVo> findAll();

	public List<Contract> checkRelate(String ids);
}
