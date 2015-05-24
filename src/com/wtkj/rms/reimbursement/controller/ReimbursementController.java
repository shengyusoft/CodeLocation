package com.wtkj.rms.reimbursement.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
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
import com.wtkj.common.model.Dictionarytype;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.DictionarytypeServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessVo;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;
import com.wtkj.rms.reimbursement.model.po.Reimbursement;
import com.wtkj.rms.reimbursement.model.vo.ReimbursementVo;
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
	@Autowired
	private DictionarytypeServiceI dictionarytypeService;

	// 根据不同的用户显示不同的页面
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		String reStr = "";
		Long userId = getSessionInfo(request).getId();
		User user = userService.get(userId);
		if (user == null) {
			reStr = "/error";
		}
		if (!StringUtils.isEmpty(user.getRoleNames())) {
			if (user.getRoleNames().indexOf("普通员工") >= 0) {
				reStr = "/basic/reimbursement/reimbursement";
			} else {
				reStr = "/basic/reimbursement/reimbursementAudit";
			}
		}
		return reStr;
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<ReimbursementVo> findAll() {
		List<Reimbursement> reimbursements = reimbursementService.findAll();
		return convert2Vos(reimbursements);
	}

	private List<ReimbursementVo> convert2Vos(List<Reimbursement> reimbursements) {
		List<ReimbursementVo> vos = new ArrayList<ReimbursementVo>();
		for (Reimbursement reimbursement : reimbursements) {
			vos.add(convert2Vo(reimbursement));
		}
		return vos;
	}

	private ReimbursementVo convert2Vo(Reimbursement reimbursement) {
		ReimbursementVo vo = new ReimbursementVo();
		BeanUtils.copyProperties(reimbursement, vo);
		if (reimbursement.getProcess() != null
				&& reimbursement.getProcess().getId() != null) {
			vo.setProcess_vo(process2Vo(processService.get(reimbursement
					.getProcess().getId())));
		}

		if (reimbursement.getPlace() != null) {
			Dictionarytype dt = dictionarytypeService.get(reimbursement
					.getPlace().getId());
			vo.setPlaceId(dt.getId());
			vo.setPlaceName(dt.getDescription());
		}
		return vo;
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, ReimbursementVo vo,
			PageFilter ph) {
		Grid grid = new Grid();
		Long userId = getSessionInfo(request).getId();
		User user = userService.get(userId);

		if (!StringUtils.isEmpty(user.getRoleNames())) {
			grid.setRows(convert2Vos(reimbursementService.dataGrid(user,
					vo, ph)));
			grid.setTotal(reimbursementService.count(user, vo, ph));
			return grid;
		}

		grid.setRows(convert2Vos(reimbursementService.dataGrid(null, vo, ph)));
		grid.setTotal(reimbursementService.count(null, vo, ph));

		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/reimbursement/reimbursementAdd";
	}

	// 仅仅是个转发器，根据类型匹配是保存还是提交
	@RequestMapping("/apply")
	@ResponseBody
	public Json apply(Reimbursement reimbursement, HttpServletRequest request) {
		if (reimbursement == null) {
			Json j = new Json();
			j.setSuccess(false);
			j.setMsg("空的报销单,提交或保存失败");
			return j;
		}

		if (reimbursement.getOption() == 0) {
			return add(reimbursement, request);
		} else if (reimbursement.getOption() == 1) {
			return commit(reimbursement, request);
		} else {
			return edit(reimbursement, request);
		}
	}

	@SuppressWarnings("unused")
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Reimbursement reimbursement, HttpServletRequest request) {
		Json j = new Json();
		try {
			Long docId = reimbursementService.add(reimbursement, request);

			// 提交后保存流程以及流程历史操作记录
			Process process = new Process();

			// 流程名称：格式：用户名-类型-时间
			String processName = "";
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());

			if (user == null) {
				throw new Exception("操作人为空！请重新登录");
			}

			process.setProcessName(user.getName() + "申请报销");
			process.setApplyUser(tuser);
			process.setDocId(docId);
			process.setStartDT(new Date());
			process.setArriveDT(new Date());
			process.setState(ProcessStateConstant.BX_INIT);
			Long processId = processService.add(process, request);

			// 更新
			reimbursement.setId(docId);
			process.setId(processId);
			reimbursement.setProcess(process);
			reimbursementService.edit(reimbursement, request);

			// 历史记录保存
			if (processId != null && processId > 0) {
				ProcessHistory history = new ProcessHistory();
				process.setId(processId);
				history.setProcess(process);

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
	public Json commit(Reimbursement reimbursement, HttpServletRequest request) {
		Json j = new Json();
		try {
			Long userId = getSessionInfo(request).getId();
			User user = userService.get(userId);
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());

			if (reimbursement.getId() != null && reimbursement.getId() > 0
					&& reimbursement.getProcess() != null) {
				reimbursementService.edit(reimbursement, request);
				// 审批不通过重新申请的情况
				Process process = reimbursement.getProcess();
				if (process.getId() != null) {
					process = processService.get(process.getId());
				}
				// process.setApplyUser(tuser);
				process.setArriveDT(new Date());
				process.setState(ProcessStateConstant.BX_APPLYED);
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
						+ "重新申请报销单成功,下一步执行人为" + nextOper);
				processHistoryService.add(history, request);

			} else {
				// 第一次申请提交报销单
				Long docId = reimbursementService.add(reimbursement, request);
				// 提交后保存流程以及流程历史操作记录
				Process process = new Process();
				if (user == null) {
					throw new Exception("操作人为空！请重新登录");
				}
				process.setProcessName(user.getName() + "申请报销");
				process.setApplyUser(tuser);
				process.setDocId(docId);
				process.setStartDT(new Date());
				process.setArriveDT(new Date());
				// 状态为申请成功
				process.setState(ProcessStateConstant.BX_APPLYED);
				Long processId = processService.add(process, request);

				// 更新
				reimbursement.setId(docId);
				process.setId(processId);
				reimbursement.setProcess(process);
				reimbursementService.edit(reimbursement, request);

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
							+ "申请报销单成功,下一步执行人为" + nextOper);
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

		String[] idArray = ids.split(",");
		for (String id : idArray) {
			Reimbursement rt = reimbursementService.get(Long.valueOf(id));
			if (rt == null || rt.getProcess() == null
					|| rt.getProcess().getState() == null) {
				continue;
			}
			if (rt.getProcess().getState() > 0) {
				j.setMsg("选择记录中存在记录已经提交的，不可以删除！");
				j.setSuccess(false);
				return j;
			}
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

		if (reimbursement != null) {
			request.setAttribute("reimbursement", convert2Vo(reimbursement));
		}
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

	// 查看那流程详情
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Reimbursement reimbursement = reimbursementService.get(id);
		if (reimbursement != null) {
			request.setAttribute("reimbursement", convert2Vo(reimbursement));
		}
		return "/basic/reimbursement/reimbursementDetail";
	}

	// 查看申请详情
	@RequestMapping("/detailPage2")
	public String detailPage2(HttpServletRequest request, Long id) {
		Reimbursement reimbursement = reimbursementService.get(id);
		if (reimbursement != null) {
			request.setAttribute("reimbursement", convert2Vo(reimbursement));
		}
		return "/basic/reimbursement/reimbursementDetail2";
	}

	@RequestMapping("/handlerPage")
	public String handlerPage(HttpServletRequest request, Long id) {
		Process process = processService.get(id);
		if (process == null || process.getApplyUser() == null
				|| process.getDocId() == null) {
			return "/error";
		}
		Reimbursement po = reimbursementService.get(process.getDocId());
		ReimbursementVo reimbursement = convert2Vo(po);
		request.setAttribute("reimbursement", reimbursement);
		return "/basic/reimbursement/processAudit";
	}

	// 流程审批相关,process docid,remark
	// 前台需要将process 的id 置入
	// 审批通过
	@RequestMapping("/complate")
	@ResponseBody
	public Json complate(ProcessVo vo, HttpServletRequest request) {
		Json j = new Json();
		Reimbursement reimbursement = null;
		if (vo == null || vo.getId() <= 0) {
			j.setMsg("error!");
			return j;
		}
		Process po = processService.get(vo.getId());
		po.setRemark(vo.getRemark());// 审批意见
		po.setOption(vo.getOption());
		vo = process2Vo(po);
		if (vo != null && vo.getDocId() != null && vo.getDocId() > 0) {
			if (vo.getOption() == 1) {
				return abort(vo, request);
			}
			reimbursement = reimbursementService.get(vo.getDocId());
			if (reimbursement != null) {
				Long userId = getSessionInfo(request).getId();
				if (userId > 0) {
					User user = userService.get(userId);
					if (user != null) {
						String roleNames = user.getRoleNames();
						// 状态更新
						if (roleNames.indexOf("会计") >= 0) {
							po.setState(ProcessStateConstant.BX_AUDIT_KJ);// 会计审批通过
							// 增加流程操作历史记录
							String op = this.getNextOperator("role_top_manger");
							updateHistory(request, user, po,
									"会计：" + user.getName() + "审批通过,下一步执行人为:"
											+ op);

						} else if (roleNames.indexOf("总经理") >= 0) {
							po.setState(ProcessStateConstant.BX_AUDIT_ZJL);// 总经理审批通过
							// 增加流程操作历史记录
							String op = this.getNextOperator("role_cashier");
							updateHistory(request, user, po,
									"总经理：" + user.getName() + "审批通过,下一步执行人为:"
											+ op);
						} else if (roleNames.indexOf("出纳") >= 0) {
							po.setState(ProcessStateConstant.BX_CN);// 出纳成功，流程结束
							vo.setEndDT(new Date());
							// 增加流程操作历史记录
							updateHistory(request, user, po,
									"出纳：" + user.getName() + "出纳成功!报销流程结束");
						} else if (roleNames.indexOf("超级管理员") >= 0) {
							// 可以审批所有的单子
							po.setState(vo.getState() + 1);
							// 增加流程操作历史记录
							if (po.getState() < 4) {
								updateHistory(request, user, po, "超级管理员："
										+ user.getName() + "审批通过!");
							} else {
								updateHistory(request, user, po, "超级管理员："
										+ user.getName() + "出纳成功!");
							}
						}

						try {
							po.setArriveDT(new Date());
							processService.edit(po, request);
							j.setSuccess(true);
							j.setMsg("审批成功！");
						} catch (Exception e) {
							j.setSuccess(false);
							j.setMsg("审批失败！");
							j.setMsg(e.getMessage());
						}
					}
				}
			}
		}
		return j;
	}

	// 审批不通过
	@RequestMapping("/abort")
	@ResponseBody
	public Json abort(ProcessVo vo, HttpServletRequest request) {
		Json j = new Json();
		if (vo == null || vo.getId() <= 0 || vo.getDocId() == null
				|| vo.getDocId() <= 0) {
			j.setMsg("流程为空!");
			return j;
		}

		User user = null;
		Reimbursement reimbursement = null;

		Long userId = getSessionInfo(request).getId();
		user = userService.get(userId);
		Process po = processService.get(vo.getId());
		if (!StringUtils.isEmpty(vo.getRemark())) {
			po.setRemark(vo.getRemark());
		}

		if (user == null) {
			j.setMsg("办理人为空,请重新登录!");
			return j;
		}

		reimbursement = reimbursementService.get(vo.getDocId());

		if (reimbursement == null) {
			j.setMsg("报销单为空,数据异常!");
			return j;
		}

		String roleNames = user.getRoleNames();

		// 状态更新
		if (roleNames.indexOf("会计") >= 0) {
			po.setState(ProcessStateConstant.BX_BACK_KJ);// 会计审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, po, "会计：" + user.getName() + "审批不通过");

		} else if (roleNames.indexOf("总经理") >= 0) {
			po.setState(ProcessStateConstant.BX_BACK_ZJL);// 总经理审批不通过
			// 增加流程操作历史记录
			updateHistory(request, user, po, "总经理：" + user.getName() + "审批不通过");
		} else if (roleNames.indexOf("超级管理员") >= 0) {
			// 可以审批所有的单子
			po.setState(vo.getState() + 1);
			// 增加流程操作历史记录
			if (po.getState() < 4) {
				updateHistory(request, user, po, "超级管理员：" + user.getName()
						+ "审批不通过!");
			}
		}

		try {
			po.setArriveDT(new Date());
			processService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("审批成功！");
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg(e.getMessage());
		}

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
		history.setRemark(process.getRemark());
		history.setProcess(process);
		processHistoryService.add(history, request);
	}

	@SuppressWarnings("unused")
	private Process process2Po(ProcessVo vo) {
		Process p = null;
		if (vo != null) {
			p = new Process();
			BeanUtils.copyProperties(vo, p);
			Tuser user = new Tuser();
			user.setId(vo.getApplyUserId());
			p.setApplyUser(user);
		}
		return p;
	}

	private ProcessVo process2Vo(Process po) {
		ProcessVo p = null;
		if (po != null && po.getApplyUser() != null) {
			p = new ProcessVo();
			BeanUtils.copyProperties(po, p);
			User user = userService.get(po.getApplyUser().getId());
			p.setApplyUserId(user.getId());
			p.setApplyUserName(user.getName());
		}
		return p;
	}

}