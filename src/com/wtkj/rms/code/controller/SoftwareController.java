package com.wtkj.rms.code.controller;

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
import com.wtkj.rms.code.model.vo.SoftwareVo;
import com.wtkj.rms.code.service.SoftwareServiceI;

@Controller
@RequestMapping("/software")
public class SoftwareController extends BaseController {

	@Autowired
	private SoftwareServiceI softwareService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/code/software";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(SoftwareVo software, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(softwareService.dataGrid(software, ph));
		grid.setTotal(softwareService.count(software, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/code/softwareAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(SoftwareVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			softwareService.add(vo, request);
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
			softwareService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public SoftwareVo get(Long id) {
		return softwareService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		SoftwareVo software = softwareService.get(id);
		request.setAttribute("software", software);
		return "/basic/code/softwareEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(SoftwareVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			softwareService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		SoftwareVo software = softwareService.get(id);
		request.setAttribute("software", software);
		return "/basic/code/softwareDetail";
	}

}