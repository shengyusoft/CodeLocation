package com.wtkj.rms.project.controller;

import java.util.Date;
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
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.project.model.ProjectBookRegistVo;
import com.wtkj.rms.project.service.ProjectBookRegistServiceI;

//缴纳退回申请
@Controller
@RequestMapping("/projectBookRegist")
public class ProjectBookRegistController extends BaseController {

	@Autowired
	private ProjectBookRegistServiceI projectBookRegistService;

	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/project/projectBookRegist";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<ProjectBookRegistVo> findAll() {
		return projectBookRegistService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectBookRegistVo vo, PageFilter ph,
			HttpServletRequest request) {
		Grid grid = new Grid();
		grid.setRows(projectBookRegistService.dataGrid(vo, ph));
		grid.setTotal(projectBookRegistService.count(vo, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		// 根据类型返回 缴纳或者退回页面
		return "/basic/project/projectBookRegistAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectBookRegistVo vo, HttpServletRequest request) {
		// 普通员工提交
		Json j = new Json();
		try {
			vo.setRegistDT(new Date());
			// 申请人和申请时间
			SessionInfo sessionInfo = getSessionInfo(request);
			if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
				vo.setRegisterId(sessionInfo.getId());
			}
			projectBookRegistService.add(vo, request);
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
			projectBookRegistService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectBookRegistVo get(Long id) {
		return projectBookRegistService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		ProjectBookRegistVo vo = projectBookRegistService.get(id);
		request.setAttribute("projectBookRegist", vo);
		return "/basic/project/projectBookRegistEdit";// 缴纳
	}

	// 申请人编辑
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectBookRegistVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectBookRegistService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		ProjectBookRegistVo projectBookRegist = projectBookRegistService.get(id);
		request.setAttribute("projectBookRegist", projectBookRegist);
		return "/basic/project/projectBookRegistDetail";
	}

}