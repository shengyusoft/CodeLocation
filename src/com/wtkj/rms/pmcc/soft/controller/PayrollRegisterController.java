package com.wtkj.rms.pmcc.soft.controller;

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
import com.wtkj.common.ProcessStateConstant;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.pmcc.soft.model.PayrollRegister;
import com.wtkj.rms.pmcc.soft.service.PayrollRegisterServiceI;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;

/**
 * 工资发放登记
 */
@Controller
@RequestMapping("/payrollRegister")
public class PayrollRegisterController extends BaseController {

	@Autowired
	private PayrollRegisterServiceI payrollRegisterService;

	@Autowired
	private UserServiceI userService;
	//
	@Autowired
	private ProcessServiceI processService;
	//
	@Autowired
	private ProcessHistoryServiceI processHistoryService;

	/**
	 * 菜单列表页面
	 * 
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping("/manager")
	public String listPage(HttpServletRequest request) {

		return "/basic/payrollRegister/list";
	}

	/**
	 * 新增页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/payrollRegister/add";
	}

	/**
	 * 编辑页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		request.setAttribute("id", id);
		return "/basic/payrollRegister/edit";
	}

	/**
	 * 详情页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		request.setAttribute("id", id);
		return "/basic/payrollRegister/detail";
	}

	/**
	 * 审批页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/approvalPage")
	public String approvalPage(HttpServletRequest request, Long id,
			Long processId) {

		// 流程
		Process process = processService.get(processId);
		if (process == null || process.getApplyUser() == null
				|| process.getDocId() == null) {
			return "/error";
		}
		User user = userService.get(process.getApplyUser().getId());
		process.setApplyUserName(user.getName());
		process.setApplyUserId(user.getId());

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		String name = sessionInfo.getName();
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		request.setAttribute("process", process);
		return "/basic/payrollRegister/approval";
	}

	/**
	 * 查看流程页面
	 * 
	 * @param @param request
	 * @param @param id
	 * @param @return
	 */
	@RequestMapping("/approvalDetailPage")
	public String approvalDetailPage(HttpServletRequest request, Long id) {

		PayrollRegister obj = payrollRegisterService.find(id);
		if (obj != null) {
			request.setAttribute("payrollRegister", obj);
		}
		return "/basic/payrollRegister/approvalDetail";
	}

	/**
	 * 列表查询
	 * 
	 * @param vo
	 * @param ph
	 * @param request
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(PayrollRegister vo, PageFilter ph,
			HttpServletRequest request) {
		Grid grid = new Grid();
		Long userId = getSessionInfo(request).getId();
		User user = userService.get(userId);
		if (!StringUtils.isEmpty(user.getRoleNames())) {
			grid.setRows(payrollRegisterService.dataGrid(user, vo, ph));
			grid.setTotal(payrollRegisterService.count(user, vo, ph));
			return grid;
		}
		grid.setRows(payrollRegisterService.dataGrid(null, vo, ph));
		grid.setTotal(payrollRegisterService.count(null, vo, ph));
		return grid;
	}

	/**
	 * 新增、修改或提交申请
	 * 
	 * @param @param obj
	 * @param @param request
	 * @param @return
	 */
	@RequestMapping("/apply")
	@ResponseBody
	public Json apply(PayrollRegister obj, HttpServletRequest request) {

		if (obj == null) {
			Json j = new Json();
			j.setSuccess(false);
			j.setMsg("空的申请单,提交或保存失败");
			return j;
		}
		if (obj.getOption() == 0) {
			// 新增
			return add(obj, request);
		} else if (obj.getOption() == 1) {
			// 提交申请
			return commit(obj, request);
		} else {
			// 编辑保存
			return edit(obj, request);
		}
	}

