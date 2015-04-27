package com.wtkj.rms.dailymaintain.controller;

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
import com.wtkj.rms.dailymaintain.model.PointInspectVo;
import com.wtkj.rms.dailymaintain.service.PointInspectServiceI;

@Controller
@RequestMapping("/pointInspect")
public class PointInspectController extends BaseController {

	@Autowired
	private PointInspectServiceI pointInspectService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/dailymaintain/pointInspect";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, PointInspectVo vo,
			PageFilter ph) {
		// 领导,组长,项目经理可以查看所有的记录,组员 查看自己的记录
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);

		Grid grid = new Grid();
		grid.setRows(pointInspectService.dataGrid(sessionInfo.getId(), vo, ph));
		grid.setTotal(pointInspectService.count(sessionInfo.getId(), vo, ph));
		return grid;
	}

	@RequestMapping("/showPage")
	public String showPage(HttpServletRequest request, Long id) {
		// 添加或者修改
		PointInspectVo vo = null;
		if (id != null && id > 0) {
			vo = pointInspectService.get(id);
		} else {
			vo = new PointInspectVo();
		}
		request.setAttribute("pointInspect", vo);
		return "/basic/dailymaintain/pointInspectShow";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(PointInspectVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			pointInspectService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(PointInspectVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			pointInspectService.add(vo, request);
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

		try {
			pointInspectService.delete(ids);
			j.setMsg("删除成功");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public PointInspectVo get(Long id) {
		return pointInspectService.get(id);
	}

}