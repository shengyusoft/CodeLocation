package com.wtkj.rms.bidbond.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.bidbond.model.BidBondVo;

public interface BidBondServiceI {

	public List<BidBondVo> dataGrid(BidBondVo BidBondVo, PageFilter ph);

	public Long count(BidBondVo BidBondVo, PageFilter ph);

	public Long count(BidBondVo BidBondVo);

	public BidBondVo get(Long id);

	public void add(BidBondVo BidBondVo, HttpServletRequest request);

	public void edit(BidBondVo BidBondVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<BidBondVo> findAll();

	public long countAll(int type);

	public Long countByState(int i);

	Long countByIdNumber(String idNumber);
}
