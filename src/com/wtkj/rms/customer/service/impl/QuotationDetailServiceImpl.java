package com.wtkj.rms.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.rms.customer.model.po.Quotation;
import com.wtkj.rms.customer.model.po.QuotationDetail;
import com.wtkj.rms.customer.service.QuotationDetailServiceI;
import com.wtkj.rms.goods.model.Goods;

@Service
public class QuotationDetailServiceImpl implements QuotationDetailServiceI {

	@Autowired
	private BaseDaoI<QuotationDetail> quotationDetailDao;

	@Autowired
	private BaseDaoI<Goods> goodsDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Quotation> quotationDao;

	@Override
	public void add(QuotationDetail vo, HttpServletRequest request) {
		quotationDetailDao.save(vo);
	}

	@Override
	public void delete(Long id) throws Exception {
		QuotationDetail p = quotationDetailDao.get(QuotationDetail.class, id);
		quotationDetailDao.delete(p);
	}

	@Override
	public void delete(String ids) throws Exception {
		String sql = "delete from quotation_detail where id in (" + ids + ")";
		quotationDetailDao.executeSql(sql);
	}

	@Override
	public void edit(QuotationDetail vo, HttpServletRequest request) {
		quotationDetailDao.update(vo);
	}

	@Override
	public QuotationDetail get(Long id) {
		return quotationDetailDao.get(QuotationDetail.class, id);
	}

	@Override
	public List<QuotationDetail> dataGrid(QuotationDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from QuotationDetail t ";
		List<QuotationDetail> l = quotationDetailDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (QuotationDetail quotationDetail : l) {
			Goods goods = quotationDetail.getGoods();
			if (goods != null && goods.getType() != null) {
				quotationDetail.setGoodsTypeText(goods.getType().getText());
			}
		}

		return l;
	}

	@Override
	public List<QuotationDetail> findAll() {
		List<QuotationDetail> l = quotationDetailDao
				.find(" from QuotationDetail t ");
		return l;
	}

	@Override
	public Long count(QuotationDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from QuotationDetail t ";
		return quotationDetailDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(QuotationDetail vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getQuotation() != null) {
				if (vo.getQuotation().getId() > 0) {
					hql += " and t.quotation.id =:qid";
					params.put("qid", vo.getQuotation().getId());
				}
				if (vo.getQuotation().getCustomer() != null) {
					hql += " and t.quotation.customer.id =:cid";
					params.put("cid", vo.getQuotation().getCustomer().getId());

				}
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
	public List<QuotationDetail> checkRelate(String ids) {
		return null;
	}

	// private QuotationDetail toVo(QuotationDetail detail) {
	// if (detail == null) {
	// return null;
	// }
	// // 商品信息
	// if (detail.getGoods() != null) {
	// Goods goods = goodsDao.get(Goods.class, detail.getGoods().getId());
	// Tdictionary dictionary = dictionaryDao.get(Tdictionary.class, goods
	// .getType().getId());
	// if (dictionary != null) {
	// goods.setType(dictionary);
	// }
	// detail.setGoods(goods);
	// }
	// // 报价单信息
	// if (detail.getQuotation() != null) {
	// Quotation q = quotationDao.get(Quotation.class, detail
	// .getQuotation().getId());
	// if (q != null) {
	// detail.setQuotation(q);
	// }
	// }
	// return detail;
	// }
}
