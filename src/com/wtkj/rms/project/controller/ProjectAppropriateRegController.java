package com.wtkj.rms.project.controller;

import java.math.BigInteger;
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
import com.wtkj.rms.project.model.ProjectAppropriateReg;
import com.wtkj.rms.project.service.ProjectAppropriateAccountServiceI;
import com.wtkj.rms.project.service.ProjectAppropriateRegServiceI;

@Controller
@RequestMapping("/projectAppropriateReg")
public class ProjectAppropriateRegController extends BaseController {

	@Autowired
	private ProjectAppropriateRegServiceI projectAppropriateRegService;

	@Autowired
	private ProjectAppropriateAccountServiceI projectAppropriateAccountService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/project/projectAppropriateReg";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectAppropriateReg projectAppropriateReg,
			PageFilter ph) {
		Grid grid = new Grid();
		List<ProjectAppropriateReg> regs = projectAppropriateRegService
				.dataGrid(projectAppropriateReg, ph);

		// 根据子状态判断状态值
		for (ProjectAppropriateReg reg : regs) {
			//未申请的记录
			BigInteger countNotApplied = projectAppropriateAccountService
					.countByRegIdAndState(reg.getId(), 0);
			
			//会计确认的数目
			BigInteger countKj = projectAppropriateAccountService
					.countByRegIdAndState(reg.getId(), 2);
			
			//出纳确认的数目
			BigInteger countCn = projectAppropriateAccountService
					.countByRegIdAndState(reg.getId(), 3);
			
			//总数
			BigInteger baseCount = projectAppropriateAccountService
					.countByRegId(reg.getId());

			//总数为0或者只有未申请的记录
			if (baseCount.intValue() == 0 || countNotApplied.intValue() == baseCount.intValue()) {
				reg.setState(-1);//所有的记录都是未申请或者没有记录则状态为未申请
			} else {
				if (countCn.intValue() == baseCount.intValue()-countNotApplied.intValue()) {
					// 所有申请的已经被出纳全部确认，代表已经拨付完成
					reg.setState(2);//拨付完成
				} else if(countCn.intValue()==0) {
					//都没有确认，未拨付
					reg.setState(0);
				}else{
					reg.setState(1);//部分拨付
				}
			}
		}
		grid.setRows(regs);
		grid.setTotal(projectAppropriateRegService.count(projectAppropriateReg,
				ph));
		return grid;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ProjectAppropriateReg get(Long id) {
		return projectAppropriateRegService.get(id);
	}

	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		ProjectAppropriateReg vo = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情
			vo = projectAppropriateRegService.get(id);
		} else {
			// 添加
			vo = new ProjectAppropriateReg();
		}
		request.setAttribute("projectAppropriateReg", vo);
		request.setAttribute("viewType", viewType);
		return "/basic/project/projectAppropriateRegView";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Json save(ProjectAppropriateReg vo, String viewType,
			HttpServletRequest request) {
		// 普通员工提交
		Json j = new Json();
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;
		try {
			// 添加
			if (vo.getId() == null || vo.getId() <= 0) {
				projectAppropriateRegService.add(vo, request);
				j.setObj(vo);
			} else {// 编辑或者处理
				projectAppropriateRegService.edit(vo, request);
			}

			if ("add".equals(viewType)) {
				j.setMsg("添加成功！");
			} else if ("edit".equals(viewType)) {
				j.setMsg("修改成功！");
			}
			j.setSuccess(true);
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
			// TODO 关联拨付情况表，注意级联删除
			projectAppropriateRegService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
}