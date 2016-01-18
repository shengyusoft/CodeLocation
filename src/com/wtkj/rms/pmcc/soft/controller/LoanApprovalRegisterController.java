package com.wtkj.rms.pmcc.soft.controller;

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

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.ProcessStateConstant;
import com.wtkj.common.model.User;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegister;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegisterVo;
import com.wtkj.rms.pmcc.soft.service.LoanApprovalRegisterServiceI;
import com.wtkj.rms.process.controller.BaseProcessController;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessVo;

/**
 * 员工借款审批登记
 */
@Controller
@RequestMapping("/loanApprovalRegister")
public class LoanApprovalRegisterController extends BaseProcessController {

	// 流程名称
	private static final String PROCESS_NAME = GlobalConstant.PROCESS_NAME_LAR;

	// 流程结束状态
	private static final int PROCESS_FINISHED = 4;

	@Autowired
	private LoanApprovalRegisterServiceI loanApprovalRegisterService;

	/**
	 * 申请人菜单列表页面
	 * 
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping({ "/manager" })
	public String manager(HttpServletRequest request) {
		return "/basic/loanApprovalRegister/loanApprovalRegister";
	}

	@RequestMapping({ "/dataGrid" })
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, LoanApprovalRegisterVo vo,
			PageFilter ph) {
		Grid grid = new Grid();
		User user = getLoginUser(request);
		List<LoanApprovalRegister> pos = loanApprovalRegisterService.dataGrid(
				user, vo, ph);
		List<LoanApprovalRegisterVo> vos = new ArrayList<LoanApprovalRegisterVo>();
		for (LoanApprovalRegister loanApprovalRegister : pos) {
			vos.add(toVo(loanApprovalRegister));
		}
		grid.setRows(vos);
		grid.setTotal(loanApprovalRegisterService.count(user, vo, ph));
		return grid;
	}

	/**
	 * CRUD以及处理的界面统一管理
	 * 
	 * @param request
	 * @param handlerType处理类型add
	 *            ,detail,edit,handler
	 * @return
	 */
	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;

