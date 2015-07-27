package com.wtkj.rms.bidbond.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.common.utils.NumberToCN;
import com.wtkj.common.utils.NumberUtils;
import com.wtkj.common.utils.SmsUtil;
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
			String idNum = validateIdNumber(generateIdNum(vo.getType()));
			vo.setIdNumber(idNum);
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

			} else {// 编辑或者处理
				if (vo.getOption() == 1 && "edit".equals(viewType)) {// 提交
					vo.setState(-1);
				}
				bidBondService.edit(vo, request);
			}
			if (vo.getState() != 0) {
				Map<String, String> msgMap = getSendMsg(request, vo);
				if (!StringUtils.isEmpty(msgMap.get("phone1"))) {// 发送不同短信
					SmsUtil.sendMsg(msgMap.get("msg1"), msgMap.get("phone1"));
					SmsUtil.sendMsg(msgMap.get("msg2"), msgMap.get("phone2"));
				} else {// 发送相同短信
					SmsUtil.sendMsg(msgMap.get("msg"), msgMap.get("phone"));
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
	
	private String validateIdNumber(String idNum){
		Long num = bidBondService.countByIdNumber(idNum);
		if(num > 0 ){
			idNum = validateIdNumber(String.valueOf(Long.valueOf(idNum)+1));
		}
		return idNum;
	}
	
	

	private Map<String, String> getSendMsg(HttpServletRequest request,
			BidBondVo vo) throws Exception {
		Map<String, String> msgMap = new HashMap<String, String>();
		// SessionInfo sessionInfo = getSessionInfo(request);
		// User u = userService.get(sessionInfo.getId());
		// 短信内容
		int type = vo.getType();

		// 申请人信息
		String applierPhone = "";
		String applyName = "";
		User applier = userService.get(vo.getApplierId());
		if (applier != null) {
			applierPhone = StringUtils.isEmpty(applier.getMobilePhone()) ? "<暂无>"
					: applier.getMobilePhone();
			applyName = StringUtils.isEmpty(applier.getName()) ? "<暂无>"
					: applier.getName();
		}

		// 户名（对应短信的缴纳收款人或者退还付款人(信阳市公共资源交易中心)）
		String accountName = StringUtils.isEmpty(vo.getPayeeAccountName()) ? ""
				: vo.getPayeeAccountName();

		if (type == 0) {// 缴纳
			if (vo.getState() == -1) {// 申请人提交，系统向出纳发送你短信
				/**
				 * eg: 员工武晓辉向您发起一笔保证金缴纳业务，金额1000000.00元，转款人姓名张大伟，请查证
				 */
				msgMap.put("phone", this.getSenderByRole("role_cashier"));
				msgMap.put("msg",
						"员工" + applyName + "向您发起一笔保证金缴纳业务，金额" + vo.getBondFee()
								+ "元，转款人姓名" + vo.getPayer() + "，请查证");

			} else if (vo.getState() == 1) {// 出纳确认后，系统向会计发送你短信

				/**
				 * eg:出纳向您发起一笔保证金缴纳业务，金额1000000.00元，收款人信阳市公共资源交易中心，截止时间11月11日11时
				 */
				// 截止日期默认为存储的截止日期，如果没有，就取当前的
				Date jzrq = vo.getPayeeHandleDT() == null ? new Date() : vo
						.getPayeeHandleDT();
				msgMap.put("phone", this.getSenderByRole("role_account"));
				msgMap.put(
						"msg",
						"出纳向您发起一笔保证金缴纳业务，金额"
								+ vo.getBondFee()
								+ "元，收款人"
								+ accountName
								+ "，截止时间"
								+ DateUtil.convertDateToString(jzrq,
										"yyyy年MM月dd日 HH时"));

			} else if (vo.getState() == 2) {// 会计确认后，系统分别向“申请人”和“出纳”发送短信
				/**
				 * eg:您申请的信阳市公共资源交易中心1000000.00元保证金正在办理，如有疑问请致电18888888888
				 */
				String handlerPhone = "";// 获取操作人号码
				if (vo.getHandlerId2() != null) {
					User handler = userService.get(vo.getHandlerId2());
					handlerPhone = StringUtils
							.isEmpty(handler.getMobilePhone()) ? "" : handler
							.getMobilePhone();
				}

				if (StringUtils.isEmpty(applierPhone)) {
					msgMap.put("phone", this.getSenderByRole("role_cashier"));
				} else {
					msgMap.put(
							"phone",
							applierPhone + ","
									+ this.getSenderByRole("role_cashier"));
				}

				msgMap.put(
						"msg",
						"您申请的"
								+ accountName
								+ NumberUtils.parseNum2String(null,
										vo.getBondFee()) + "元保证金正在办理,如有疑问请致电"
								+ handlerPhone);
			}

		} else if (type == 1) {// 退还
			String backFee = NumberUtils.parseNum2String(null, vo.getBackFee());// 保证金退还金额
			String payeeName = StringUtils.isEmpty(vo.getPayeeName()) ? "" : vo
					.getPayeeName();// 收款人
			if (vo.getState() == -1) {// 申请人提交，系统向出纳发送你短信
				/**
				 * 员工武晓辉向您发起一笔保证金退还业务，金额1000000.00元，付款人姓名信阳市公共资源交易中心，请查证
				 */
				msgMap.put("phone", this.getSenderByRole("role_cashier"));
				msgMap.put("msg", "员工" + applyName + "向您发起一笔保证金退还业务，金额"
						+ backFee + "元，付款人姓名" + accountName + "，请查证");

			} else if (vo.getState() == 2) {// 会计确认后,系统向“出纳”发出信息
				/**
				 * 会计向您发起一笔保证金退还业务，金额1000000.00元，收款人王家凤。
				 */
				msgMap.put("phone", this.getSenderByRole("role_cashier"));
				msgMap.put("msg", "会计向您发起一笔保证金退还业务，金额" + backFee + "元，收款人"
						+ payeeName);
			} else if (vo.getState() == 1) {// 出纳确认后，系统分别向“申请人”和“会计”发送短信
				/**
				 * 您申请的王家凤1000000.00元保证金退还手续正在办理，预计1天后到帐，如有疑问，请致电12345678910
				 */
				// 向申请人和会计发送短信
				String handlerPhone = "";// 获取操作人号码
				if (vo.getHandlerId() != null) {
					User handler = userService.get(vo.getHandlerId());
					handlerPhone = StringUtils
							.isEmpty(handler.getMobilePhone()) ? "" : handler
							.getMobilePhone();
				}
				if (StringUtils.isEmpty(applierPhone)) {
					msgMap.put("phone1", this.getSenderByRole("role_account"));
				} else {
					msgMap.put(
							"phone1",
							applierPhone + ","
									+ this.getSenderByRole("role_account"));
				}
				msgMap.put("msg1", "您申请的" + payeeName + backFee
						+ "元保证金退还手续正在办理，预计1天后到帐，如有疑问，请致电" + handlerPhone);
				// 向“收款人”发送短信
				/**
				 * 您的1000000.00元保证金已退回，预计1天后到账，请及时查收，如有疑问请与金鹰公司业务员联系
				 */
				if (!StringUtils.isEmpty(vo.getPayerPhone())) {
					msgMap.put("phone2", vo.getPayerPhone());
					msgMap.put("msg2", "您的" + backFee
							+ "元保证金已退回，预计1天后到账，请及时查收，如有疑问请与金鹰公司业务员联系");
				}
			}
		}
		return msgMap;

	}

	/**
	 * 通过角色获取用户的手机号码
	 * 
	 * @param roleCode
	 * @return
	 */
	private String getSenderByRole(String roleCode) {
		StringBuilder sb = new StringBuilder();
		List<Tuser> senders = userService.findByRole(roleCode);
		for (int i = 0; i < senders.size(); i++) {
			Tuser sender = senders.get(i);
			sb.append(i == 0 ? sender.getMobilePhone() : ","
					+ sender.getMobilePhone());
		}
		return sb.toString();
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