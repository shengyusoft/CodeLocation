package com.wtkj.rms.purchase.controller;

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
import com.wtkj.rms.goods.service.GoodsServiceI;
import com.wtkj.rms.purchase.model.po.PurchasePlanDetail;
import com.wtkj.rms.purchase.service.PurchasePlanDetailServiceI;
import com.wtkj.rms.purchase.service.PurchasePlanServiceI;

@Controller
@RequestMapping("/purchasePlanDetail")
public class PurchasePlanDetailController extends BaseController {

	@Autowired
	private PurchasePlanDetailServiceI purchasePlanDetailService;

	@Autowired
	private PurchasePlanServiceI purchasePlanServiceI;

	@Autowired
	private GoodsServiceI goodsService;
	
	private static final String URL = "/basic/purchase/purchasePlanDetail/purchasePlanDetail";
	
	protected String order = "asc";// asc/desc

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return URL;
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<PurchasePlanDetail> combox(HttpServletRequest request) {
		return purchasePlanDetailService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(PurchasePlanDetail q, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(purchasePlanDetailService.dataGrid(q, ph));
		grid.setTotal(purchasePlanDetailService.count(q, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return URL+"Add";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(PurchasePlanDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			purchasePlanDetailService.add(vo, request);
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
			purchasePlanDetailService.delete(ids);
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
	public PurchasePlanDetail get(Long id) {
		return purchasePlanDetailService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		PurchasePlanDetail d = purchasePlanDetailService.get(id);
		request.setAttribute("purchasePlanDetail", d);
		return URL+"Edit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PurchasePlanDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			PurchasePlanDetail po = purchasePlanDetailService.get(vo.getId());
			po.setScheduleNum(vo.getScheduleNum());
			po.setRemark(vo.getRemark());
			purchasePlanDetailService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		PurchasePlanDetail p = purchasePlanDetailService.get(id);
		request.setAttribute("purchasePlanDetail", p);
		return URL+"Detail";
	}

}