package com.wtkj.common.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.model.ShotcutInfoVo;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.ShotcutServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.FileUtil;

@Controller
@RequestMapping("/shotcut")
public class ShotcutController extends BaseController {

	@Autowired
	private UserServiceI userService;

	@Autowired
	private ShotcutServiceI shotcutService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@Value("#{messpro['upload.virtual.path']}")
	private String upload_virtual_path;// 项目图片上传虚拟路径

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/admin/shotcut";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request, ShotcutInfoVo vo,
			PageFilter ph) {
		Grid grid = new Grid();

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);

		grid.setRows(shotcutService.dataGrid(vo, ph, sessionInfo.getId()));
		grid.setTotal(shotcutService.count(vo, ph, sessionInfo.getId()));
		return grid;
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
			shotcutService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(HttpServletRequest request, String resourceIds) {
		Json j = new Json();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);

		try {
			shotcutService.add(resourceIds, sessionInfo.getId());
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ShotcutInfoVo vo, HttpServletRequest request) {
		Json j = new Json();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		try {

			// 将上传的图标,剪切到指定文件夹下
			File file = new File(upload_virtual_path + GlobalConstant.TEMP_DIR
					+ "/" + vo.getIconUrl());
			if (file.exists()) {
				FileUtil.cut(file, upload_virtual_path + "/shotcut");
			}

			vo.setIconUrl("/shotcut/" + vo.getIconUrl());
			shotcutService.edit(vo, sessionInfo.getId());
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/iconPage")
	public String iconPage(HttpServletRequest request, Long id) {
		ShotcutInfoVo vo = shotcutService.get(id);
		request.setAttribute("vo", vo);
		return "/singleUpload";
	}

}
