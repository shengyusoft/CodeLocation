package com.wtkj.rms.report.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wtkj.common.controller.BaseController;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.customer.model.po.Customer;
import com.wtkj.rms.customer.model.po.Order;
import com.wtkj.rms.customer.service.OrderDetailServiceI;
import com.wtkj.rms.customer.service.OrderServiceI;
import com.wtkj.rms.customer.service.QuotationDetailServiceI;
import com.wtkj.rms.customer.service.QuotationServiceI;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;
import com.wtkj.rms.purchase.service.PurchasePlanDetailServiceI;
import com.wtkj.rms.purchase.service.PurchasePlanServiceI;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {

	@Autowired
	protected TaskServiceI taskService;

	@Autowired
	protected QuotationServiceI quotationService;

	@Autowired
	protected QuotationDetailServiceI quotationDetailService;

	@Autowired
	protected OrderServiceI orderService;

	@Autowired
	protected OrderDetailServiceI orderDetailService;

	@Autowired
	protected PurchasePlanServiceI purchasePlanService;

	@Autowired
	protected PurchasePlanDetailServiceI purchasePlanDetailService;

	// 维护档案报表
	@RequestMapping("/taskRecordManager")
	public String manager(HttpServletRequest request) {
		return "/basic/report/taskRecord";
	}
	
	
	@RequestMapping("/order")
	public ModelAndView order(HttpServletRequest request, Long orderId,
			String title) throws IOException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		// 设置title
		title = new String(title.getBytes("iso-8859-1"), "UTF-8");
		if (!StringUtils.isEmpty(title)) {
			parameterMap.put("title", title);
		}
		Order order = null;
		Customer customer = null;
		if (orderId > 0) {
			order = orderService.get(orderId);
		}

		if (order != null) {
			parameterMap.put("orderId", String.valueOf(orderId));
			customer = order.getCustomer();
			if (customer != null) {
				parameterMap.put("customerName", customer.getCompanyName());
				parameterMap.put("servicePhone", customer.getServicePhone());
				parameterMap.put("fax", customer.getFax());
				parameterMap.put("complainTel", order.getComplaintTel());

				// 订单时间
				parameterMap.put("orderDt",
						DateUtil.convertDateToString(order.getOrderDt()));
				// 送达时间
				parameterMap.put("arriveDt", DateUtil.convertDateToString(
						order.getArrivedDt(), "yyyy-MM-dd HH:mm"));
			}
		}
		parameterMap.put("format", "pdf");
		return new ModelAndView("orderReport", parameterMap);
	}


	/**
	 * 利率报表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/bxreport")
	public ModelAndView rate(HttpServletRequest request) throws IOException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("format", "excel");
		return new ModelAndView("bxReport", parameterMap);
	}

	/**
	 * 销售报表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/sale")
	public ModelAndView sale(HttpServletRequest request) throws IOException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("format", "pdf");
		return new ModelAndView("saleReport", parameterMap);
	}
}