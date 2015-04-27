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
import com.wtkj.rms.customer.model.po.Quotation;
import com.wtkj.rms.customer.model.po.QuotationDetail;
import com.wtkj.rms.customer.service.QuotationDetailServiceI;
import com.wtkj.rms.customer.service.QuotationServiceI;
import com.wtkj.rms.goods.model.Goods;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Controller
@RequestMapping("/quotation")
public class QuotationController extends BaseController {

	@Autowired
	private QuotationServiceI quotationService;

	@Autowired
	private QuotationDetailServiceI quotationDetailService;

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/customer/quotation/quotation";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Quotation> combox(HttpServletRequest request) {
		return quotationService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Quotation quotation, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(quotationService.dataGrid(quotation, ph));
		grid.setTotal(quotationService.count(quotation, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/customer/quotation/quotationAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Quotation vo, HttpServletRequest request) {
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
			Long id = quotationService.add(vo, request);
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
	public Json batchAdd(Long quotationId, String ids,
			HttpServletRequest request) {
		Json j = new Json();

		// 当前报价单
		Quotation quotation = null;
		if (quotationId > 0) {
			quotation = quotationService.get(quotationId);
		}

		// 添加商品
		if (!StringUtils.isEmpty(ids)) {
			// 去除最后一个逗号
			if (ids.lastIndexOf(",") == (ids.length() - 1)) {
				ids = ids.substring(0, ids.length() - 1);
			}
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				QuotationDetail detail = new QuotationDetail();
				// GoodsVo goodsVo = goodsService.get(Long.valueOf(id));
				// BeanUtils.copyProperties(goodsVo, goods);
				Goods goods = new Goods();
				if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
					goods.setId(Long.valueOf(id));
				}
				// 商品信息
				detail.setGoods(goods);

				// 关联报价单
				if (quotation != null) {
					detail.setQuotation(quotation);
				}

				try {
					quotationDetailService.add(detail, request);
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
			quotationService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Quotation get(Long id) {
		return quotationService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Quotation quotation = quotationService.get(id);
		request.setAttribute("quotation", quotation);
		return "/basic/customer/quotation/quotationEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Quotation vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo != null && vo.getId() > 0) {
				Quotation po = quotationService.get(vo.getId());
				po.setStartDt(vo.getStartDt());
				po.setEndDt(vo.getEndDt());
				po.setCustomer(vo.getCustomer());
				po.setUpdateDt(new Date());
				quotationService.edit(po, request);
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
		Quotation quotation = quotationService.get(id);
		request.setAttribute("quotation", quotation);
		return "/basic/customer/quotation/quotationDetail";
	}

}