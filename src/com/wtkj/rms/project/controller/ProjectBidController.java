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
import com.wtkj.rms.project.model.ProjectBid;
import com.wtkj.rms.project.service.ProjectBidServiceI;

@Controller
@RequestMapping("/projectBid")
public class ProjectBidController extends BaseController {

	@Autowired
	private ProjectBidServiceI projectBidService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		
			return "/basic/project/projectBid";
		
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectBid projectBid, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectBidService.dataGrid(projectBid, ph));
		grid.setTotal(projectBidService.count(projectBid, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		
			return "/basic/project/projectBidAdd";
		
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectBid vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectBidService.add(vo, request);
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
			projectBidService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectBid get(String id) {
		return projectBidService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		ProjectBid vo = projectBidService.get(id);
		request.setAttribute("projectBid", vo);
		
			return "/basic/project/projectBidEdit";// 退款
		
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectBid vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectBidService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String id) {
		ProjectBid vo = projectBidService.get(id);
		request.setAttribute("projectBid", vo);
		
			return "/basic/project/projectBidDetail";
		
	}

}