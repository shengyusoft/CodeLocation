package com.wtkj.rms.project.controller;

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
import com.wtkj.common.controller.BaseController;
import com.wtkj.rms.project.model.Certificate;
import com.wtkj.rms.project.service.CertificateServiceI;


@Controller
@RequestMapping("/certificate")
public class CertificateController extends BaseController {

	@Autowired
	private CertificateServiceI certificateService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/project/certificate";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<Certificate> combox(HttpServletRequest request) {
		return certificateService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Certificate certificate, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(certificateService.dataGrid(certificate, ph));
		grid.setTotal(certificateService.count(certificate, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/project/certificateAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Certificate vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			certificateService.add(vo, request);
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
			certificateService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Certificate get(Long id) {
		return certificateService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		Certificate certificate = certificateService.get(id);
		request.setAttribute("certificate", certificate);
		return "/basic/project/certificateEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Certificate vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			certificateService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		Certificate certificate = certificateService.get(id);
		request.setAttribute("certificate", certificate);
		return "/basic/project/certificateDetail";
	}

}