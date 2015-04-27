package com.wtkj.rms.dailymaintain.controller;

import java.util.Date;

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
import com.wtkj.rms.dailymaintain.model.TaskScheduleVo;
import com.wtkj.rms.dailymaintain.service.TaskScheduleServiceI;

@Controller
@RequestMapping("/taskSchedule")
public class TaskScheduleController extends BaseController {

	@Autowired
	private TaskScheduleServiceI taskScheduleService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/dailymaintain/taskSchedule";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, TaskScheduleVo vo,
			PageFilter ph) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		// 获取当前用户id
		Long currentUserId = sessionInfo.getId();

		Grid grid = new Grid();
		grid.setRows(taskScheduleService.dataGrid(currentUserId, vo, ph));
		grid.setTotal(taskScheduleService.count(currentUserId, vo, ph));
		return grid;
	}

	@RequestMapping("/showPage")
	public String showPage(HttpServletRequest request, Long id) {
		// 添加或者修改
		TaskScheduleVo vo = null;
		if (id != null && id > 0) {
			vo = taskScheduleService.get(id);
		} else {
			vo = new TaskScheduleVo();
		}
		request.setAttribute("taskSchedule", vo);
		return "/basic/dailymaintain/taskScheduleShow";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(TaskScheduleVo vo, HttpServletRequest request) {
		Json j = new Json();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		// 获取当前用户id
		Long currentUserId = sessionInfo.getId();
		try {

			// 添加人为当前用户
			if (currentUserId > 0) {
				vo.setUserId(currentUserId);
			}
			// 添加时间取当前时间
			vo.setAddTime(new Date());

			taskScheduleService.add(vo);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(TaskScheduleVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			taskScheduleService.edit(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
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
			taskScheduleService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public TaskScheduleVo get(Long id) {
		return taskScheduleService.get(id);
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		TaskScheduleVo taskSchedule = taskScheduleService.get(id);
		request.setAttribute("taskSchedule", taskSchedule);
		return "/basic/dailymaintain/taskScheduleDetail";
	}

	/**
	 * 执行任务
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping("/excute")
	@ResponseBody
	public Json excute(TaskScheduleVo vo, HttpServletRequest request) {
		Json json = new Json();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		// 获取当前用户id
		Long currentUserId = sessionInfo.getId();
		try {
			// 添加人为当前用户
			if (currentUserId > 0) {
				vo.setUserId(currentUserId);
			}
			// 添加时间取当前时间
			vo.setAddTime(new Date());
			taskScheduleService.excute(vo);
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("执行任务失败");
		}
		json.setSuccess(true);
		return json;
	}
	
	@RequestMapping("/startTask")
	@ResponseBody
	public Json startTask(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}

		try {
			taskScheduleService.start(ids);
			
			j.setMsg("执行成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}