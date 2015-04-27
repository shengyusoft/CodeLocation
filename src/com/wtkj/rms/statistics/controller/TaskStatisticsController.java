package com.wtkj.rms.statistics.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.ChartController;
import com.wtkj.common.model.ChartInfo;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.dailymaintain.model.TaskVo;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;
import com.wtkj.rms.statistics.model.TaskResponseStatistics;
import com.wtkj.rms.statistics.service.TaskResponseServiceI;

/**
 * 任务统计
 * 
 * @author sunsi
 * 
 */
@Controller
@RequestMapping("/taskStatistics")
public class TaskStatisticsController extends ChartController {

	@Autowired
	private TaskResponseServiceI taskResponseService;

	@Autowired
	private TaskServiceI taskService;

	@Autowired
	private UserServiceI userService;

	/**
	 * 运维人员定位
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/maintainPosGrid")
	@ResponseBody
	public Grid maintainPosGrid(HttpServletRequest request, TaskVo vo) {
		// 领导,组长,项目经理可以查看所有的存档,组员 查看自己的档案
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		Grid grid = new Grid();
		// 这里的权限 需不需要控制,这个界面是不是只有领导,项目经理才能看到?
		List<TaskVo> tasks = taskService.findAssignedTask(vo,
				sessionInfo.getId());
		grid.setRows(tasks);
		long size = 0;
		if (tasks != null) {
			size = tasks.size();
		}
		grid.setTotal(size);
		return grid;
	}

	@RequestMapping("/maintainPosManager")
	public String maintainPosManager(HttpServletRequest request) {
		return "/basic/statistics/maintainLocation";
	}

	/**
	 * 任务响应时间分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/showResponseAnalysisChart")
	public void showResponseAnalysisChart(HttpServletRequest request,
			HttpServletResponse response) {
		// 设置图表属性
		ChartInfo chartinfo = new ChartInfo();
		chartinfo.setTitle("运维人员任务响应时间图");
		chartinfo.setxTitle("运维工程师");
		chartinfo.setyTitle("响应时间(/h)");
		chartinfo.setHeight(460);
		chartinfo.setWidth(900);
		chartinfo.setIs3D(false);

		List<TaskResponseStatistics> taskResponseStatisticsList = taskResponseService
				.findAll();
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (TaskResponseStatistics ts : taskResponseStatisticsList) {
			dataset.addValue(ts.getResponseDT(), ts.getUserName(),
					ts.getUserName());
		}

		this.setCategoryBarDataset(dataset);
		try {
			super.showBar3D(request, response, chartinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/taskResponseManager")
	public String responseAnalysisManager(HttpServletRequest request,HttpServletResponse response) {
		showResponseAnalysisChart(request,response);
		return "/basic/statistics/taskResponseAnalysis";
	}

}