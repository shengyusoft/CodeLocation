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
import com.wtkj.rms.customer.model.po.QuotationDetail;
import com.wtkj.rms.customer.service.QuotationDetailServiceI;
import com.wtkj.rms.customer.service.QuotationServiceI;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Controller
@RequestMapping("/quotationDetail")
public class QuotationDetailController extends BaseController {

	@Autowired
	private QuotationDetailServiceI quotationDetailService;

	@Autowired
	private QuotationServiceI quotationService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/customer/quotationDetail/quotationDetail";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<QuotationDetail> combox(HttpServletRequest request) {
		return quotationDetailService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(QuotationDetail q, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(quotationDetailService.dataGrid(q, ph));
		grid.setTotal(quotationDetailService.count(q, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/customer/quotationDetail/quotationGenerate";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(QuotationDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			quotationDetailService.add(vo, request);
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
			quotationDetailService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("删除失败！"+e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public QuotationDetail get(Long id) {
		return quotationDetailService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		QuotationDetail quotationDetail = quotationDetailService.get(id);
		request.setAttribute("quotationDetail", quotationDetail);
		return "/basic/customer/quotationDetail/quotationDetailEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(QuotationDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			quotationDetailService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		QuotationDetail quotationDetail = quotationDetailService.get(id);
		request.setAttribute("quotationDetail", quotationDetail);
		return "/basic/customer/quotationDetail/quotationDetailDetail";
	}

}