package com.wtkj.rms.task.controller;

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
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.task.model.Task;
import com.wtkj.rms.task.model.TaskVo;
import com.wtkj.rms.task.service.TaskDetailServiceI;
import com.wtkj.rms.task.service.TaskServiceI;

@Controller
@RequestMapping("/task")
public class TaskController extends BaseController {

	@Autowired
	private TaskServiceI taskService;

	@Autowired
	private TaskDetailServiceI taskDetailService;

	@Autowired
	protected UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		request.setAttribute("roles", getLoginUser(request).getRoleNames());
		return "/basic/task/task";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, TaskVo task, PageFilter ph) {
		Grid grid = new Grid();

		User u = getLoginUser(request);
		List<Task> pos = taskService.dataGrid(task, ph,u,0);

		List<TaskVo> vos = new ArrayList<TaskVo>();
		for (Task po : pos) {
			vos.add(toVo(po));
		}
		grid.setRows(vos);
		grid.setTotal(taskService.count(task, ph,u,0));
		return grid;
	}
	
	
	//用于首页加载待办
	@RequestMapping("/toDoGrid")
	@ResponseBody
	public Grid toDoGrid(HttpServletRequest request, TaskVo task, PageFilter ph) {
		Grid grid = new Grid();
		
		User u = getLoginUser(request);
		List<Task> pos = taskService.dataGrid(task, ph,u,1);
		
		List<TaskVo> vos = new ArrayList<TaskVo>();
		for (Task po : pos) {
			vos.add(toVo(po));
		}
		grid.setRows(vos);
		grid.setTotal(taskService.count(task, ph,u,1));
		return grid;
	}

	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		String url = "/basic/task/taskView";
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		TaskVo d = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			d = toVo(taskService.get(id));
			
			//任务办理的界面分开
			if("handler".equals(viewType)){
				if(d.getReceiveDt() == null){
					d.setReceiveDt(new Date());
				}
				url = "/basic/task/taskHandler";
			}
		} else {
			// 添加
			d = new TaskVo();
			User u = getLoginUser(request);
			d.setAssignDt(new Date());
			d.setAssignerId(u.getId());
			d.setAssignerName(u.getName());
		}

		request.setAttribute("task", d);
		request.setAttribute("viewType", viewType);
		return url;
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
			taskService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public TaskVo get(Long id) {
		return toVo(taskService.get(id));
	}

	@RequestMapping("/save")
	@ResponseBody
	public Json save(TaskVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (vo.getReceiverId() != null && vo.getReceiverId() > 0) {
				vo.setAssignState(1);// 如果选择了分配人则表示已经分配
			}else{
				vo.setAssignState(0);
			}
			
			if (vo.getId() != null && vo.getId() > 0) {
				taskService.edit(toPo(vo), request);
			} else {
				taskService.add(toPo(vo), request);
			}
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	private TaskVo toVo(Task po) {
		TaskVo vo = new TaskVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getAssigner() != null) {
			User u = userService.get(po.getAssigner().getId());
			if (u != null) {
				vo.setAssignerId(u.getId());
				vo.setAssignerName(u.getName());
			}
		}
		if (po.getReceiver() != null) {
			long id = po.getReceiver().getId();
			System.out.println("userid="+id);
			User u = userService.get(id);
			if (u != null) {
				vo.setReceiverId(u.getId());
				vo.setReceiverName(u.getName());
			}
		}
		return vo;
	}

	private Task toPo(TaskVo vo) {
		Task po = new Task();
		BeanUtils.copyProperties(vo, po);
		if (vo.getAssignerId() != null && vo.getAssignerId() > 0) {
			Tuser assigner = new Tuser();
			assigner.setId(vo.getAssignerId());
			po.setAssigner(assigner);
		}
		if (vo.getReceiverId() != null && vo.getReceiverId() > 0) {
			Tuser receiver = new Tuser();
			receiver.setId(vo.getReceiverId());
			po.setReceiver(receiver);
		}
		return po;
	}
}