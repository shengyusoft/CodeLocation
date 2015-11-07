package com.wtkj.rms.bidbondgzzf.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.bidbondgzzf.model.BidBondGzzfVo;

public interface BidBondGzzfServiceI {

	public List<BidBondGzzfVo> dataGrid(BidBondGzzfVo BidBondGzzfVo, PageFilter ph);

	public Long count(BidBondGzzfVo BidBondGzzfVo, PageFilter ph);

	public Long count(BidBondGzzfVo BidBondGzzfVo);

	public BidBondGzzfVo get(Long id);

	public void add(BidBondGzzfVo BidBondGzzfVo, HttpServletRequest request);

	public void edit(BidBondGzzfVo BidBondGzzfVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<BidBondGzzfVo> findAll();

	public long countAll(int type);

	public Long countByState(int i);

	Long countByIdNumber(String idNumber);
}
