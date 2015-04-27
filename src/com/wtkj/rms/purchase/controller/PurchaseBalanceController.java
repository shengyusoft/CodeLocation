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
import com.wtkj.rms.purchase.model.po.PurchaseBalance;
import com.wtkj.rms.purchase.model.po.PurchaseBalanceDetail;
import com.wtkj.rms.purchase.service.PurchaseBalanceDetailServiceI;
import com.wtkj.rms.purchase.service.PurchaseBalanceServiceI;

@Controller
@RequestMapping("/purchaseBalance")
public class PurchaseBalanceController extends BaseController {

	@Autowired
	private PurchaseBalanceServiceI purchaseBalanceService;

	@Autowired
	private PurchaseBalanceDetailServiceI purchaseBalanceDetailService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/purchase/purchaseBalance";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<PurchaseBalance> combox(HttpServletRequest request) {
		return purchaseBalanceService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(PurchaseBalance PurchaseBalance, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(purchaseBalanceService.dataGrid(PurchaseBalance, ph));
		grid.setTotal(purchaseBalanceService.count(PurchaseBalance, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/purchase/purchaseBalanceAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(PurchaseBalance vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null) {
				// 添加时间
				if (vo.getBalanceDt() == null) {
					vo.setBalanceDt(new Date());
				}
				SessionInfo sessionInfo = (SessionInfo) request.getSession()
						.getAttribute(GlobalConstant.SESSION_INFO);

				// 结算人
				if (vo.getUserId() <= 0) {
					if (sessionInfo.getId() > 0) {
						vo.setUserId(sessionInfo.getId());
					}
				}
			}

			Long id = purchaseBalanceService.add(vo, request);
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
	public Json batchAdd(Long purchaseBalanceId, String ids,
			HttpServletRequest request) {
		Json j = new Json();

		PurchaseBalance purchaseBalance = null;
		if (purchaseBalanceId > 0) {
			purchaseBalance = purchaseBalanceService.get(purchaseBalanceId);
		}

		if (!StringUtils.isEmpty(ids)) {
			// 去除最后一个逗号
			if (ids.lastIndexOf(",") == (ids.length() - 1)) {
				ids = ids.substring(0, ids.length() - 1);
			}
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				PurchaseBalanceDetail detail = new PurchaseBalanceDetail();
				if (purchaseBalance != null) {
					detail.setPurchaseBalance(purchaseBalance);
				}

				// 商品信息
				Goods goods = new Goods();
				if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
					goods.setId(Long.valueOf(id));
					detail.setGoods(goods);

					long num = purchaseBalanceDetailService.count(detail, null);
					if (num > 0) {
						continue;
					}
				}

				try {
					purchaseBalanceDetailService.add(detail, request);
				} catch (Exception e) {
					e.printStackTrace();
					j.setMsg(e.getMessage());
					j.setSuccess(false);
					return j;
				}
			}
		}
		j.setMsg("结算单生成成功!");
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
			purchaseBalanceService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public PurchaseBalance get(Long id) {
		return purchaseBalanceService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		PurchaseBalance p = purchaseBalanceService.get(id);
		request.setAttribute("purchaseBalance", p);
		return "/basic/purchase/purchaseBalanceEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PurchaseBalance vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null && vo.getId() > 0) {
				PurchaseBalance po = purchaseBalanceService.get(vo.getId());
				if (vo.getCustomer() != null) {
					po.setCustomer(vo.getCustomer());
				}
				
				if (vo.getBalanceDt() != null) {
					po.setBalanceDt(vo.getBalanceDt());
				}

				if (vo.getUserId() > 0) {
					po.setUserId(vo.getUserId());
				}

				purchaseBalanceService.edit(po, request);
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
		PurchaseBalance p = purchaseBalanceService.get(id);
		request.setAttribute("purchaseBalance", p);
		return "/basic/purchase/purchaseBalanceDetail";
	}

}