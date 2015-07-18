package com.wtkj.rms.bidbond.controller;

import java.math.BigDecimal;
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
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.common.utils.NumberToCN;
import com.wtkj.rms.bidbond.model.BidBondVo;
import com.wtkj.rms.bidbond.service.BidBondServiceI;

//缴纳退回申请
@Controller
@RequestMapping("/bidBond")
public class BidBondController extends BaseController {

	@Autowired
	private BidBondServiceI bidBondService;

	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request, int type) {
		if (type == 0) {
			return "/basic/bidbond/bidBondPay";
		} else {
			return "/basic/bidbond/bidBondBack";
		}
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<BidBondVo> findAll() {
		return bidBondService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(BidBondVo vo, PageFilter ph, HttpServletRequest request) {
		Grid grid = new Grid();
		SessionInfo sessionInfo = getSessionInfo(request);

		if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
			User user = userService.get(sessionInfo.getId());
			// 普通用户看到自己的申请信息
			if (user.getRoleNames().indexOf("普通用户") >= 0) {
				vo.setApplierId(sessionInfo.getId());
			}
		}

		grid.setRows(bidBondService.dataGrid(vo, ph));
		grid.setTotal(bidBondService.count(vo, ph));
		return grid;
	}

	/**
	 * CRUD以及处理的界面统一管理
	 * 
	 * @param request
	 * @param type业务类型
	 *            缴纳，退回
	 * @param handlerType处理类型add
	 *            ,detail,edit,handler
	 * @return
	 */
	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, int type,
			String viewType, Long id) {
		// 获取当前用户
		SessionInfo sessionInfo = getSessionInfo(request);
		User u = userService.get(sessionInfo.getId());
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		BidBondVo bidBond = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			bidBond = bidBondService.get(id);
			if ("handler_cn".equals(viewType)) {
				if (bidBond.getHandlerId() == null
						|| bidBond.getHandlerId() <= 0) {
					bidBond.setHandlerId(u.getId());
					bidBond.setHandlerName(u.getName());
				}
				if (bidBond.getToAccountDT() == null) {
					bidBond.setToAccountDT(new Date());
				}
				if (bidBond.getHandlerDT() == null) {
					bidBond.setHandlerDT(new Date());
				}

			} else if ("handler_kj".equals(viewType)) {
				if (bidBond.getHandlerId2() == null
						|| bidBond.getHandlerId2() <= 0) {
					bidBond.setHandlerId2(u.getId());
					bidBond.setHandlerName2(u.getName());
				}
				if (bidBond.getOutAccountDT() == null) {
					bidBond.setOutAccountDT(new Date());
				}
				if (bidBond.getHandlerDT2() == null) {
					bidBond.setHandlerDT2(new Date());
				}
			}
		} else {
			// 添加
			bidBond = new BidBondVo();
			if (u != null) {
				bidBond.setApplierName(u.getName());
				bidBond.setApplierId(u.getId());
				bidBond.setApplierPhone(u.getMobilePhone());
				bidBond.setApplyDT(new Date());
			}
		}
		request.setAttribute("bidBond", bidBond);
		request.setAttribute("viewType", viewType);
		// 申请人和申请时间

		// 根据类型返回 缴纳或者退回页面
		if (type == 0) {
			return "/basic/bidbond/bidBondPayView";
		} else {
			return "/basic/bidbond/bidBondBackView";
		}
	}

	// 提交的时候需要传type值
	@RequestMapping("/save")
	@ResponseBody
	public Json save(BidBondVo vo, String viewType, HttpServletRequest request) {
		// 普通员工提交
		Json j = new Json();
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		try {
			// 缴号自动生成，编号规则为年份+月份+编号
			vo.setIdNumber(generateIdNum(vo.getType()));

			// 保证金转大写
			if (vo.getBondFee() != null) {
				BigDecimal fee = new BigDecimal(vo.getBondFee());
				String feeCH = NumberToCN.number2CNMontrayUnit(fee);
				vo.setBondFeeCH(feeCH);
			}

			if ("handler_cn".equals(viewType)) {
				// 到帐金额转大写
				if (vo.getToAccountFee() != null) {
					BigDecimal fee = new BigDecimal(vo.getToAccountFee());
					String feeCH = NumberToCN.number2CNMontrayUnit(fee);
					vo.setToAccountFeeCH(feeCH);
				}
				vo.setState(1);// 出纳已确认
			} else if ("handler_kj".equals(viewType)) {
				// 转出金额转大写
				if (vo.getOutAccountFee() != null && vo.getOutAccountFee() > 0) {
					BigDecimal fee = new BigDecimal(vo.getOutAccountFee());
					String feeCH = NumberToCN.number2CNMontrayUnit(fee);
					vo.setOutAccountFeeCH(feeCH);
				}
				vo.setState(2);// 会计已确认
			}
			// 添加
			if (vo.getId() == null || vo.getId() <= 0) {
				if (vo.getOption() == -1) {// 提交
					vo.setState(-1);
				}
				bidBondService.add(vo, request);

				// TODO 发送短信
				if (vo.getOption() == -1) {// 提交
				}

			} else {// 编辑或者处理
				if (vo.getOption() == 1 && "edit".equals(viewType)) {// 提交
					vo.setState(-1);
				}
				bidBondService.edit(vo, request);

				// TODO 发送短信
				if (vo.getOption() == -1) {// 提交
				}
			}

			if ("add".equals(viewType)) {
				j.setMsg("添加成功！");
			} else if ("edit".equals(viewType)) {
				j.setMsg("修改成功！");
			} else if ("handler_cn".equals(viewType)) {
				j.setMsg("出纳确认成功！");
			} else if ("handler_kj".equals(viewType)) {
				j.setMsg("会计确认成功！");
			}
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	// 生成缴号:编号规则为年份+月份+编号
	private String generateIdNum(int type) {
		long number = bidBondService.countAll(type);// 获取缴纳申请总数
		String dateStr = DateUtil.convertDateToString(new Date(), "yyyyMMdd");
		String nstr = String.format("%04d", number + 1);// 4位数补零
		return dateStr + nstr;
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
			bidBondService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public BidBondVo get(Long id) {
		return bidBondService.get(id);
	}

	// 查找有没有需要提醒的任务
	@RequestMapping("/findHanlder")
	@ResponseBody
	public Json findHanlder(HttpServletRequest request, Long id) {
		Json j = new Json();
		try {
			SessionInfo sessionInfo = (SessionInfo) request.getSession()
					.getAttribute(GlobalConstant.SESSION_INFO);
			if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
				User user = userService.get(sessionInfo.getId());
				// 普通用户看到自己的申请信息
				if (user.getRoleNames().indexOf("出纳") >= 0) {
					BidBondVo vo = new BidBondVo();
					vo.setState(0);
					Long num = bidBondService.countByState(1);
					String msg = num + "个保证金缴纳退回业务，请注意处理，详情查看那保证金管理！";
					j.setMsg(msg);
				}
			}
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		j.setSuccess(true);
		return j;
	}
}