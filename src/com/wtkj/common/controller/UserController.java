package com.wtkj.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.ServiceException;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.model.User;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.UserServiceI;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private UserServiceI userService;
	
	@Autowired
	private DictionaryServiceI dictionaryService;

	
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		request.setAttribute("usertypeJson",JSON.toJSONString(dictionaryService.combox("usertype")));
		return "/admin/user";
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(User user, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(userService.dataGrid(user, ph));
		grid.setTotal(userService.count(user, ph));
		return grid;
	}
	
	
	@RequestMapping("/editPwdPage")
	public String editPwdPage(HttpServletRequest request) {
		return "/admin/userEditPwd";
	}
	
	@RequestMapping("/editPersonalPage")
	public String editPersonalPage(HttpServletRequest request,Long id) {
		User u = userService.get(id);
		request.setAttribute("user", u);
		request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/admin/personalEdit";
	}
	
	@RequestMapping("/editUserPwd")
	@ResponseBody
	public Json editUserPwd(HttpServletRequest request,String oldPwd, String pwd) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
		Json j = new Json();
		try {
			userService.editUserPwd(sessionInfo, oldPwd, pwd);
			j.setSuccess(true);
			j.setMsg("密码修改成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/combox")
	@ResponseBody
	public List<User> find(String ocode,String dcode) {
		//根据部门编码ocode以及用户类型编码dcode查找用户
		return userService.find(ocode,dcode);
	}
	
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/admin/userAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Json add(User user) {
		Json j = new Json();
		User u = userService.getByLoginName(user);
		if(u!=null){
			j.setMsg("用户名已存在!");
		}else{
			try {
				if(!StringUtils.isEmpty(user.getMobilePhone())){
					user.setLoginname(user.getMobilePhone());
				}else{
					j.setSuccess(false);
					j.setMsg("手机号码不能为空!");
					return j;
				}
				userService.add(user);
				j.setSuccess(true);
				j.setMsg("添加成功！");
			} catch (Exception e) {
				j.setMsg(e.getMessage());
			}
			
		}
		return j;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public User get(Long id) {
		return userService.get(id);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		try {
			userService.delete(id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		User u = userService.get(id);
		request.setAttribute("user", u);
		request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/admin/userEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(User user) {
		Json j = new Json();
		try {
			if(!StringUtils.isEmpty(user.getMobilePhone())){
				user.setLoginname(user.getMobilePhone());
			}else{
				j.setSuccess(false);
				j.setMsg("手机号码不能为空!");
				return j;
			}
			userService.edit(user);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (ServiceException e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/editPersonal")
	@ResponseBody
	public Json editPersonal(User user) {
		Json j = new Json();
		try {
			userService.editPersonal(user);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (ServiceException e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}
