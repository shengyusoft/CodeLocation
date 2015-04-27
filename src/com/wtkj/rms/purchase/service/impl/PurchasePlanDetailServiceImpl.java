package com.wtkj.rms.purchase.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.goods.model.Goods;
import com.wtkj.rms.purchase.model.po.PurchasePlanDetail;
import com.wtkj.rms.purchase.service.PurchasePlanDetailServiceI;

@Service
public class PurchasePlanDetailServiceImpl implements
		PurchasePlanDetailServiceI {

	@Autowired
	private BaseDaoI<PurchasePlanDetail> purchasePlanDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(PurchasePlanDetail vo, HttpServletRequest request) {
		return (Long) purchasePlanDetailDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		PurchasePlanDetail p = purchasePlanDetailDao.get(PurchasePlanDetail.class,
				id);
		purchasePlanDetailDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from purchase_plan_detail where id in (" + ids + ")";
		try {
			purchasePlanDetailDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(PurchasePlanDetail vo, HttpServletRequest request) {
		purchasePlanDetailDao.update(vo);
	}

	@Override
	public PurchasePlanDetail get(Long id) {
		return purchasePlanDetailDao.get(PurchasePlanDetail.class, id);

	}

	@Override
	public List<PurchasePlanDetail> dataGrid(PurchasePlanDetail vo,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchasePlanDetail t ";
		List<PurchasePlanDetail> l = purchasePlanDetailDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());
		for (PurchasePlanDetail PurchaseDetail : l) {
			Goods goods = PurchaseDetail.getGoods();
			if (goods != null && goods.getType() != null) {
				PurchaseDetail.setGoodsTypeText(goods.getType().getText());
			}
		}
		return l;
	}

	@Override
	public List<PurchasePlanDetail> findAll() {
		return purchasePlanDetailDao.find(" from PurchasePlanDetail t ");
	}

	@Override
	public Long count(PurchasePlanDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchasePlanDetail t ";
		return purchasePlanDetailDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(PurchasePlanDetail vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getGoods() != null) {
				hql += " and t.goods.id = :gid";
				params.put("gid", vo.getGoods().getId());
			}

			if (vo.getPurchasePlan() != null) {
				hql += " and t.purchasePlan.id = :pid";
				params.put("pid", vo.getPurchasePlan().getId());
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

	@Override
	public List<PurchasePlanDetail> checkRelate(String ids) {
		return null;
	}

}
