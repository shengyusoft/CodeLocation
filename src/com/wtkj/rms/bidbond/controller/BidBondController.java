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

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request, int type) {
		// 根据类型返回 缴纳或者退回页面
		BidBondVo bidBond = new BidBondVo();
		SessionInfo sessionInfo = getSessionInfo(request);
		if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
			User u = userService.get(sessionInfo.getId());
			if(u != null){
				bidBond.setApplierName(u.getName());
				bidBond.setApplierPhone(u.getMobilePhone());
//				bidBond.setApplyDT(new Date());
			}
		}
		request.setAttribute("bidBond", bidBond);
		// 申请人和申请时间
		
		if (type == 0) {
			return "/basic/bidbond/bidBondPayAdd";
		} else {
			return "/basic/bidbond/bidBondBackAdd";
		}
	}

	// 提交的时候需要传type值
	@RequestMapping("/add")
	@ResponseBody
	public Json add(BidBondVo vo, HttpServletRequest request) {
		// 普通员工提交
		Json j = new Json();
		try {
			// 缴号自动生成，编号规则为年份+月份+编号
			vo.setIdNumber(generateIdNum(vo.getType()));

			// 申请人和申请时间
			SessionInfo sessionInfo = getSessionInfo(request);
			if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
				vo.setApplierId(sessionInfo.getId());
			}
			vo.setApplyDT(new Date());

			// 保证金转大写
			if (vo.getBondFee() != null) {
				BigDecimal fee = new BigDecimal(vo.getBondFee());
				String feeCH = NumberToCN.number2CNMontrayUnit(fee);
				vo.setBondFeeCH(feeCH);
			}

			bidBondService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
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

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		BidBondVo bidBond = bidBondService.get(id);
		request.setAttribute("bidBond", bidBond);
		if (bidBond.getType() == 0) {
			return "/basic/bidbond/bidBondPayEdit";// 缴纳
		} else {
			return "/basic/bidbond/bidBondBackEdit";// 退款
		}
	}

	// 申请人编辑
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(BidBondVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			bidBondService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		BidBondVo bidBond = bidBondService.get(id);
		request.setAttribute("bidBond", bidBond);
		if (bidBond.getType() == 0) {
			return "/basic/bidbond/bidBondPayDetail";// 缴纳
		} else {
			return "/basic/bidbond/bidBondBackDetail";// 退款
		}
	}

	/**
	 * 财务处理
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/handlerPage")
	public String handlerPage(HttpServletRequest request, Long id) {
		BidBondVo bidBond = bidBondService.get(id);
		request.setAttribute("bidBond", bidBond);
		if (bidBond.getType() == 0) {
			return "/basic/bidbond/bidBondPayHandler";// 缴纳
		} else {
			return "/basic/bidbond/bidBondBackHandler";// 退款
		}
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

	/**
	 * 财务提交
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping("/commit")
	@ResponseBody
	public Json commit(BidBondVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			// 出纳确认提交后不能修改啊
			vo.setState(1);
			// 办理人办理时间
			SessionInfo sessionInfo = getSessionInfo(request);
			if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
				vo.setHandlerId(sessionInfo.getId());
			}

			if (vo.getHandlerDT() == null) {
				vo.setHandlerDT(new Date());
			}

			if (vo.getOutAccountDT() == null) {
				vo.setOutAccountDT(new Date());
			}

			// 转出金额转大写
			if (vo.getOutAccountFee() != null && vo.getOutAccountFee() > 0) {
				BigDecimal fee = new BigDecimal(vo.getOutAccountFee());
				String feeCH = NumberToCN.number2CNMontrayUnit(fee);
				vo.setOutAccountFeeCH(feeCH);
			}

			// 到帐金额转大写
			if (vo.getToAccountFee() != null && vo.getToAccountFee() > 0) {
				BigDecimal fee = new BigDecimal(vo.getToAccountFee());
				String feeCH = NumberToCN.number2CNMontrayUnit(fee);
				vo.setToAccountFeeCH(feeCH);
			}

			bidBondService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}