package com.wtkj.rms.goods.controller;

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
import com.wtkj.rms.goods.model.GoodsVo;
import com.wtkj.rms.goods.service.GoodsServiceI;

@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

	@Autowired
	private GoodsServiceI goodsService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/goods/goods";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<GoodsVo> combox(HttpServletRequest request) {
		return goodsService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(GoodsVo goods, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(goodsService.dataGrid(goods, ph));
		grid.setTotal(goodsService.count(goods, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/goods/goodsAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(GoodsVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			goodsService.add(vo, request);
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
			goodsService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public GoodsVo get(Long id) {
		return goodsService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		GoodsVo vo = goodsService.get(id);
		request.setAttribute("goods", vo);
		return "/basic/goods/goodsEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(GoodsVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			goodsService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		GoodsVo goods = goodsService.get(id);
		request.setAttribute("goods", goods);
		return "/basic/goods/goodsDetail";
	}

}