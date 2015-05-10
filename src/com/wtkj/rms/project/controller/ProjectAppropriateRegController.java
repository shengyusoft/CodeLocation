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
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.rms.project.model.ProjectAppropriateReg;
import com.wtkj.rms.project.service.ProjectAppropriateRegServiceI;

@Controller
@RequestMapping("/projectAppropriateReg")
public class ProjectAppropriateRegController extends BaseController {

	@Autowired
	private ProjectAppropriateRegServiceI projectAppropriateRegService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/project/projectAppropriateReg";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectAppropriateReg projectAppropriateReg, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectAppropriateRegService.dataGrid(projectAppropriateReg, ph));
		grid.setTotal(projectAppropriateRegService.count(projectAppropriateReg, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/project/projectAppropriateRegAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectAppropriateReg vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectAppropriateRegService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
//			j.setObj(vo);
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
			//TODO 关联拨付情况表，注意级联删除
			projectAppropriateRegService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectAppropriateReg get(Long id) {
		return projectAppropriateRegService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		ProjectAppropriateReg vo = projectAppropriateRegService.get(id);
		request.setAttribute("projectAppropriateReg", vo);
		return "/basic/project/projectAppropriateRegEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectAppropriateReg vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectAppropriateRegService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		ProjectAppropriateReg vo = projectAppropriateRegService.get(id);
		request.setAttribute("projectAppropriateReg", vo);
		return "/basic/project/projectAppropriateRegDetail";
	}

}