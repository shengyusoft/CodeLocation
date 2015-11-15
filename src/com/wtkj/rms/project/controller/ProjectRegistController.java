package com.wtkj.rms.project.controller;

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
import com.wtkj.common.model.User;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.project.model.ProjectRegist;
import com.wtkj.rms.project.model.ProjectRegistVo;
import com.wtkj.rms.project.service.ProjectRegistServiceI;

//项目报名登记,开标登记
@Controller
@RequestMapping("/projectRegist")
public class ProjectRegistController extends BaseController {

	@Autowired
	private ProjectRegistServiceI projectRegistService;

	@Autowired
	private UserServiceI userService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request, int type) {
		User u = getLoginUser(request);
		if (u.getRoleNames().indexOf("超级管理员") >= 0
				|| (u.getRoleNames().indexOf("总经理") >= 0)) {
			request.setAttribute("flag", 1);
		} else {
			request.setAttribute("flag", 0);
		}
		if (type == 0) {
			return "/basic/project/projectRegist";
		} else {
			return "/basic/project/projectBidRegist";
		}
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectRegist projectRegist, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectRegistService.dataGrid(projectRegist, ph));
		grid.setTotal(projectRegistService.count(projectRegist, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request, int type) {
		request.setAttribute("cuser", getLoginUser(request));
		if (type == 0) {
			return "/basic/project/projectRegistAdd";
		} else {
			return "/basic/project/projectBidRegistAdd";
		}
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectRegist vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectRegistService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			// j.setObj(vo);
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
			projectRegistService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectRegistVo get(Long id) {
		return projectRegistService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		ProjectRegistVo vo = projectRegistService.get(id);
		request.setAttribute("projectRegist", vo);
		if (vo.getType() == 0) {
			return "/basic/project/projectRegistEdit";// 缴纳
		} else {
			return "/basic/project/projectBidRegistEdit";// 退款
		}
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectRegist vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectRegistService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		ProjectRegistVo vo = projectRegistService.get(id);
		request.setAttribute("projectRegist", vo);
		if (vo.getType() == 0) {
			return "/basic/project/projectRegistDetail";

		} else {
			return "/basic/project/projectBidRegistDetail";
		}
	}

}