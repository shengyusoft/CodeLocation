package com.wtkj.rms.reimbursement.controller;

import java.util.Date;
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
import com.wtkj.common.ProcessStateConstant;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;
import com.wtkj.rms.reimbursement.model.po.Reimbursement;
import com.wtkj.rms.reimbursement.service.ReimbursementServiceI;

@Controller
@RequestMapping("/reimbursement")
public class ReimbursementController extends BaseController {
	@Autowired
	private ReimbursementServiceI reimbursementService;
	@Autowired
	private ProcessServiceI processService;
	@Autowired
	private ProcessHistoryServiceI processHistoryService;
	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/reimbursement/reimbursement";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Reimbursement> findAll() {
		return reimbursementService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Reimbursement reimbursement, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(reimbursementService.dataGrid(reimbursement, ph));
		grid.setTotal(reimbursementService.count(reimbursement, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/reimbursement/reimbursementAdd";
	}

	@SuppressWarnings("unused")
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Reimbursement p, HttpServletRequest request) {
		Json j = new Json();
		try {
			Long docId = reimbursementService.add(p, request);

			// 提交后保存流程以及流程历史操作记录
			Process process = new Process();

			// 流程名称：格式：用户名-类型-时间
			String processName = "";
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			String dateStr = DateUtil.convertDateToString(new Date());
			processName += user.getName() + "-报销单-" + dateStr;

			if (user == null) {
				throw new Exception("操作人为空！请重新登录");
			}

			process.setProcessName(processName);
			process.setDocId(docId);
			process.setStartDT(new Date());
			process.setState(ProcessStateConstant.BX_INIT);
			Long processId = processService.add(process, request);
			
			//更新
			p.setId(docId);
			process.setId(processId);
			p.setProcess(process);
			reimbursementService.edit(p, request);

			// 历史记录保存
			if (processId != null && processId > 0) {
				ProcessHistory history = new ProcessHistory();
				process.setId(processId);
				history.setProcess(process);
				Tuser tuser = new Tuser();
				tuser.setId(user.getId());
				history.setOperator(tuser);
				history.setOperateDT(new Date());
				history.setOperateDetail(user.getName() + " 于 "
						+ DateUtil.convertDateToString(new Date())
						+ " 生成报销单成功,下一步需要提交申请单!");
				processHistoryService.add(history, request);
			}

			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	// 提交报账时
	@SuppressWarnings("unused")
	@RequestMapping("/commit")
	@ResponseBody
	public Json commit(Reimbursement p, HttpServletRequest request) {
		Json j = new Json();
		try {
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);

			if (p.getId() != null && p.getId() > 0 && p.getProcess() != null) {
				reimbursementService.edit(p, request);
				// 审批不通过重新申请的情况
				Process process = p.getProcess();
				process.setState(ProcessStateConstant.BX_APPLYED);
				processService.edit(process, request);

				// 历史记录保存
				ProcessHistory history = new ProcessHistory();
				history.setProcess(process);
				Tuser tuser = new Tuser();
				tuser.setId(user.getId());
				history.setOperator(tuser);
				history.setOperateDT(new Date());

				// 查询会计人员
				String nextOper = getNextOperator("role_account");
				
				history.setOperateDetail(user.getName() + " 于 "
						+ DateUtil.convertDateToString(new Date())
						+ "重新申请报销单成功,下一步执行人为"+nextOper);
				processHistoryService.add(history, request);

			} else {
				// 第一次申请提交报销单
				Long docId = reimbursementService.add(p, request);
				// 提交后保存流程以及流程历史操作记录
				Process process = new Process();
				// 流程名称：格式：用户名-类型-时间
				String processName = "";
				String dateStr = DateUtil.convertDateToString(new Date());
				processName += user.getName() + "-报销单-" + dateStr;
				if (user == null) {
					throw new Exception("操作人为空！请重新登录");
				}
				process.setProcessName(processName);
				process.setDocId(docId);
				process.setStartDT(new Date());
				// 状态为申请成功
				process.setState(ProcessStateConstant.BX_APPLYED);
				Long processId = processService.add(process, request);
				
				//更新
				p.setId(docId);
				process.setId(processId);
				p.setProcess(process);
				reimbursementService.edit(p, request);

				// 历史记录保存
				if (processId != null && processId > 0) {
					ProcessHistory history = new ProcessHistory();
					process.setId(processId);
					history.setProcess(process);
					Tuser tuser = new Tuser();
					tuser.setId(user.getId());
					history.setOperator(tuser);
					history.setOperateDT(new Date());
					// 查询会计人员
					String nextOper = getNextOperator("role_account");
					history.setOperateDetail(user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ "申请报销单成功,下一步执行人为"+nextOper);
					processHistoryService.add(history, request);
				}
			}
			j.setSuccess(true);
			j.setMsg("申请成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

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
			// 级联删除流程信息
			processService.deleteByDocIds(ids);
			// 历史记录外键关联流程，流程删除时自动删除历史记录
			reimbursementService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Reimbursement get(Long id) {
		return reimbursementService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Reimbursement reimbursement = reimbursementService.get(id);
		request.setAttribute("reimbursement", reimbursement);
		return "/basic/reimbursement/reimbursementEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Reimbursement reimbursement, HttpServletRequest request) {
		Json j = new Json();
		try {
			reimbursementService.edit(reimbursement, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Reimbursement reimbursement = reimbursementService.get(id);
		request.setAttribute("reimbursement", reimbursement);
		return "/basic/reimbursement/reimbursementDetail";
	}

	// 流程审批相关,process docid,remark
	// 前台需要将process 的id 置入
	// 审批通过
	@RequestMapping("/complete")
	@ResponseBody
	public Json complate(Process process, HttpServletRequest request) {
		Json j = new Json();
		Reimbursement reimbursement = null;
		if (process != null && process.getDocId() > 0) {
			reimbursement = reimbursementService.get(process.getDocId());
			if (reimbursement != null) {
				Long userId = getSessionInfo(request).getId();
				if (userId > 0) {
					User user = userService.get(userId);
					if (user != null) {
						String roleNames = user.getRoleNames();
						// 状态更新
						if (roleNames.indexOf("会计") >= 0) {
							process.setState(ProcessStateConstant.BX_AUDIT_KJ);// 会计审批通过
							// 增加流程操作历史记录
							String op = this.getNextOperator("role_top_manger");
							updateHistory(request, user, process,
									"会计：" + user.getName() + "审批通过,下一步执行人为:"+op);

						} else if (roleNames.indexOf("总经理") >= 0) {
							process.setState(ProcessStateConstant.BX_AUDIT_ZJL);// 总经理审批通过
							// 增加流程操作历史记录
							String op = this.getNextOperator("role_cashier");
							updateHistory(request, user, process,
									"总经理：" + user.getName() + "审批通过,下一步执行人为:"+op);
						} else if (roleNames.indexOf("出纳") >= 0) {
							process.setState(ProcessStateConstant.BX_CN);// 出纳成功，流程结束
							process.setEndDT(new Date());
							// 增加流程操作历史记录
							updateHistory(request, user, process,
									"出纳：" + user.getName() + "出纳成功!报销流程结束");
						} else if (roleNames.indexOf("超级管理员") >= 0) {
							// 可以审批所有的单子
							process.setState(process.getState() + 1);
							// 增加流程操作历史记录
							if (process.getState() < 4) {
								updateHistory(request, user, process, "超级管理员："
										+ user.getName() + "审批通过!");
							} else {
								updateHistory(request, user, process, "超级管理员："
										+ user.getName() + "出纳成功!");
							}
						}

						try {
							processService.edit(process, request);
							j.setSuccess(true);
							j.setMsg("审批成功！");
						} catch (Exception e) {
							j.setMsg(e.getMessage());
						}
					}
				}
			}
		}
		j.setSuccess(false);
		j.setMsg("审批失败！");
		return j;
	}

	// 审批不通过
	@RequestMapping("/abort")
	@ResponseBody
	public Json abort(Process process, HttpServletRequest request) {
		Json j = new Json();
		if (process == null || process.getDocId() <= 0) {
			j.setMsg("流程为空!");
			return j;
		}

		User user = null;
		Reimbursement reimbursement = null;

		Long userId = getSessionInfo(request).getId();
		user = userService.get(userId);

		if (user == null) {
			j.setMsg("办理人为空,请重新登录!");
			return j;
		}

		reimbursement = reimbursementService.get(process.getDocId());

		if (reimbursement == null) {
			j.setMsg("报销单为空,数据异常!");
			return j;
		}

		String roleNames = user.getRoleNames();

		// 状态更新
		if (roleNames.indexOf("会计") >= 0) {
			process.setState(ProcessStateConstant.BX_BACK_KJ);// 会计审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, process, "会计：" + user.getName()
					+ "审批不通过");

		} else if (roleNames.indexOf("总经理") >= 0) {
			process.setState(ProcessStateConstant.BX_BACK_ZJL);// 总经理审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, process, "总经理：" + user.getName()
					+ "审批不通过");
		} else if (roleNames.indexOf("超级管理员") >= 0) {
			// 可以审批所有的单子
			process.setState(process.getState() + 1);
			// 增加流程操作历史记录
			if (process.getState() < 4) {
				updateHistory(request, user, process, "超级管理员：" + user.getName()
						+ "审批不通过!");
			}
		}

		try {
			processService.edit(process, request);
			j.setSuccess(true);
			j.setMsg("审批成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		j.setSuccess(false);
		j.setMsg("审批失败！");
		return j;
	}

	private void updateHistory(HttpServletRequest request, User user,
			Process process, String detail) {
		ProcessHistory history = new ProcessHistory();
		history.setOperateDT(new Date());
		Tuser tuser = new Tuser();
		tuser.setId(user.getId());
		history.setOperator(tuser);
		history.setOperateDetail(detail);
		history.setProcess(process);
		processHistoryService.add(history, request);
	}

}