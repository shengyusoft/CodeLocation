package com.wtkj.rms.process.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.Grid;
import com.wtkj.common.PageFilter;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessHistoryVo;
import com.wtkj.rms.process.model.ProcessVo;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;

//统一处理流程每一步的审核
@Controller
@RequestMapping("/processHistory")
public class ProcessHistoryController extends BaseController {

	@Autowired
	private ProcessServiceI processService;

	@Autowired
	private ProcessHistoryServiceI processHistoryService;

	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/process/process";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProcessHistory p, PageFilter ph) {
		Grid grid = new Grid();
		List<ProcessHistory> phs = processHistoryService.dataGrid(p, ph);
		grid.setRows(convert2Vos(phs));
		grid.setTotal(processHistoryService.count(p, ph));
		return grid;
	}
	
	private List<ProcessHistoryVo> convert2Vos(List<ProcessHistory> pos) {
		List<ProcessHistoryVo> vos = new ArrayList<ProcessHistoryVo>();
		for (ProcessHistory po : pos) {
			vos.add(convert2Vo(po));
		}
		return vos;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProcessHistory get(Long id) {
		return processHistoryService.get(id);
	}

	private ProcessHistoryVo convert2Vo(ProcessHistory po) {
		if (po != null) {
			ProcessHistoryVo vo = new ProcessHistoryVo();
			BeanUtils.copyProperties(po, vo);
			if (po.getProcess() != null) {
				Process p = processService.get(po.getProcess().getId());
				vo.setProcessvo(process2Vo(p));
				if(po.getOperator() != null){
					User user = userService.get(po.getOperator().getId());
					vo.setOperatorId(user.getId());
					vo.setOperatorName(user.getName());
				}
			}
			return vo;
		} else {
			return null;
		}

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