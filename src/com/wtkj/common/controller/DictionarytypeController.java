package com.wtkj.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Json;
import com.wtkj.common.Tree;
import com.wtkj.common.model.Dictionarytype;
import com.wtkj.common.service.DictionarytypeServiceI;

@Controller
@RequestMapping("/dictionarytype")
public class DictionarytypeController extends BaseController {

	@Autowired
	private DictionarytypeServiceI dictionarytypeService;

	
	
	@RequestMapping("/combox")
	@ResponseBody
	public List<Dictionarytype> combox(String pid) {
		return dictionarytypeService.combox(pid);
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public List<Tree> tree(HttpSession session) {
		return dictionarytypeService.tree();
	}
	
	
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		request.setAttribute("stateList", GlobalConstant.statelist);
		return "/admin/dictionaryTypeAdd";
	}
	
	
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request,Long id) {
		Dictionarytype dic = dictionarytypeService.get(id);
		request.setAttribute("dictionarytype", dic);
		request.setAttribute("stateList", GlobalConstant.statelist);
		return "/admin/dictionaryTypeEdit";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(Dictionarytype dictionarytype) {
		Json j = new Json();
		try {
			dictionarytypeService.add(dictionarytype);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		dictionarytypeService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Dictionarytype get(Long id)  {
		return dictionarytypeService.get(id);
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Dictionarytype dictionarytype) {
		Json j = new Json();
		try {
			dictionarytypeService.edit(dictionarytype);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}