		LoanApprovalRegister loanApprovalRegister = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			loanApprovalRegister = loanApprovalRegisterService.get(id);
		} else {
			// 添加
			loanApprovalRegister = new LoanApprovalRegister();
			loanApprovalRegister.setLoanDate(new Date());
		}

		request.setAttribute("loanApprovalRegister", toVo(loanApprovalRegister));
		request.setAttribute("viewType", viewType);
		// 申请人和申请时间

		// 根据类型返回 缴纳或者退回页面
		return "/basic/loanApprovalRegister/loanApprovalRegisterView";
	}

	/**
	 * add edit apply(3个操作通过传一个操作符控制，做成一个方法即可)
	 * 
	 * @param crr
	 * @param request
	 * @return
	 */
	@RequestMapping({ "/save" })
	@ResponseBody
	public Json save(LoanApprovalRegisterVo vo, String actionType,
			HttpServletRequest request) {
		Json j = new Json();
		User user = getLoginUser(request);
		LoanApprovalRegister carReg = null;
		String msg = "", detail = "";
		Long docId = 0l;
		int processState = 0;
		try {
			if (GlobalConstant.ACTION_EDIT.equals(actionType)) {
				msg = "修改成功!";
				// 编辑，注意需要关联process
				loanApprovalRegisterService.edit(toPo(vo));

			} else {
				String nextOperator = "";
				if (GlobalConstant.ACTION_ADD.equals(actionType)) {
					msg = "添加成功!";
					processState = ProcessStateConstant.STATE_INIT;
					detail = user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ " 生成借款记录成功,下一步:提交申请单!";
				} else if (GlobalConstant.ACTION_COMMIT.equals(actionType)) {
					msg = "提交成功!";
					processState = ProcessStateConstant.STATE_APPLYED;
					String nextOper = getNextOperator("role_top_manger");
					nextOperator = getNextOperatorIds("role_top_manger");
					detail = user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ " 申请借款成功,下一步执行人:" + nextOper;
				}

				if (vo.getId() != null && vo.getId() > 0) {
					loanApprovalRegisterService.edit(toPo(vo));
					docId = vo.getId();
				} else {
					docId = loanApprovalRegisterService.add(toPo(vo), request);
				}

				// 申请提交后不能修改
				carReg = loanApprovalRegisterService.get(docId);

				Long processId = vo.getProcess_vo() == null ? null : vo
						.getProcess_vo().getId();
				// 更新流程
				Process process = updateProcess(request, processId,
						nextOperator, PROCESS_NAME, docId, user, processState);
				// 更新资源-关联流程
				carReg.setProcess(process);
				loanApprovalRegisterService.edit(carReg);

				// 更新流程历史记录
				updateHistory(request, user, process, detail);
			}
			j.setSuccess(true);
			j.setMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}

	// 审核通过方法
	// 流程审批相关,process docid,remark
	// 前台需要将process 的id 置入
	// 审批通过
	@RequestMapping("/complate")
	@ResponseBody
	public Json complate(ProcessVo vo, HttpServletRequest request) {
		Json j = new Json();
		if (vo == null || vo.getId() <= 0) {
			j.setMsg("未关联流程实例，流程启动失败");
			return j;
		}
		Process po = processService.get(vo.getId());
		po.setRemark(vo.getRemark());// 审批意见
		po.setOption(vo.getOption());
		po.setRemark2(vo.getRemark2());
		vo = process2Vo(po);
		if (vo != null && vo.getDocId() != null && vo.getDocId() > 0) {
			if (vo.getOption() == 1) {
				return abort(vo, request);
			}
			LoanApprovalRegister loanApprovalRegister = loanApprovalRegisterService
					.get(vo.getDocId());
			if (loanApprovalRegister != null) {
				User user = getLoginUser(request);
				if (user != null) {
					String roleNames = user.getRoleNames();
					Long historyId = 0l;
					// 状态更新
					if (roleNames.indexOf("总经理") >= 0) {
						po.setState(2);
						historyId = updateHistory(request, user, po, "总经理："
								+ user.getName() + "审核通过!下一步执行人为:"
								+ getNextOperator("role_account"));
						po.setNextOperator(getNextOperatorIds("role_account"));

					} else if (roleNames.indexOf("会计") >= 0) {
						po.setState(3);
						historyId = updateHistory(request, user, po, "会计："
								+ user.getName() + "审核通过!下一步执行人为:"
								+ getNextOperator("role_cashier"));
						po.setNextOperator(getNextOperatorIds("role_cashier"));

					} else if (roleNames.indexOf("出纳") >= 0) {
						po.setState(4);
						historyId = updateHistory(request, user, po, "出纳："
								+ user.getName() + " 审核通过!借款流程结束");
						po.setNextOperator("");

					} else if (roleNames.indexOf("超级管理员") >= 0) {
						// 可以审批所有的单子,注：流程的状态递增的数列
						po.setState(vo.getState() + 1);
						// 增加流程操作历史记录
						if (isProcessFinished(po)) {
							historyId = updateHistory(request, user, po,
									"超级管理员：" + user.getName() + "审核通过!借款流程结束");

						} else {
							historyId = updateHistory(request, user, po,
									"超级管理员：" + user.getName() + "审批通过!");
						}
					}

					// 根据状态更新当前历史记录
					if (po.getState() == 2) {
						loanApprovalRegister.setZjl_id(historyId);
					} else if (po.getState() == 3) {
						loanApprovalRegister.setKj_id(historyId);
					} else if (po.getState() == 4) {
						loanApprovalRegister.setCn_id(historyId);
					}

					try {
						loanApprovalRegisterService.edit(loanApprovalRegister);
						po.setArriveDT(new Date());
						processService.edit(po, request);
						j.setSuccess(true);
						j.setMsg("审批成功！");
					} catch (Exception e) {
						e.printStackTrace();
						j.setSuccess(false);
						j.setMsg("审批失败！");
						j.setMsg(e.getMessage());
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
		User user = getLoginUser(request);
		if (vo == null || vo.getId() <= 0 || vo.getDocId() == null
				|| vo.getDocId() <= 0) {
			j.setMsg("流程为空!");
			return j;
		}
		Process po = processService.get(vo.getId());
		if (!StringUtils.isEmpty(vo.getRemark())) {
			po.setRemark(vo.getRemark());
		}

		if (user == null) {
			j.setMsg("办理人为空,请重新登录!");
			return j;
		}

		if (loanApprovalRegisterService.get(vo.getDocId()) == null) {
			j.setMsg("资源为空,数据异常!");
			return j;
		}

		LoanApprovalRegister loanApprovalRegister = loanApprovalRegisterService
				.get(vo.getDocId());
		Long historyId = 0l;

		String roleNames = user.getRoleNames();

		// 状态更新
		if (roleNames.indexOf("总经理") >= 0) {
			po.setState(-2);
			// 增加流程操作历史记录
			historyId = updateHistory(request, user, po,
					"总经理：" + user.getName() + "审批不通过!");

		} else if (roleNames.indexOf("会计") >= 0) {
			po.setState(-3);
			// 增加流程操作历史记录
			historyId = updateHistory(request, user, po, "会计：" + user.getName()
					+ "审批不通过!");

		} else if (roleNames.indexOf("出纳") >= 0) {
			po.setState(-4);
			// 增加流程操作历史记录
			historyId = updateHistory(request, user, po, "出纳：" + user.getName()
					+ "审批不通过!");

		} else if (roleNames.indexOf("超级管理员") >= 0) {
			// 可以审批所有的单子
			po.setState(-(vo.getState() + 1));
			// 增加流程操作历史记录
			historyId = updateHistory(request, user, po,
					"超级管理员：" + user.getName() + "审批不通过!");
		}

		// 根据状态更新当前历史记录
		if (po.getState() == -2) {
			loanApprovalRegister.setZjl_id(historyId);
		} else if (po.getState() == -3) {
			loanApprovalRegister.setKj_id(historyId);
		} else if (po.getState() == -4) {
			loanApprovalRegister.setCn_id(historyId);
		}

		try {
			loanApprovalRegisterService.edit(loanApprovalRegister);
			po.setArriveDT(new Date());
			po.setNextOperator(po.getApplyUserId() + "");
			processService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("审批成功！");
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg(e.getMessage());
		}

		return j;
	}

	// 查看那流程图
	@RequestMapping("/processChart")
	public String processChart(HttpServletRequest request, Long id) {
		Process process = loanApprovalRegisterService.get(id).getProcess();
		if (process != null && process.getId() != null && process.getId() > 0) {
			process = processService.get(process.getId());
			request.setAttribute("process", process2Vo(process));
		}

		return "/basic/loanApprovalRegister/processChart";
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

		String[] idArray = ids.split(",");
		StringBuilder deleteProcessIds = new StringBuilder();
		for (String id : idArray) {
			LoanApprovalRegister rt = loanApprovalRegisterService.get(Long
					.valueOf(id));

			if (rt == null || rt.getProcess() == null
					|| rt.getProcess().getState() == null) {
				continue;
			}
			deleteProcessIds.append(rt.getProcess().getId() + ",");
			if (rt.getProcess().getState() > 0) {
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
			loanApprovalRegisterService.delete(ids);
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
	public LoanApprovalRegister get(Long id) {
		return loanApprovalRegisterService.get(id);
	}

	/**
	 * po vo 转换
	 * 
	 * @param po
	 * @return
	 */
	private LoanApprovalRegisterVo toVo(LoanApprovalRegister po) {
		LoanApprovalRegisterVo vo = new LoanApprovalRegisterVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getProcess() != null && po.getProcess().getId() != null
				&& po.getProcess().getId() > 0) {
			Process process = processService.get(po.getProcess().getId());
			vo.setProcess_vo(process2Vo(process));
		}

		// 设置审批意见
		if (po.getZjl_id() != null && po.getZjl_id() > 0) {
			ProcessHistory h = processHistoryService.get(po.getZjl_id());
			vo.setZjl_remark(h == null ? "" : h.getRemark());
		}
		if (po.getKj_id() != null && po.getKj_id() > 0) {
			ProcessHistory h = processHistoryService.get(po.getKj_id());
			vo.setKj_remark(h == null ? "" : h.getRemark());
		}
		if (po.getCn_id() != null && po.getCn_id() > 0) {
			ProcessHistory h = processHistoryService.get(po.getCn_id());
			vo.setCn_remark(h == null ? "" : h.getRemark());
		}
		return vo;
	}

	private LoanApprovalRegister toPo(LoanApprovalRegisterVo vo) {
		LoanApprovalRegister po = new LoanApprovalRegister();
		BeanUtils.copyProperties(vo, po);
		if (vo.getProcess_vo() != null) {
			po.setProcess(process2Po(vo.getProcess_vo()));
		}
		return po;
	}

	@Override
	protected boolean isProcessFinished(Process process) {
		if (process != null && process.getId() != null && process.getId() > 0) {
			return process.getState() == PROCESS_FINISHED;
		} else {
			return false;
		}
	}
}