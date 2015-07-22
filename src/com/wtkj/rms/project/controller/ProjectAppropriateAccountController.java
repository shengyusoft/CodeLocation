package com.wtkj.rms.project.controller;

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

import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.NumberUtils;
import com.wtkj.common.utils.SmsUtil;
import com.wtkj.rms.project.model.ProjectAppropriateAccountVo;
import com.wtkj.rms.project.model.ProjectAppropriateReg;
import com.wtkj.rms.project.service.ProjectAppropriateAccountServiceI;
import com.wtkj.rms.project.service.ProjectAppropriateRegServiceI;

@Controller
@RequestMapping("/projectAppropriateAccount")
public class ProjectAppropriateAccountController extends BaseController {

	@Autowired
	private ProjectAppropriateAccountServiceI projectAppropriateAccountService;

	@Autowired
	private ProjectAppropriateRegServiceI projectAppropriateRegService;

	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/projectAppropriateAccount/projectAppropriateAccount";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectAppropriateAccountVo vo, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectAppropriateAccountService.dataGrid(vo, ph));
		grid.setTotal(projectAppropriateAccountService.count(vo, ph));
		return grid;
	}

	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		SessionInfo sessionInfo = getSessionInfo(request);
		User u = userService.get(sessionInfo.getId());
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		ProjectAppropriateAccountVo vo = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			vo = projectAppropriateAccountService.get(id);
			if ("handler_cn".equals(viewType)) {
				if (vo.getToAccountDT() == null) {
					vo.setToAccountDT(new Date());
				}
				if (vo.getHandlerId2() == null || vo.getHandlerId2() <= 0) {
					vo.setHandlerId2(u.getId());
				}

			} else if ("handler_kj".equals(viewType)) {
				if (vo.getActualDT() == null) {
					vo.setActualDT(new Date());
				}
				if (vo.getHandlerId1() == null || vo.getHandlerId1() <= 0) {
					vo.setHandlerId1(u.getId());
				}
			}
		} else {
			// 添加
			vo = new ProjectAppropriateAccountVo();
			vo.setApplierId(u.getId());
			vo.setApplierName(u.getName());
		}
		request.setAttribute("projectAppropriateAccount", vo);
		request.setAttribute("viewType", viewType);
		return "/basic/project/projectAppropriateAccountView";
	}

	// 提交的时候需要传type值
	@RequestMapping("/save")
	@ResponseBody
	public Json save(ProjectAppropriateAccountVo vo, String viewType,
			HttpServletRequest request) {
		// 普通员工提交
		Json j = new Json();
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		try {
			// 添加
			if (vo.getId() == null || vo.getId() <= 0) {
				if (vo.getOption() == 1) {// 提交
					vo.setState(1);
				}
				projectAppropriateAccountService.add(vo, request);

			} else {// 编辑或者处理
				if ("handler_cn".equals(viewType)) {
					vo.setState(3);// 出纳已确认
					if (vo.getToAccountDT() == null) {
						vo.setToAccountDT(new Date());
					}
				} else if ("handler_kj".equals(viewType)) {
					vo.setState(2);// 会计已确认
					if (vo.getActualDT() == null) {
						vo.setActualDT(new Date());
					}
				}
				if (vo.getOption() == 1 && "edit".equals(viewType)) {// 提交
					vo.setState(1);
				}
				projectAppropriateAccountService.edit(vo, request);
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

			// 保存成功后发送短信
			if (vo.getState() != 0) {
				Map<String, String> msgMap = getSendMsg(request, vo);
				if (!StringUtils.isEmpty(msgMap.get("phone1"))) {// 发送不同短信
					SmsUtil.sendMsg(msgMap.get("msg1"), msgMap.get("phone1"));
					SmsUtil.sendMsg(msgMap.get("msg2"), msgMap.get("phone2"));
				} else {// 发送相同短信
					SmsUtil.sendMsg(msgMap.get("msg"), msgMap.get("phone"));
				}
			}
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
			projectAppropriateAccountService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectAppropriateAccountVo get(long id) {
		return projectAppropriateAccountService.get(id);
	}

	/**
	 * 动态获取短信内容
	 * 
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> getSendMsg(HttpServletRequest request,
			ProjectAppropriateAccountVo vo) throws Exception {
		Map<String, String> msgMap = new HashMap<String, String>();
		// SessionInfo sessionInfo = getSessionInfo(request);
		// User u = userService.get(sessionInfo.getId());
		StringBuilder msgTemp = new StringBuilder();
		String payeeName = StringUtils.isEmpty(vo.getPayee()) ? "" : vo
				.getPayee();// 收款人,户名

		String toAccountFee = "";// 工程部支付款
		if (vo.getToAccountFee() != null) {
			toAccountFee = NumberUtils.parseNum2String(null,
					vo.getToAccountFee());
		}

		// 0初始化;1工程部提交;2会计部确认;3出纳确认
		if (vo.getState() == 1) {// 工程部提交后系统向 “会计”发出信息
			/**
			 * 工程部向您发出一笔1000000.00元工程款支付申请，付款人为鲁山县财政国库支付中心，收款人为王家凤，请及时办理
			 */
			msgTemp.append("工程部向您发出一笔").append(toAccountFee)
					.append("元工程款支付申请，付款人为").append("鲁山县财政国库支付中心")
					.append("收款人为").append(payeeName).append("，请及时办理");
			msgMap.put("phone", this.getSenderByRole("role_account"));// 会计
			msgMap.put("msg", msgTemp.toString());// 会计

		} else if (vo.getState() == 2) {// 会计部确认向出纳发送通知
			/**
			 * 工程部申请的1000000.00元工程款已办理，请查证
			 */
			msgTemp.append("工程部申请的").append(toAccountFee).append("元工程款已办理，请查证");
			msgMap.put("phone", this.getSenderByRole("role_cashier"));// 出纳
			msgMap.put("msg", msgTemp.toString());// 会计

		} else if (vo.getState() == 3) {// 向申请人和收款人发通知

			/**
			 * 您申请的王家凤1000000.00元工程款已办理，预计1天后到帐，如有疑问，请咨询财务人员
			 */
			String applierPhone = "";// 申请人手机号码
			if (vo.getApplierId() != null && vo.getApplierId() > 0) {
				User u = userService.get(vo.getApplierId());
				applierPhone = StringUtils.isEmpty(u.getMobilePhone()) ? "" : u
						.getMobilePhone();
			}

			// 向申请人发通知
			msgTemp.append("您申请的").append(payeeName)
					.append("元工程款已办理，预计1天后到帐，如有疑问，请咨询财务人员");
			msgMap.put("phone1", applierPhone);// 申请人
			msgMap.put("msg1", msgTemp.toString());

			/**
			 * 您的一笔1000000.00元工程款已办理，预计1天后到帐，请查收。如有疑问，请咨询工程部。
			 */
			msgTemp = new StringBuilder();
			// 向收款人发通知
			String payeePhone = "";
			if (vo.getProjectAppRegId() != null) {
				ProjectAppropriateReg reg = projectAppropriateRegService.get(vo
						.getProjectAppRegId());
				payeePhone = StringUtils.isEmpty(reg.getContactTel()) ? ""
						: reg.getContactTel();
			}

			msgTemp.append("您的一笔").append(toAccountFee)
					.append("元工程款已办理，预计1天后到帐，请查收。如有疑问，请咨询工程部");
			msgMap.put("phone2", payeePhone);// 申请人
			msgMap.put("msg2", msgTemp.toString());
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

}