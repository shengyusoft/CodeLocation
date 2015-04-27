package com.wtkj.rms.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.customer.model.po.OrderDetail;
import com.wtkj.rms.customer.service.OrderDetailServiceI;
import com.wtkj.rms.goods.model.Goods;

@Service
public class OrderDetailServiceImpl implements OrderDetailServiceI {

	@Autowired
	private BaseDaoI<OrderDetail> orderDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(OrderDetail vo, HttpServletRequest request) {
		return (Long) orderDetailDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		OrderDetail p = orderDetailDao.get(OrderDetail.class, id);
		orderDetailDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from order_detail where id in (" + ids + ")";
		try {
			orderDetailDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(OrderDetail vo, HttpServletRequest request) {
		orderDetailDao.update(vo);
	}

	@Override
	public OrderDetail get(Long id) {
		return orderDetailDao.get(OrderDetail.class, id);

	}

	@Override
	public List<OrderDetail> dataGrid(OrderDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from OrderDetail t ";
		List<OrderDetail> l = orderDetailDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());
		for (OrderDetail orderDetail : l) {
			Goods goods = orderDetail.getGoods();
			if (goods != null && goods.getType() != null) {
				orderDetail.setGoodsTypeText(goods.getType().getText());
			}
		}
		return l;
	}

	@Override
	public List<OrderDetail> findAll() {
		return orderDetailDao.find(" from OrderDetail t ");
	}

	@Override
	public Long count(OrderDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from OrderDetail t ";
		return orderDetailDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(OrderDetail vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getGoods() != null) {
				hql += " and t.goods.id = :gid";
				params.put("gid", vo.getGoods().getId());
			}
			
			if(vo.getTorder() != null){
				hql += " and t.torder.id = :oid";
				params.put("oid", vo.getTorder().getId());
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
	public List<OrderDetail> checkRelate(String ids) {
		return null;
	}

}
