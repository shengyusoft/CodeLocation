package com.wtkj.rms.task.controller;

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
import com.wtkj.rms.task.model.TaskDetail;
import com.wtkj.rms.task.service.TaskDetailServiceI;

@Controller
@RequestMapping("/taskDetail")
public class TaskDetailController extends BaseController {

	@Autowired
	private TaskDetailServiceI taskDetailService;

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(TaskDetail task, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(taskDetailService.dataGrid(task, ph));
		grid.setTotal(taskDetailService.count(task, ph));
		return grid;
	}

	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		TaskDetail d = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			d = taskDetailService.get(id);
		} else {
			// 添加
			d = new TaskDetail();
		}
		request.setAttribute("taskDetail", d);
		request.setAttribute("viewType", viewType);
		return "/basic/task/taskDetailView";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Json save(HttpServletRequest request, TaskDetail vo) {
		Json j = new Json();
		try {
			if (vo.getId() != null && vo.getId() > 0) {
				taskDetailService.edit(vo, request);
			} else {
				taskDetailService.add(vo, request);
			}
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
			taskDetailService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public TaskDetail get(Long id) {
		return taskDetailService.get(id);
	}
}