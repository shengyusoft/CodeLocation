package com.wtkj.rms.dailymaintain.controller;

import java.util.List;

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
import com.wtkj.rms.dailymaintain.model.Task;
import com.wtkj.rms.dailymaintain.model.TaskVo;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;

@Controller
@RequestMapping("/task")
public class TaskController extends BaseController {

	@Autowired
	private TaskServiceI taskService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/dailymaintain/task";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<TaskVo> combox() {
		return taskService.combox();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, TaskVo task, PageFilter ph) {
		// 领导,组长,项目经理可以查看所有的存档,组员 查看自己的档案
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);

		Grid grid = new Grid();
		grid.setRows(taskService.dataGrid(sessionInfo.getId(), task, ph));
		grid.setTotal(taskService.count(sessionInfo.getId(), task, ph));
		return grid;
	}

	@RequestMapping("/assignTaskGrid")
	@ResponseBody
	public Grid assignTaskGrid(HttpServletRequest request) {
		// 领导,组长,项目经理可以查看所有的存档,组员 查看自己的档案
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		Grid grid = new Grid();
		List<TaskVo> tasks = taskService.findToDoTask(sessionInfo.getId());
		grid.setRows(tasks);
		if (tasks.size() == 0) {
			return null;
		}
		return grid;
	}

	/**
	 * 查询代办任务
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findTask")
	@ResponseBody
	public Json findTask(HttpServletRequest request) {
		Json j = new Json();
		try {
			SessionInfo sessionInfo = (SessionInfo) request.getSession()
					.getAttribute(GlobalConstant.SESSION_INFO);
			List<TaskVo> tasks = taskService.findToDoTask(sessionInfo.getId());
			request.setAttribute("tasklist", tasks);
			request.setAttribute("tasknum", tasks.size());
			if (tasks != null && tasks.size() > 0) {
				j.setSuccess(true);
				j.setMsg("添加成功！");
			}
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/dailymaintain/taskAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(TaskVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			taskService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
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

		// 检查关联的任务计划表,关联计划的不可以删除
		List<Task> taskRelateds = taskService.checkRelate(ids);

		// 任务已经被接受,或者正在处理中..,不可以删除
		String states = GlobalConstant.TASK_ACCEPTED + ","
				+ GlobalConstant.TASK_HANDLERING;
		List<Task> taskStates = taskService.findTaskByStates(states, ids);

		int all = ids.split(",").length;// 总共选择的任务量
		String msg = "";

		if (taskRelateds != null && taskRelateds.size() > 0) {
			// 关联,删除失败的任务
			msg += "<br>以下任务:<br>";
			for (int i = 0; i < taskRelateds.size(); i++) {
				Task task = taskRelateds.get(i);
				String taskName = task.getName().length() > 10 ? task.getName()
						.substring(0, 10) : task.getName();
				if (i == 3) {
					if (taskRelateds.size() > 4) {
						msg += "<br>" + taskName + "....";
					} else {
						msg += "<br>" + taskName;
					}
					msg += "<br>在计划中,删除失败,请检查任务计划!";
					j.setMsg(msg);
					j.setSuccess(false);
					return j;
				}
				msg += (i == 0) ? taskName : "<br>" + taskName;
			}
			msg += "<br>在计划中,删除失败,请检查任务计划!";
			j.setMsg(msg);
			j.setSuccess(false);
			return j;

		}

		if (taskStates != null && taskStates.size() > 0) {
			// 状态不对,删除失败的任务
			msg += "<br>以下任务:<br>";
			for (int i = 0; i < taskStates.size(); i++) {
				Task task = taskStates.get(i);
				String taskName = task.getName().length() > 10 ? task.getName()
						.substring(0, 10) : task.getName();
				if (i == 3) {
					if (taskStates.size() > 4) {
						msg += "<br>" + taskName + "....";
					} else {
						msg += "<br>" + taskName;
					}
					msg += "<br>" + taskName + "....";
					msg += "<br>已经被接受或者在处理中..,删除失败!";
					j.setMsg(msg);
					j.setSuccess(false);
					return j;
				}
				msg += (i == 0) ? taskName : "<br>" + taskName;
			}
			msg += "<br>已经被接受或者在处理中..,删除失败!";
			j.setMsg(msg);
			j.setSuccess(false);
			return j;
		}

		msg = "成功删除" + (all - taskRelateds.size() - taskStates.size()) + "个任务!";

		try {
			taskService.delete(ids);
			j.setMsg(msg);
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public TaskVo get(Long id) {
		return taskService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/taskEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(TaskVo vo, HttpServletRequest request) {
		Json j = new Json();

		// 任务已经被接受,或者处理,完成,不可以编辑
		if (vo.getTaskState() == GlobalConstant.TASK_ACCEPTED) {
			j.setSuccess(true);
			j.setMsg("任务已经被接受,不可编辑,请先撤销！");
			return j;
		}

		if (vo.getTaskState() == GlobalConstant.TASK_HANDLERING) {
			j.setSuccess(true);
			j.setMsg("任务在处理中,不可编辑！");
			return j;
		}

		if (vo.getTaskState() == GlobalConstant.TASK_ACCEPTED) {
			j.setSuccess(true);
			j.setMsg("任务已经完成,不可编辑！");
			return j;
		}

		try {

			taskService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/taskDetail";
	}

	// 任务处理
	@RequestMapping("/handlerPage")
	public String handlerPage(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/taskHandler";
	}

	@RequestMapping("/handler")
	@ResponseBody
	public Json handler(TaskVo vo, HttpServletRequest request) {
		Json j = new Json();
		TaskVo tvo = taskService.get(vo.getId());
		tvo.setTaskState(vo.getTaskState());
		tvo.setHandlerProcess(vo.getHandlerProcess());
		tvo.setHandlerResult(vo.getHandlerResult());
		tvo.setRemark(vo.getRemark());
		tvo.setDocumented(vo.getDocumented());
		try {
			taskService.edit(tvo, request);
			j.setSuccess(true);
			j.setMsg("处理成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/assign")
	@ResponseBody
	public Json assign(String ids) {
		// 分配任务
		Json j = new Json();
		try {
			taskService.assign(ids);
			j.setSuccess(true);
			j.setMsg("分配成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/cancel")
	@ResponseBody
	public Json cancel(String ids) {
		// 撤销任务
		Json j = new Json();
		try {
			taskService.cancel(ids);
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("acceptBatch")
	@ResponseBody
	public Json acceptBatch(String ids) {
		// 接受任务
		Json j = new Json();
		try {
			taskService.accept(ids);
			j.setSuccess(true);
			j.setMsg("成功接受任务！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("accept")
	@ResponseBody
	public Json accept(TaskVo vo) {
		// 接受任务
		Json j = new Json();
		try {
			taskService.accept(vo.getId() + "");
			j.setSuccess(true);
			j.setMsg("成功接受任务！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 维护档案
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/historyManager")
	public String historyManager(HttpServletRequest request) {
		return "/basic/dailymaintain/taskHistory";
	}

	// 维护档案
	@RequestMapping("/historyGrid")
	@ResponseBody
	public Grid historyGrid(HttpServletRequest request, TaskVo task,
			PageFilter ph) {
		// 查询维护档案,已完成并且存档的任务
		task.setTaskState(GlobalConstant.TASK_FINSHED);
		task.setDocumented(1);
		return dataGrid(request, task, ph);
	}

	@RequestMapping("/historyDetail")
	public String historyDetail(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/taskHistoryDetail";
	}

	/**
	 * 任务结算
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/banlanceManager")
	public String banlanceManager(HttpServletRequest request) {
		return "/basic/dailymaintain/taskBanlance";
	}

	@RequestMapping("/banlanceGrid")
	@ResponseBody
	public Grid banlanceGrid(HttpServletRequest request, TaskVo task,
			PageFilter ph) {
		// 已完成且收费的任务
		task.setTaskState(GlobalConstant.TASK_FINSHED);
		task.setCharge(1);// 1收费2不收费
		// task.setDocumented(1);
		return dataGrid(request, task, ph);
	}

	@RequestMapping("/banlanceEditPage")
	public String banlanceEditPage(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/taskBanlanceEdit";
	}

	@RequestMapping("/banlanceEdit")
	@ResponseBody
	public Json banlanceEdit(TaskVo vo, HttpServletRequest request) {
		// 结算核查处理
		TaskVo tvo = taskService.get(vo.getId());
		tvo.setChargeState(vo.getChargeState());
		tvo.setInvoiceState(vo.getInvoiceState());
		return edit(tvo, request);
	}

	// 我的待办
	@RequestMapping("/todoPage")
	public String todoPage(HttpServletRequest request, Long id) {
		TaskVo task = taskService.get(id);
		request.setAttribute("task", task);
		return "/basic/dailymaintain/tasktodo";
	}

	/**
	 * 运维人员定位
	 * 
	 * @param request
	 * @return
	 */
	/*
	 * @RequestMapping("/maintainPosGrid")
	 * 
	 * @ResponseBody public Grid maintainPosGrid(HttpServletRequest
	 * request,TaskVo vo) { // 领导,组长,项目经理可以查看所有的存档,组员 查看自己的档案 SessionInfo
	 * sessionInfo = (SessionInfo) request.getSession()
	 * .getAttribute(GlobalConstant.SESSION_INFO); Grid grid = new Grid();
	 * //这里的权限 需不需要控制,这个界面是不是只有领导,项目经理才能看到? List<TaskVo> tasks =
	 * taskService.findAssignedTask(vo,sessionInfo.getId());
	 * grid.setRows(tasks); long size = 0; if(tasks != null){ size =
	 * tasks.size(); } grid.setTotal(size); return grid; }
	 * 
	 * @RequestMapping("/maintainPosManager") public String
	 * maintainPosManager(HttpServletRequest request) { return
	 * "/basic/statistics/maintainLocation"; }
	 */

}