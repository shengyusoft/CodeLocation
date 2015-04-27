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
import com.wtkj.rms.purchase.model.po.PurchaseBalanceDetail;
import com.wtkj.rms.purchase.service.PurchaseBalanceDetailServiceI;
import com.wtkj.rms.purchase.service.PurchaseBalanceServiceI;

@Controller
@RequestMapping("/purchaseBalanceDetail")
public class PurchaseBalanceDetailController extends BaseController {

	@Autowired
	private PurchaseBalanceDetailServiceI purchaseBalanceDetailService;

	@Autowired
	private PurchaseBalanceServiceI purchaseBalanceServiceI;

	@Autowired
	private GoodsServiceI goodsService;
	
	private static final String URL = "/basic/purchase/purchaseDetail/purchaseBalanceDetail";
	
	protected String order = "asc";// asc/desc

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return URL;
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<PurchaseBalanceDetail> combox(HttpServletRequest request) {
		return purchaseBalanceDetailService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(PurchaseBalanceDetail q, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(purchaseBalanceDetailService.dataGrid(q, ph));
		grid.setTotal(purchaseBalanceDetailService.count(q, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return URL+"Add";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(PurchaseBalanceDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			purchaseBalanceDetailService.add(vo, request);
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
			purchaseBalanceDetailService.delete(ids);
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
	public PurchaseBalanceDetail get(Long id) {
		return purchaseBalanceDetailService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		PurchaseBalanceDetail d = purchaseBalanceDetailService.get(id);
		request.setAttribute("purchaseBalanceDetail", d);
		return URL+"Edit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PurchaseBalanceDetail vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			PurchaseBalanceDetail po = purchaseBalanceDetailService.get(vo.getId());
			po.setAcceptNum(vo.getAcceptNum());
			po.setRemark(vo.getRemark());
			purchaseBalanceDetailService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		PurchaseBalanceDetail p = purchaseBalanceDetailService.get(id);
		request.setAttribute("purchaseBalanceDetail", p);
		return URL+"Detail";
	}

}