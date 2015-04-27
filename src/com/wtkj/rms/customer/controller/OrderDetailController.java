package com.wtkj.rms.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.controller.BaseController;
import com.wtkj.rms.customer.model.po.OrderDetail;
import com.wtkj.rms.customer.service.OrderDetailServiceI;
import com.wtkj.rms.customer.service.QuotationServiceI;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController extends BaseController {

	@Autowired
	private OrderDetailServiceI orderDetailService;

	@Autowired
	private QuotationServiceI quotationService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/customer/orderDetail/orderDetail";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<OrderDetail> combox(HttpServletRequest request) {
		return orderDetailService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(OrderDetail q, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(orderDetailService.dataGrid(q, ph));
		grid.setTotal(orderDetailService.count(q, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/customer/orderDetail/orderDetailAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(OrderDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			orderDetailService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
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
			orderDetailService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("删除失败！" + e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public OrderDetail get(Long id) {
		return orderDetailService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		OrderDetail orderDetail = orderDetailService.get(id);
		request.setAttribute("orderDetail", orderDetail);
		return "/basic/customer/orderDetail/orderDetailEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(OrderDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			OrderDetail po = orderDetailService.get(vo.getId());
			po.setScheduleNum(vo.getScheduleNum());
			po.setRemark(vo.getRemark());
			po.setSalePrice(vo.getSalePrice());
			po.setAcceptNum(vo.getAcceptNum());
			orderDetailService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		OrderDetail orderDetail = orderDetailService.get(id);
		request.setAttribute("orderDetail", orderDetail);
		return "/basic/customer/orderDetail/orderDetailDetail";
	}

}