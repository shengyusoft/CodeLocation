package com.wtkj.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.Json;
import com.wtkj.common.ServiceException;
import com.wtkj.common.Tree;
import com.wtkj.common.model.Organization;
import com.wtkj.common.service.OrganizationServiceI;

@Controller
@RequestMapping("/organization")
public class OrganizationController extends BaseController {

	@Autowired
	private OrganizationServiceI organizationService;
	
	@RequestMapping("/manager")
	public String manager() {
		return "/admin/organization";
	}

	@RequestMapping("/treeGrid")
	@ResponseBody
	public List<Organization> treeGrid() {
		return organizationService.treeGrid();
	}

	@RequestMapping("/tree")
	@ResponseBody
	public List<Tree> tree(HttpSession session) {
		return organizationService.tree();
	}
	
	@RequestMapping("/addPage")
	public String addPage() {
		return "/admin/organizationAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Organization organization) {
		Json j = new Json();
		try {
			organizationService.add(organization);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Organization get(Long id) {
		return organizationService.get(id);
	}
	
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request,Long id) {
		Organization o = organizationService.get(id);
		request.setAttribute("organization", o);
		return "/admin/organizationEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Organization org) throws InterruptedException {
		Json j = new Json();
		try {
			organizationService.edit(org);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		try {
			organizationService.delete(id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (ServiceException e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
}