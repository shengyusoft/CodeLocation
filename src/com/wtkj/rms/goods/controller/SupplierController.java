package com.wtkj.rms.goods.controller;

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
import com.wtkj.rms.goods.model.Supplier;
import com.wtkj.rms.goods.service.SupplierServiceI;

@Controller
@RequestMapping("/supplier")
public class SupplierController extends BaseController {

	@Autowired
	private SupplierServiceI supplierService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/supplier/supplier";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Supplier> combox(HttpServletRequest request) {
		return supplierService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Supplier supplier, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(supplierService.dataGrid(supplier, ph));
		grid.setTotal(supplierService.count(supplier, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/supplier/supplierAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Supplier vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			supplierService.add(vo, request);
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
			supplierService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Supplier get(Long id) {
		return supplierService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Supplier supplier = supplierService.get(id);
		request.setAttribute("supplier", supplier);
		return "/basic/supplier/supplierEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Supplier vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			supplierService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Supplier supplier = supplierService.get(id);
		request.setAttribute("supplier", supplier);
		return "/basic/supplier/supplierDetail";
	}

}