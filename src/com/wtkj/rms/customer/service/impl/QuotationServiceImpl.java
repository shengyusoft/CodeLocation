package com.wtkj.rms.customer.service.impl;

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
import com.wtkj.rms.customer.model.po.Quotation;
import com.wtkj.rms.customer.model.po.QuotationDetail;
import com.wtkj.rms.customer.service.QuotationServiceI;

@Service
public class QuotationServiceImpl implements QuotationServiceI {

	@Autowired
	private BaseDaoI<Quotation> quotationDao;

	@Autowired
	private BaseDaoI<QuotationDetail> quotationDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(Quotation vo, HttpServletRequest request) {
		return (Long) quotationDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Quotation p = quotationDao.get(Quotation.class, id);
		quotationDao.delete(p);
	}

	@Override
	public void delete(String ids) {

		String sql = "delete from quotation where id in (" + ids + ")";
		// 删除关联表

		String sql2 = "delete from quotation_detail where quotationId in ("
				+ ids + ")";
		try {
			quotationDetailDao.executeSql(sql2);
			quotationDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Quotation vo, HttpServletRequest request) {
		quotationDao.update(vo);
	}

	@Override
	public Quotation get(Long id) {
		return quotationDao.get(Quotation.class, id);

	}

	@Override
	public List<Quotation> dataGrid(Quotation vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Quotation t ";
		List<Quotation> l = quotationDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Quotation quotation : l) {

			if (quotation.getUserId() > 0) {
				Tuser user = userDao.get(Tuser.class, quotation.getUserId());
				quotation.setUserName(user.getName());
			}

		}

		return l;
	}

	@Override
	public List<Quotation> findAll() {
		return quotationDao.find(" from Quotation t ");
	}

	@Override
	public Long count(Quotation vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Quotation t ";
		return quotationDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(Quotation vo, Map<String, Object> params) {
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
	public List<Quotation> checkRelate(String ids) {
		return null;
	}

}
