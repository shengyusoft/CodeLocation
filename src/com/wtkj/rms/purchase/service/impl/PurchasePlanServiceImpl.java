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
import com.wtkj.rms.purchase.model.po.PurchasePlan;
import com.wtkj.rms.purchase.model.po.PurchasePlanDetail;
import com.wtkj.rms.purchase.service.PurchasePlanServiceI;

@Service
public class PurchasePlanServiceImpl implements PurchasePlanServiceI {

	@Autowired
	private BaseDaoI<PurchasePlan> purchasePlanDao;

	@Autowired
	private BaseDaoI<PurchasePlanDetail> purchasePlanDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(PurchasePlan vo, HttpServletRequest request) {
		return (Long) purchasePlanDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		PurchasePlan p = purchasePlanDao.get(PurchasePlan.class, id);
		purchasePlanDao.delete(p);
	}

	@Override
	public void delete(String ids) {

		String sql = "delete from purchase_plan where id in (" + ids + ")";
		// 删除关联表

		String sql2 = "delete from purchase_plan_detail where purchasePlanId in (" + ids
				+ ")";
		try {
			purchasePlanDetailDao.executeSql(sql2);
			purchasePlanDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(PurchasePlan vo, HttpServletRequest request) {
		purchasePlanDao.update(vo);
	}

	@Override
	public PurchasePlan get(Long id) {
		return purchasePlanDao.get(PurchasePlan.class, id);

	}

	@Override
	public List<PurchasePlan> dataGrid(PurchasePlan vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchasePlan t ";
		List<PurchasePlan> l = purchasePlanDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (PurchasePlan p : l) {
			if (p.getUserId() > 0) {
				Tuser user = userDao.get(Tuser.class, p.getUserId());
				p.setUserName(user.getName());
			}
		}

		return l;
	}

	@Override
	public List<PurchasePlan> findAll() {
		return purchasePlanDao.find(" from PurchasePlan t ");
	}

	@Override
	public Long count(PurchasePlan vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PurchasePlan t ";
		return purchasePlanDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(PurchasePlan vo, Map<String, Object> params) {
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
			orderString = " order by t." + ph.getSort() + " "
					+ ph.getOrder();
		}
		return orderString;
	}

	@Override
	public List<PurchasePlan> checkRelate(String ids) {
		return null;
	}

}
