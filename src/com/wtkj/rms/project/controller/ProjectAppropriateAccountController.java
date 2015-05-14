package com.wtkj.rms.project.controller;

import java.util.Date;

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
import com.wtkj.rms.project.model.ProjectAppropriateAccountVo;
import com.wtkj.rms.project.service.ProjectAppropriateAccountServiceI;

@Controller
@RequestMapping("/projectAppropriateAccount")
public class ProjectAppropriateAccountController extends BaseController {

	@Autowired
	private ProjectAppropriateAccountServiceI projectAppropriateAccountService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/projectAppropriateAccount/projectAppropriateAccount";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectAppropriateAccountVo vo, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectAppropriateAccountService.dataGrid(vo, ph));
		grid.setTotal(projectAppropriateAccountService.count(vo, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/project/projectAppropriateAccountAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectAppropriateAccountVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectAppropriateAccountService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			j.setObj(vo);
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
			projectAppropriateAccountService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectAppropriateAccountVo get(long id) {
		return projectAppropriateAccountService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, long id) {
		ProjectAppropriateAccountVo vo = projectAppropriateAccountService
				.get(id);
		request.setAttribute("projectAppropriateAccount", vo);
		return "/basic/project/projectAppropriateAccountEdit";
	}

	// 会计部处理
	@RequestMapping("/handlerPage")
	public String handlerPage(HttpServletRequest request, long id) {
		ProjectAppropriateAccountVo vo = projectAppropriateAccountService
				.get(id);
		request.setAttribute("projectAppropriateAccount", vo);
		return "/basic/project/projectAppropriateAccountHandler";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectAppropriateAccountVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectAppropriateAccountService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/handler")
	@ResponseBody
	public Json handler(ProjectAppropriateAccountVo vo,
			HttpServletRequest request) {
		Json j = new Json();
		try {
			vo.setState(2);
			if (vo.getActualDT() == null) {
				vo.setActualDT(new Date());
			}
			projectAppropriateAccountService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, long id) {
		ProjectAppropriateAccountVo vo = projectAppropriateAccountService
				.get(id);
		request.setAttribute("projectAppropriateAccount", vo);
		return "/basic/project/projectAppropriateAccountDetail";
	}

}