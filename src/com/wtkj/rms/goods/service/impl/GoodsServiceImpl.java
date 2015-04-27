package com.wtkj.rms.goods.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.rms.goods.model.Goods;
import com.wtkj.rms.goods.model.GoodsVo;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Service
public class GoodsServiceImpl implements GoodsServiceI {

	@Autowired
	private BaseDaoI<Goods> goodsDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(GoodsVo vo, HttpServletRequest request) {
		goodsDao.save(toPo(vo));
	}

	@Override
	public void delete(Long id) {
		Goods po = goodsDao.get(Goods.class, id);
		goodsDao.delete(po);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from Goods where id in (" + ids + ")";
		try {
			goodsDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(GoodsVo vo, HttpServletRequest request) {
		goodsDao.update(toPo(vo));
	}

	@Override
	public GoodsVo get(Long id) {
		Goods po = goodsDao.get(Goods.class, id);
		return toVo(po);

	}
	
	@Override
	public List<GoodsVo> dataGrid(GoodsVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		List<GoodsVo> vos = new ArrayList<GoodsVo>();
		String hql = " from Goods t ";
		List<Goods> l = goodsDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (Goods goods : l) {
			vos.add(toVo(goods));
		}
		return vos;
	}

	@Override
	public List<GoodsVo> findAll() {
		List<GoodsVo> vos = new ArrayList<GoodsVo>();
		List<Goods> pos = goodsDao.find(" from Goods t ");
		for (Goods goods : pos) {
			vos.add(toVo(goods));
		}
		return vos;
	}

	@Override
	public Long count(GoodsVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Goods t ";
		return goodsDao.count("select count(*) " + hql + whereHql(vo, params),
				params);
	}

	private String whereHql(GoodsVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	// vo to po
	private Goods toPo(GoodsVo vo) {
		Goods po = new Goods();
		BeanUtils.copyProperties(vo, po);

		if (vo.getTypeId() > 0) {
			po.setType(dictionaryDao.get(Tdictionary.class, vo.getTypeId()));
		}
		return po;
	}

	// po to vo
	private GoodsVo toVo(Goods po) {
		GoodsVo vo = new GoodsVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getType() != null) {
			vo.setTypeId(po.getType().getId());
			vo.setTypeText(po.getType().getText());
		}

		return vo;
	}

	@Override
	public List<GoodsVo> checkRelate(String ids) {
		return null;
	}

}
