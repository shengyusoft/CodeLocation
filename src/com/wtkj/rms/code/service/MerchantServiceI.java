package com.wtkj.rms.code.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.vo.MerchantVo;

public interface MerchantServiceI {

	public List<MerchantVo> dataGrid(MerchantVo merchantVo, PageFilter ph);

	public Long count(MerchantVo merchantVo, PageFilter ph);

	public MerchantVo get(Long id);

	public void add(MerchantVo merchantVo, HttpServletRequest request);

	public void edit(MerchantVo merchantVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);
	
	public List<MerchantVo> findAll();

	public List<Merchant> checkRelate(String ids);
}
