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
import com.wtkj.rms.customer.model.po.Customer;
import com.wtkj.rms.customer.service.CustomerServiceI;

@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

	@Autowired
	private CustomerServiceI customerService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/customer/customer";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Customer> combox(HttpServletRequest request) {
		return customerService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Customer customer, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(customerService.dataGrid(customer, ph));
		grid.setTotal(customerService.count(customer, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/customer/customerAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Customer vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			customerService.add(vo, request);
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
			customerService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Customer get(Long id) {
		return customerService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Customer customer = customerService.get(id);
		request.setAttribute("customer", customer);
		return "/basic/customer/customerEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Customer vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			customerService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Customer customer = customerService.get(id);
		request.setAttribute("customer", customer);
		return "/basic/customer/customerDetail";
	}

}