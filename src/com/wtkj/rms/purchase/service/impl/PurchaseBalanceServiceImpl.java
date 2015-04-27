package com.wtkj.rms.purchase.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.purchase.model.po.PurchaseBalance;
import com.wtkj.rms.purchase.model.po.PurchaseBalanceDetail;
import com.wtkj.rms.purchase.service.PurchaseBalanceServiceI;

@Service
public class PurchaseBalanceServiceImpl implements PurchaseBalanceServiceI {

	@Autowired
	private BaseDaoI<PurchaseBalance> purchaseBalanceDao;

	@Autowired
	private BaseDaoI<PurchaseBalanceDetail> purchaseBalanceDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(PurchaseBalance vo, HttpServletRequest request) {
		return (Long) purchaseBalanceDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		PurchaseBalance p = purchaseBalanceDao.get(PurchaseBalance.class, id);
		purchaseBalanceDao.delete(p);
	}

	@Override
	public void delete(String ids) {

		String sql = "delete from purchase_balance where id in (" + ids + ")";
		// 删除关联表

		String sql2 = "delete from purchase_balance_detail where purchaseBalanceId in ("
				+ ids + ")";
		try {
			purchaseBalanceDetailDao.executeSql(sql2);
			purchaseBalanceDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(PurchaseBalance vo, HttpServletRequest request) {
		purchaseBalanceDao.update(vo);
	}

	@Override
	public PurchaseBalance get(Long id) {
		return purchaseBalanceDao.get(PurchaseBalance.class, id);

	}

	@Override
	public List<PurchaseBalance> dataGrid(PurchaseBalance vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchaseBalance t ";
		List<PurchaseBalance> l = purchaseBalanceDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (PurchaseBalance p : l) {
			if (p.getUserId() > 0) {
				Tuser user = userDao.get(Tuser.class, p.getUserId());
				p.setUserName(user.getName());
			}
		}

		return l;
	}

	@Override
	public List<PurchaseBalance> findAll() {
		return purchaseBalanceDao.find(" from PurchaseBalance t ");
	}

	@Override
	public Long count(PurchaseBalance vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchaseBalance t ";
		return purchaseBalanceDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(PurchaseBalance vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getCustomer() != null
					&& !StringUtils.isEmpty(vo.getCustomer().getCompanyName())) {
				hql += " and t.customer.companyName like :name";
				params.put("name", "%%" + vo.getCustomer().getCompanyName()
						+ "%%");
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
	public List<PurchaseBalance> checkRelate(String ids) {
		return null;
	}

}
