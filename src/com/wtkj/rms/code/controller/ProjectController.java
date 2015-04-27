package com.wtkj.rms.code.controller;

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
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.vo.ProjectVo;
import com.wtkj.rms.code.service.ProjectServiceI;
import com.wtkj.rms.dailymaintain.model.Task;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

	@Autowired
	private ProjectServiceI projectService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/code/project";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<ProjectVo> findAll() {
		return projectService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectVo project, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(projectService.dataGrid(project, ph));
		grid.setTotal(projectService.count(project, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/code/projectAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ProjectVo p, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectService.add(p, request);
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

		// 检查级联删除,关联合同,软件
		List<Project> projectRelateds = projectService.checkRelate(ids);
		String msg = "";
		if (projectRelateds != null && projectRelateds.size() > 0) {
			// 关联,删除失败的任务
			msg += "以下项目,有关联记录,不能删除:<ul style='margin-left:32px'>";
			for (int i = 0; i < projectRelateds.size(); i++) {
				Project p = projectRelateds.get(i);
				String pName = p.getName().length() > 10 ? p.getName()
						.substring(0, 10) + "..." : p.getName();
				if (i == 3) {
					if (projectRelateds.size() > 4) {
						msg += "<li>" + pName + "....</li>";
					} else {
						msg += "<li>" + pName + "</li></ul>";
					}
					j.setMsg(msg);
					j.setSuccess(false);
					return j;
				}
				msg += "<li>" + pName + "</li>";
			}

			j.setMsg(msg + "</ul>");
			j.setSuccess(false);
			return j;

		}

		try {
			projectService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectVo get(Long id) {
		return projectService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		ProjectVo project = projectService.get(id);
		request.setAttribute("project", project);
		return "/basic/code/projectEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectVo project, HttpServletRequest request) {
		Json j = new Json();
		try {
			projectService.edit(project, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		ProjectVo project = projectService.get(id);
		request.setAttribute("project", project);
		return "/basic/code/projectDetail";
	}

}