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
import com.wtkj.rms.purchase.model.po.PurchaseBalanceDetail;
import com.wtkj.rms.purchase.service.PurchaseBalanceDetailServiceI;

@Service
public class PurchaseBalanceDetailServiceImpl implements
		PurchaseBalanceDetailServiceI {

	@Autowired
	private BaseDaoI<PurchaseBalanceDetail> purchaseBalanceDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(PurchaseBalanceDetail vo, HttpServletRequest request) {
		return (Long) purchaseBalanceDetailDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		PurchaseBalanceDetail p = purchaseBalanceDetailDao.get(PurchaseBalanceDetail.class,
				id);
		purchaseBalanceDetailDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from purchase_balance_detail where id in (" + ids + ")";
		try {
			purchaseBalanceDetailDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(PurchaseBalanceDetail vo, HttpServletRequest request) {
		purchaseBalanceDetailDao.update(vo);
	}

	@Override
	public PurchaseBalanceDetail get(Long id) {
		return purchaseBalanceDetailDao.get(PurchaseBalanceDetail.class, id);

	}

	@Override
	public List<PurchaseBalanceDetail> dataGrid(PurchaseBalanceDetail vo,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchaseBalanceDetail t ";
		List<PurchaseBalanceDetail> l = purchaseBalanceDetailDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());
		for (PurchaseBalanceDetail PurchaseDetail : l) {
			Goods goods = PurchaseDetail.getGoods();
			if (goods != null && goods.getType() != null) {
				PurchaseDetail.setGoodsTypeText(goods.getType().getText());
			}
		}
		return l;
	}

	@Override
	public List<PurchaseBalanceDetail> findAll() {
		return purchaseBalanceDetailDao.find(" from PurchaseBalanceDetail t ");
	}

	@Override
	public Long count(PurchaseBalanceDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchaseBalanceDetail t ";
		return purchaseBalanceDetailDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(PurchaseBalanceDetail vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getGoods() != null) {
				hql += " and t.goods.id = :gid";
				params.put("gid", vo.getGoods().getId());
			}

			if (vo.getPurchaseBalance() != null) {
				hql += " and t.purchaseBalance.id = :pid";
				params.put("pid", vo.getPurchaseBalance().getId());
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
	public List<PurchaseBalanceDetail> checkRelate(String ids) {
		return null;
	}

}
