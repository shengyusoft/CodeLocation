package com.wtkj.rms.purchase.controller;

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
import com.wtkj.rms.goods.model.Goods;
import com.wtkj.rms.goods.service.GoodsServiceI;
import com.wtkj.rms.purchase.model.po.PurchasePlan;
import com.wtkj.rms.purchase.model.po.PurchasePlanDetail;
import com.wtkj.rms.purchase.service.PurchasePlanDetailServiceI;
import com.wtkj.rms.purchase.service.PurchasePlanServiceI;

@Controller
@RequestMapping("/purchasePlan")
public class PurchasePlanController extends BaseController {

	@Autowired
	private PurchasePlanServiceI purchasePlanService;

	@Autowired
	private PurchasePlanDetailServiceI purchasePlanDetailService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/purchase/purchasePlan";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<PurchasePlan> combox(HttpServletRequest request) {
		return purchasePlanService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(PurchasePlan purchasePlan, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(purchasePlanService.dataGrid(purchasePlan, ph));
		grid.setTotal(purchasePlanService.count(purchasePlan, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/purchase/purchasePlanAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(PurchasePlan vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null) {
				// 添加时间
				vo.setAddDt(new Date());
				SessionInfo sessionInfo = (SessionInfo) request.getSession()
						.getAttribute(GlobalConstant.SESSION_INFO);

				// 添加人
				if (sessionInfo.getId() > 0) {
					vo.setUserId(sessionInfo.getId());
				}
			}
			Long id = purchasePlanService.add(vo, request);
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
	public Json batchAdd(Long purchasePlanId, String ids, HttpServletRequest request) {
		Json j = new Json();

		PurchasePlan purchasePlan = null;
		if (purchasePlanId > 0) {
			purchasePlan = purchasePlanService.get(purchasePlanId);
		}

		if (!StringUtils.isEmpty(ids)) {
			// 去除最后一个逗号
			if (ids.lastIndexOf(",") == (ids.length() - 1)) {
				ids = ids.substring(0, ids.length() - 1);
			}
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				PurchasePlanDetail detail = new PurchasePlanDetail();
				if (purchasePlan != null) {
					detail.setPurchasePlan(purchasePlan);
				}

				// 商品信息
				Goods goods = new Goods();
				if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
					goods.setId(Long.valueOf(id));
					detail.setGoods(goods);

					long num = purchasePlanDetailService.count(detail, null);
					if (num > 0) {
						continue;
					}
				}

				try {
					purchasePlanDetailService.add(detail, request);
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
			purchasePlanService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public PurchasePlan get(Long id) {
		return purchasePlanService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		PurchasePlan p = purchasePlanService.get(id);
		request.setAttribute("purchasePlan", p);
		return "/basic/purchase/purchasePlanEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PurchasePlan vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null && vo.getId() > 0) {
				PurchasePlan po = purchasePlanService.get(vo.getId());
				po.setCustomer(vo.getCustomer());
				po.setUpdateDt(new Date());
				purchasePlanService.edit(po, request);
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
		PurchasePlan p = purchasePlanService.get(id);
		request.setAttribute("purchasePlan", p);
		return "/basic/purchase/purchasePlanDetail";
	}

}