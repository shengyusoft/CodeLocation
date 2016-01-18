package com.wtkj.rms.process.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessVo;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;

//统一流程管理类
@Controller
@RequestMapping("/baseProcess")
public abstract class BaseProcessController extends BaseController {

	@Autowired
	protected ProcessServiceI processService;

	@Autowired
	protected ProcessHistoryServiceI processHistoryService;

	/**
	 * 流程更新
	 * 
	 * @param request
	 * @param docId
	 *            ：资源ID
	 * @param user
	 *            ：当前用户
	 * @param state
	 *            ：流程状态
	 * @param processName
	 *            ：流程名称
	 * @param processId
	 *            ：流程ID
	 * @return
	 * @throws Exception
	 */
	protected Process updateProcess(HttpServletRequest request, Long processId,
			String nextOperator, String processName, Long docId, User user,
			int state) throws Exception {
		Process process = null;
		if (user == null) {
			throw new Exception("操作人为空！请重新登录");
		}

		// 流程已经关联的
		if (processId != null && processId > 0) {
			process = processService.get(processId);
			process.setArriveDT(new Date());
			process.setState(state);
			processService.edit(process, request);
		} else {
			// 第一次创建流程
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());
			process = new Process();
			process.setProcessName(processName);
			process.setDocId(docId);
			process.setApplyUser(tuser);
			process.setStartDT(new Date());
			process.setArriveDT(new Date());
			process.setState(state);
			processId = processService.add(process, request);
		}
		
		if(!StringUtils.isEmpty(nextOperator)){
			process.setNextOperator(nextOperator);
		}
		process = processService.get(processId);
		return process;
	}

	/**
	 * 流程历史记录更新
	 * 
	 * @param request
	 * @param user
	 * @param process
	 * @param detail
	 */
	protected Long updateHistory(HttpServletRequest request, User user,
			Process process, String detail) {
		if (process.getId() != null && process.getId() > 0) {
			ProcessHistory history = new ProcessHistory();
			history.setOperateDT(new Date());
			Tuser tuser = new Tuser();
			tuser.setId(user.getId());
			history.setOperator(tuser);
			history.setOperateDetail(detail);
			history.setRemark(process.getRemark());
			history.setRemark2(process.getRemark2());
			history.setProcess(process);
			return processHistoryService.add(history, request);
		}
		return null;
	}

	/**
	 * 获取流程的下一步操作人
	 * 
	 * @param role
	 * @return
	 */
	protected String getNextOperator(String role) {
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

	protected Process process2Po(ProcessVo vo) {
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

	protected ProcessVo process2Vo(Process po) {
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

	// 级联删除流程信息
	protected void deleteCaseCade(StringBuilder deleteProcessIds) {
		try {
			if (!StringUtils.isEmpty(deleteProcessIds.toString())) {
				String processIds = deleteProcessIds.toString().substring(0,
						deleteProcessIds.length() - 1);
				processService.delete(processIds);
				// 级联删除流程历史记录(外键关联自动删除)
				// processHistoryService.deleteByProcessId(processIds);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 流程是否结束：不同的流程实例不同的判断方法
	 * 
	 * @return
	 */
	protected abstract boolean isProcessFinished(Process process);
}