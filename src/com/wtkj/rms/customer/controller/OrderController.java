package com.wtkj.rms.customer.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.rms.customer.model.po.Order;
import com.wtkj.rms.customer.model.po.OrderDetail;
import com.wtkj.rms.customer.service.OrderDetailServiceI;
import com.wtkj.rms.customer.service.OrderServiceI;
import com.wtkj.rms.goods.model.Goods;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

	@Autowired
	private OrderServiceI orderService;

	@Autowired
	private OrderDetailServiceI orderDetailService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/customer/order/order";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Order> combox(HttpServletRequest request) {
		return orderService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Order o, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(orderService.dataGrid(o, ph));
		grid.setTotal(orderService.count(o, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/customer/order/orderAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Order vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null) {
				// 添加时间
				vo.setOrderDt(new Date());
				SessionInfo sessionInfo = (SessionInfo) request.getSession()
						.getAttribute(GlobalConstant.SESSION_INFO);

				// 添加人
				if (sessionInfo.getId() > 0) {
					vo.setUserId(sessionInfo.getId());
				}
			}
			Long id = orderService.add(vo, request);
			if (id > 0) {
				vo.setId(id);
			}
			j.setSuccess(true);
			j.setObj(vo);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 批量添加商品至报价单 生成报价单
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping("/batchAdd")
	@ResponseBody
	public Json batchAdd(Long orderId, String ids, HttpServletRequest request) {
		Json j = new Json();

		// 当前报价单
		Order order = null;
		if (orderId > 0) {
			order = orderService.get(orderId);
		}

		// 添加商品
		if (!StringUtils.isEmpty(ids)) {
			// 去除最后一个逗号
			if (ids.lastIndexOf(",") == (ids.length() - 1)) {
				ids = ids.substring(0, ids.length() - 1);
			}
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				OrderDetail detail = new OrderDetail();
				// GoodsVo goodsVo = goodsService.get(Long.valueOf(id));
				// BeanUtils.copyProperties(goodsVo, goods);
				
				// 关联报价单
				if (order != null) {
					detail.setTorder(order);
				}
				
				// 商品信息
				Goods goods = new Goods();
				if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
					goods.setId(Long.valueOf(id));
					detail.setGoods(goods);
					
					long num = orderDetailService.count(detail, null);
					if(num > 0){
						continue;
					}
				}

				try {
					orderDetailService.add(detail, request);
				} catch (Exception e) {
					e.printStackTrace();
					j.setMsg(e.getMessage());
					j.setSuccess(false);
					return j;
				}
			}
		}
		j.setMsg("报价单生成成功!");
		j.setSuccess(true);
		return j;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}
		try {
			orderService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Order get(Long id) {
		return orderService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Order order = orderService.get(id);
		request.setAttribute("order", order);
		return "/basic/customer/order/orderEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Order vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null && vo.getId() > 0) {
				Order po = orderService.get(vo.getId());
				po.setComplaintTel(vo.getComplaintTel());
				po.setSign(vo.isSign());
				po.setArrivedDt(vo.getArrivedDt());
				po.setCustomer(vo.getCustomer());
				po.setUpdateDt(new Date());
				orderService.edit(po, request);
				j.setSuccess(true);
				j.setMsg("编辑成功！");
			}
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Order order = orderService.get(id);
		request.setAttribute("order", order);
		return "/basic/customer/order/orderDetail";
	}

}