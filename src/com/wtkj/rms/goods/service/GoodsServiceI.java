package com.wtkj.rms.goods.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.goods.model.GoodsVo;

public interface GoodsServiceI {

	public List<GoodsVo> dataGrid(GoodsVo vo, PageFilter ph);

	public Long count(GoodsVo vo, PageFilter ph);

	public GoodsVo get(Long id);

	public void add(GoodsVo vo, HttpServletRequest request);

	public void edit(GoodsVo vo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<GoodsVo> findAll();

	/**
	 * check the current record whether linked by other records
	 * 
	 * @param ids
	 * @return
	 */
	public List<GoodsVo> checkRelate(String ids);
}
