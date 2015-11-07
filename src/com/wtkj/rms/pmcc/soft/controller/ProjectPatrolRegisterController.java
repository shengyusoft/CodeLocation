package com.wtkj.rms.pmcc.soft.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.pmcc.soft.model.ProjectPatrolRegister;
import com.wtkj.rms.pmcc.soft.service.ProjectPatrolRegisterServiceI;

/**
 * 工程巡查登记
 */
@Controller
@RequestMapping("/projectPatrolRegister")
public class ProjectPatrolRegisterController extends BaseController {

	@Autowired
	private ProjectPatrolRegisterServiceI projectPatrolRegisterService;

	@Autowired
	private UserServiceI userService;

	/**
	 * 菜单列表页面
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping("/manager")
	public String listPage(HttpServletRequest request) {
		return "/basic/projectPatrolRegister/list";
	}
	/**
	 * 新增页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/projectPatrolRegister/add";
	}
	/**
	 * 编辑页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		request.setAttribute("id", id);
		return "/basic/projectPatrolRegister/edit";
	}
	/**
	 * 详情页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		request.setAttribute("id", id);
		return "/basic/projectPatrolRegister/detail";
	}

	/**
	 * 列表查询
	 * @param vo
	 * @param ph
	 * @param request
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ProjectPatrolRegister vo, PageFilter ph, HttpServletRequest request) {
		Grid grid = new Grid();
		SessionInfo sessionInfo = getSessionInfo(request);

		if (sessionInfo.getId() != null && sessionInfo.getId() > 0) {
			User user = userService.get(sessionInfo.getId());
			// 普通用户看到自己的申请信息
			if (user.getRoleNames().indexOf("普通用户") >= 0) {
//				vo.setApplierId(sessionInfo.getId());
			}
		}
		grid.setRows(projectPatrolRegisterService.dataGrid(vo, ph));
		grid.setTotal(projectPatrolRegisterService.count(vo, ph));
		return grid;
	}
	/**
	 * 保存
	 * @param pdrr
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json save(ProjectPatrolRegister pdrr, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (pdrr != null) {
				// 工程所在地
				String projectAddress = pdrr.getProvice() + "" + pdrr.getCity() + "" + pdrr.getCounty();
				pdrr.setProjectAddress(projectAddress);
				// 添加时间
				pdrr.setCreatTime(new Date());
				SessionInfo sessionInfo = 
						(SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
				// 添加人ID
				if (sessionInfo.getId() > 0) {
					pdrr.setCreater(String.valueOf(sessionInfo.getId()));
				}
				// 添加人中文名
				pdrr.setCreaterName(sessionInfo.getName());
				// 删除标记
				pdrr.setDelFlag("0");
			}
			Long id = projectPatrolRegisterService.save(pdrr, request);
			if (id > 0) {
				pdrr.setId(id);
			}
			j.setSuccess(true);
			j.setObj(pdrr);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	/**
	 * 编辑保存
	 * @param pdrr
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ProjectPatrolRegister pdrr, HttpServletRequest request) {
		Json j = new Json();
		try {
			if (pdrr != null) {
				// 工程所在地
				String projectAddress = pdrr.getProvice() + "" + pdrr.getCity() + "" + pdrr.getCounty();
				pdrr.setProjectAddress(projectAddress);
				// 添加时间
				pdrr.setCreatTime(new Date());
				SessionInfo sessionInfo = 
						(SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
				// 添加人ID
				if (sessionInfo.getId() > 0) {
					pdrr.setCreater(String.valueOf(sessionInfo.getId()));
				}
				// 添加人中文名
				pdrr.setCreaterName(sessionInfo.getName());
				// 删除标记
				pdrr.setDelFlag("0");
			}
			projectPatrolRegisterService.update(pdrr, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 删除
	 * @param ids
	 * @return
	 */
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
			projectPatrolRegisterService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	/**
	 * 通过id加载单个
	 * @param id
	 * @return
	 */
	@RequestMapping("/get")
	@ResponseBody
	public ProjectPatrolRegister get(Long id) {
		ProjectPatrolRegister obj = projectPatrolRegisterService.find(id);
		if(obj != null){
			String section = obj.getSection();
			if(section != null && !"".equals(section)){
				obj.setSection_show(section.split(","));
			}
		}
		return obj;
	}

	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("/queryToCombox")
	@ResponseBody
	public List<ProjectPatrolRegister> queryToCombox(){
		
		List<ProjectPatrolRegister> list = new ArrayList<ProjectPatrolRegister>();
		list = projectPatrolRegisterService.queryToCombox();
		return list;
	}
	
}