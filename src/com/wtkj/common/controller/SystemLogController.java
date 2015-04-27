package com.wtkj.common.controller;

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
import com.wtkj.common.model.SystemLogVo;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.SystemLogServiceI;
import com.wtkj.common.service.UserServiceI;

@Controller
@RequestMapping("/syslog")
public class SystemLogController extends BaseController {

	@Autowired
	private UserServiceI userService;
	
	@Autowired
	private SystemLogServiceI systemLogService;
	
	@Autowired
	private DictionaryServiceI dictionaryService;

	
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/admin/syslog";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request,SystemLogVo vo, PageFilter ph) {
		Grid grid = new Grid();
		
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		
		grid.setRows(systemLogService.dataGrid(vo, ph,sessionInfo.getId()));
		grid.setTotal(systemLogService.count(vo, ph,sessionInfo.getId()));
		return grid;
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
			systemLogService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/clear")
	@ResponseBody
	public Json clear() {
		Json j = new Json();
		try {
			systemLogService.clear();
			j.setMsg("日志已经全部清空！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	

}
