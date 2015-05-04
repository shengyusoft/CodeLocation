package com.wtkj.rms.process.controller;

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
import com.wtkj.common.controller.BaseController;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;
import com.wtkj.rms.process.service.ProcessServiceI;

//统一处理流程每一步的审核
@Controller
@RequestMapping("/process")
public class ProcessController extends BaseController {

	@Autowired
	private ProcessServiceI processService;
	
	@Autowired
	private ProcessHistoryServiceI processHistoryService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/process/process";
	}


	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Process p, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(processService.dataGrid(p, ph));
		grid.setTotal(processService.count(p, ph));
		return grid;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public Process get(Long id) {
		return processService.get(id);
	}

	//审批通过
	@RequestMapping("/complete")
	@ResponseBody
	public Process complate(Long id) {
		
		
		return processService.get(id);
	}
	
	//审批不通过
	@RequestMapping("/abort")
	@ResponseBody
	public Process abort(Long id) {
		return processService.get(id);
	}
	
}