package com.wtkj.rms.bidbond.service.impl;

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
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.bidbond.model.BidBond;
import com.wtkj.rms.bidbond.model.BidBondVo;
import com.wtkj.rms.bidbond.service.BidBondServiceI;

@Service
public class BidBondServiceImpl implements BidBondServiceI {

	@Autowired
	private BaseDaoI<BidBond> bidBondDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(BidBondVo vo, HttpServletRequest request) {
		bidBondDao.save(toPo(vo));
	}

	@Override
	public void delete(Long id) {
		BidBond p = bidBondDao.get(BidBond.class, id);
		bidBondDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from BidBond where id in (" + ids + ")";
		try {
			bidBondDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(BidBondVo vo, HttpServletRequest request) {
		bidBondDao.update(toPo(vo));
	}

	@Override
	public BidBondVo get(Long id) {
		BidBond po = bidBondDao.get(BidBond.class, id);
		return toVo(po);
	}

	@Override
	public List<BidBondVo> dataGrid(BidBondVo BidBondVo, PageFilter ph) {
		List<BidBondVo> pl = new ArrayList<BidBondVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";
		List<BidBond> l = bidBondDao.find(hql + whereHql(BidBondVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (BidBond t : l) {
			BidBondVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<BidBondVo> findAll() {
		List<BidBondVo> pl = new ArrayList<BidBondVo>();
		String hql = " from BidBond t ";
		List<BidBond> l = bidBondDao.find(hql);
		for (BidBond t : l) {
			BidBondVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(BidBondVo BidBondVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";
		return bidBondDao.count(
				"select count(*) " + hql + whereHql(BidBondVo, params), params);
	}

	private String whereHql(BidBondVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getIdNumber())) {
				hql += " and t.idNumber like :idNumber";
				params.put("idNumber", "%%" + vo.getIdNumber() + "%%");
			}
			if (!StringUtils.isEmpty(vo.getProjectName())) {
				hql += " and t.idNumber like :pname";
				params.put("pname", "%%" + vo.getProjectName() + "%%");
			}
			if (vo.getType() >= 0) {
				hql += " and t.type = :type";
				params.put("type", vo.getType());
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
	private BidBond toPo(BidBondVo vo) {
		BidBond po = new BidBond();
		BeanUtils.copyProperties(vo, po);

		if (vo.getApplierId() != null && vo.getApplierId() > 0) {
			Tuser applier = userDao.get(Tuser.class, vo.getApplierId());
			if (applier != null) {
				po.setApplier(applier);
			}
		}

		if (vo.getHandlerId() != null && vo.getHandlerId() > 0) {
			Tuser handler = userDao.get(Tuser.class, vo.getHandlerId());
			if (handler != null) {
				po.setHandler(handler);
			}
		}

		return po;
	}

	// po to vo
	private BidBondVo toVo(BidBond po) {
		BidBondVo vo = new BidBondVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getApplier() != null) {
			Tuser applier = userDao.get(Tuser.class, po.getApplier().getId());
			vo.setApplierId(applier.getId());
			vo.setApplierName(applier.getName());
		}

		if (po.getHandler() != null) {
			Tuser handler = userDao.get(Tuser.class, po.getHandler().getId());
			vo.setHandlerId(handler.getId());
			vo.setHandlerName(handler.getName());
		}

		return vo;
	}

	@Override
	public long countAll(int type) {
		// 根据类型获取总数
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select count(*) from BidBond t where t.type=:type";
		params.put("type", type);
		return bidBondDao.count(hql, params);
	}

}