	/**
	 * 保存
	 * 
	 * @param obj
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(PayrollRegister obj, HttpServletRequest request) {

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		Json j = new Json();
		try {
			if (obj != null) {
				// 添加时间
				obj.setCreatTime(new Date());
				// 添加人ID
				if (sessionInfo.getId() > 0) {
					obj.setCreater(String.valueOf(sessionInfo.getId()));
				}
				// 添加人中文名
				obj.setCreaterName(sessionInfo.getName());
				// 删除标记
				obj.setDelFlag("0");
			}
			// 业务表保存后主键
			Long id = payrollRegisterService.add(obj, request);
			// 保存流程以及流程历史操作记录
			Process process = new Process();
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());
			// 流程名称：格式：用户名-类型-时间
			process.setProcessName(GlobalConstant.PROCESS_NAME_PR);
			process.setApplyUser(tuser);
			process.setDocId(id);
			process.setStartDT(new Date());
			process.setArriveDT(new Date());
			process.setState(ProcessStateConstant.BX_INIT);
			Long processId = processService.add(process, request);

			// 更新业务表
			obj.setId(id);
			obj.setProcessFlag(process.getState());
			obj.setProcessId(processId);
			payrollRegisterService.update(obj);

			// 历史记录保存
			if (processId != null && processId > 0) {
				ProcessHistory history = new ProcessHistory();
				process.setId(processId);
				history.setProcess(process);

				history.setOperator(tuser);
				history.setOperateDT(new Date());
				history.setOperateDetail(user.getName() + " 于 "
						+ DateUtil.convertDateToString(new Date())
						+ " 生成成功,下一步需要提交申请!");
				processHistoryService.add(history, request);
			}
			if (id > 0) {
				obj.setId(id);
			}
			j.setSuccess(true);
			j.setObj(obj);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 提交申请
	 * 
	 * @param @param obj
	 * @param @param request
	 * @param @return
	 */
	@RequestMapping("/commit")
	@ResponseBody
	public Json commit(PayrollRegister obj, HttpServletRequest request) {

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		Json j = new Json();
		try {
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());

			if (obj.getId() != null && obj.getId() > 0
					&& obj.getProcessId() != null) {

				// 审批不通过重新申请的情况和只保存未申请的情况
				Process process = processService.get(obj.getProcessId());
				// process.setApplyUser(tuser);
				process.setArriveDT(new Date());
				process.setState(ProcessStateConstant.BX_APPLYED);
				String nextOperIds = getNextOperatorIds(GlobalConstant.ROLE_KJ);
				process.setNextOperator(nextOperIds);
				processService.edit(process, request);

				// 历史记录保存
				ProcessHistory history = new ProcessHistory();
				history.setProcess(process);
				history.setOperator(tuser);
				history.setOperateDT(new Date());

				// 查询会计人员
				String nextOper = getNextOperator("role_account");

				history.setOperateDetail(user.getName() + " 于 "
						+ DateUtil.convertDateToString(new Date())
						+ "申请成功,下一步执行人为" + nextOper);
				processHistoryService.add(history, request);
				// 更新业务表
				obj.setProcessFlag(process.getState());
				obj.setProcessId(process.getId());
				payrollRegisterService.update(obj);

			} else {
				// 第一次申请提交,新增+申请
				// 业务表信息
				if (obj != null) {
					// 添加时间
					obj.setCreatTime(new Date());
					// 添加人ID
					if (sessionInfo.getId() > 0) {
						obj.setCreater(String.valueOf(sessionInfo.getId()));
					}
					// 添加人中文名
					obj.setCreaterName(sessionInfo.getName());
					// 删除标记
					obj.setDelFlag("0");
				}
				Long docId = obj.getId();
				if (docId != null && docId > 0) {
					payrollRegisterService.update(obj);

				} else {
					docId = payrollRegisterService.add(obj, request);
				}

				// 提交后保存流程以及流程历史操作记录
				Process process = new Process();
				process.setProcessName(GlobalConstant.PROCESS_NAME_PR);
				process.setApplyUser(tuser);
				process.setDocId(docId);
				process.setStartDT(new Date());
				process.setArriveDT(new Date());
				String nextOperIds = getNextOperatorIds(GlobalConstant.ROLE_KJ);
				process.setNextOperator(nextOperIds);
				// 状态为申请成功
				process.setState(ProcessStateConstant.BX_APPLYED);
				Long processId = processService.add(process, request);

				// 更新业务表
				obj.setId(docId);
				obj.setProcessFlag(process.getState());
				obj.setProcessId(processId);
				payrollRegisterService.update(obj);

				// 历史记录保存
				if (processId != null && processId > 0) {
					ProcessHistory history = new ProcessHistory();
					process.setId(processId);
					history.setProcess(process);
					history.setOperator(tuser);
					history.setOperateDT(new Date());
					// 查询会计人员
					String nextOper = getNextOperator("role_account");
					history.setOperateDetail(user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ "申请成功,下一步执行人为" + nextOper);
					processHistoryService.add(history, request);
				}
			}
			j.setSuccess(true);
			j.setObj(obj);
			j.setMsg("操作成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 编辑保存
	 * 
	 * @param obj
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PayrollRegister obj, HttpServletRequest request) {
		Json j = new Json();
		try {
			payrollRegisterService.update(obj);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}
		String[] arr = ids.split(",");
		StringBuilder deleteProcessIds = new StringBuilder();
		for (String id : arr) {
			PayrollRegister obj = payrollRegisterService.find(Long.valueOf(id));
			if (obj == null || obj.getProcessId() == null
					|| obj.getProcessFlag() == null) {
				continue;
			}
			deleteProcessIds.append(obj.getProcessId() + ",");
			if (obj.getProcessFlag() > 0) {
				j.setMsg("选择记录中存在记录已经提交的，不可以删除！");
				j.setSuccess(false);
				return j;
			}
		}
		try {
			// 级联删除流程信息
			if (!StringUtils.isEmpty(deleteProcessIds.toString())) {
				String processIds = deleteProcessIds.toString().substring(0,
						deleteProcessIds.length() - 1);
				processService.delete(processIds);
				// 级联上次流程流程历史记录
				processHistoryService.deleteByProcessId(processIds);
			}
			// 业务表删除
			payrollRegisterService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 通过id加载单个
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/get")
	@ResponseBody
	public PayrollRegister get(Long id) {
		PayrollRegister obj = payrollRegisterService.find(id);
		return obj;
	}

	/**
	 * 审批
	 * 
	 * @param obj
	 * @param request
	 * @return
	 */
	@RequestMapping("/approval")
	@ResponseBody
	public Json approval(Process process, HttpServletRequest request) {

		Json j = new Json();

		Process pro = processService.get(process.getId());
		pro.setRemark(process.getRemark());// 审批意见
		pro.setOption(process.getOption());

		// 审批不通过
		if (pro.getOption() == 1) {
			return disagree(pro, request);
		}
		// 审批通过
		PayrollRegister obj = payrollRegisterService.find(pro.getDocId());
		if (obj != null) {
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			if (user != null) {
				String roleNames = user.getRoleNames();
				String nextOperIds = "";
				// 状态更新
				if (roleNames.indexOf("会计") >= 0) {
					pro.setState(ProcessStateConstant.BX_AUDIT_KJ);// 会计审批通过
					// 增加流程操作历史记录
					String op = this.getNextOperator(GlobalConstant.ROLE_ZJL);
					nextOperIds = getNextOperatorIds(GlobalConstant.ROLE_ZJL);
					updateHistory(request, user, pro, "会计：" + user.getName()
							+ "审批通过,下一步执行人为:" + op);
					// 更新业务表流程标记
					updateBusiness(obj, pro.getState());

				} else if (roleNames.indexOf("总经理") >= 0) {
					pro.setState(ProcessStateConstant.BX_AUDIT_ZJL);// 总经理审批通过
					// 增加流程操作历史记录
					String op = this.getNextOperator("role_cashier");
					nextOperIds = getNextOperatorIds(GlobalConstant.ROLE_CN);
					updateHistory(request, user, pro, "总经理：" + user.getName()
							+ "审批通过,下一步执行人为:" + op);
					// 更新业务表流程标记
					updateBusiness(obj, pro.getState());

				} else if (roleNames.indexOf("出纳") >= 0) {
					pro.setState(ProcessStateConstant.BX_CN);// 出纳成功，流程结束
					pro.setEndDT(new Date());
					// 增加流程操作历史记录
					updateHistory(request, user, pro, "出纳：" + user.getName()
							+ "出纳成功!流程结束");
					// 更新业务表流程标记
					updateBusiness(obj, pro.getState());

				} else if (roleNames.indexOf("超级管理员") >= 0) {
					// 可以审批所有的单子
					pro.setState(pro.getState() + 1);
					// 增加流程操作历史记录
					if (pro.getState() < 4) {
						updateHistory(request, user, pro,
								"超级管理员：" + user.getName() + "审批通过!");
						// 更新业务表流程标记
						updateBusiness(obj, pro.getState());

					} else {
						updateHistory(request, user, pro,
								"超级管理员：" + user.getName() + "出纳成功!");
						// 更新业务表流程标记
						updateBusiness(obj, pro.getState());
					}
				}

				try {
					pro.setArriveDT(new Date());
					pro.setNextOperator(nextOperIds);
					processService.edit(pro, request);
					j.setSuccess(true);
					j.setMsg("审批成功！");
				} catch (Exception e) {
					j.setSuccess(false);
					j.setMsg("审批失败！");
					j.setMsg(e.getMessage());
				}
			}
		}
		return j;
	}

	/**
	 * 审批不通过
	 * 
	 * @param @param obj
	 * @param @param request
	 * @param @return
	 */
	@RequestMapping("/disagree")
	@ResponseBody
	public Json disagree(Process pro, HttpServletRequest request) {

		Json j = new Json();
		// 审批不通过
		User user = null;
		Long userId = getSessionInfo(request).getId();
		user = userService.get(userId);
		Process po = processService.get(pro.getId());
		// 审批意见
		po.setRemark(pro.getRemark());
		if (user == null) {
			j.setMsg("办理人为空,请重新登录!");
			return j;
		}
		PayrollRegister obj = payrollRegisterService.find(pro.getDocId());
		if (obj == null) {
			j.setMsg("申请单为空,数据异常!");
			return j;
		}
		// 角色名称
		String roleNames = user.getRoleNames();

		// 状态更新
		if (roleNames.indexOf("会计") >= 0) {
			po.setState(ProcessStateConstant.BX_BACK_KJ);// 会计审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, po, "会计：" + user.getName() + "审批不通过");
			// 更新业务表流程标记
			updateBusiness(obj, po.getState());

		} else if (roleNames.indexOf("总经理") >= 0) {
			po.setState(ProcessStateConstant.BX_BACK_ZJL);// 总经理审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, po, "总经理：" + user.getName() + "审批不通过");
			// 更新业务表流程标记
			updateBusiness(obj, po.getState());

		} else if (roleNames.indexOf("超级管理员") >= 0) {
			// 可以审批所有的单子
			po.setState(0 - pro.getState());
			// 增加流程操作历史记录
			if (po.getState() < 4) {
				updateHistory(request, user, po, "超级管理员：" + user.getName()
						+ "审批不通过!");
				// 更新业务表流程标记
				updateBusiness(obj, po.getState());
			}
		}
		try {
			po.setArriveDT(new Date());
			po.setNextOperator("");
			processService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("审批成功！");
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg(e.getMessage());
		}

		return j;
	}

	/**
	 * 审批操作历史记录
	 * 
	 * @param @param request
	 * @param @param user
	 * @param @param process
	 * @param @param detail
	 */
	private void updateHistory(HttpServletRequest request, User user,
			Process process, String detail) {

		ProcessHistory history = new ProcessHistory();
		history.setOperateDT(new Date());
		Tuser tuser = new Tuser();
		tuser.setId(user.getId());
		history.setOperator(tuser);
		history.setOperateDetail(detail);
		history.setRemark(process.getRemark());
		history.setProcess(process);
		processHistoryService.add(history, request);
	}

	/**
	 * 更新业务流程标记
	 * 
	 * @param @param request
	 * @param @param user
	 * @param @param process
	 * @param @param detail
	 */
	private void updateBusiness(PayrollRegister obj, int stat) {

		obj.setProcessFlag(stat);
		payrollRegisterService.update(obj);
	}

	/**
	 * 获取下个操作
	 * 
	 * @param @param role
	 * @param @return
	 */
	private String getNextOperator(String role) {
		List<Tuser> users = userService.findByRole(role);
		StringBuffer sb = new StringBuffer();
		for (Tuser u : users) {
			sb.append(u.getName() + ",");
		}
		String nextOper = StringUtils.isEmpty(sb.toString()) ? "" : sb
				.toString().substring(0, sb.toString().length() - 1);
		return nextOper;
	}
	
	protected String getNextOperatorIds(String role) {
		List<Tuser> users = userService.findByRole(role);
		StringBuffer sb = new StringBuffer();
		for (Tuser u : users) {
			sb.append(u.getId() + ",");
		}
		String nextOper = StringUtils.isEmpty(sb.toString()) ? "" : sb
				.toString().substring(0, sb.toString().length() - 1);
		return nextOper;
	}

}