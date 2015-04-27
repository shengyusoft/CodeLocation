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
import com.wtkj.rms.customer.model.po.Order;
import com.wtkj.rms.customer.model.po.OrderDetail;
import com.wtkj.rms.customer.service.OrderServiceI;

@Service
public class OrderServiceImpl implements OrderServiceI {

	@Autowired
	private BaseDaoI<Order> orderDao;

	@Autowired
	private BaseDaoI<OrderDetail> orderDetailDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public Long add(Order vo, HttpServletRequest request) {
		return (Long) orderDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Order p = orderDao.get(Order.class, id);
		orderDao.delete(p);
	}

	@Override
	public void delete(String ids) {

		String sql = "delete from t_order where id in (" + ids + ")";
		// 删除关联表

		String sql2 = "delete from order_detail where orderId in (" + ids + ")";
		try {
			orderDetailDao.executeSql(sql2);
			orderDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Order vo, HttpServletRequest request) {
		orderDao.update(vo);
	}

	@Override
	public Order get(Long id) {
		return orderDao.get(Order.class, id);

	}

	@Override
	public List<Order> dataGrid(Order vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Order t ";
		List<Order> l = orderDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (Order Order : l) {
			if (Order.getUserId() > 0) {
				Tuser user = userDao.get(Tuser.class, Order.getUserId());
				Order.setUserName(user.getName());
			}
		}

		return l;
	}

	@Override
	public List<Order> findAll() {
		return orderDao.find(" from Order t ");
	}

	@Override
	public Long count(Order vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Order t ";
		return orderDao.count("select count(*) " + hql + whereHql(vo, params),
				params);
	}

	private String whereHql(Order vo, Map<String, Object> params) {
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
	public List<Order> checkRelate(String ids) {
		return null;
	}

}
