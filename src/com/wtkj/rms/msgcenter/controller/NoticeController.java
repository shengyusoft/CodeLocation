package com.wtkj.rms.msgcenter.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.rms.msgcenter.model.po.Article;
import com.wtkj.rms.msgcenter.model.vo.ArticleVo;

@Controller
@RequestMapping("/notice")
/**
 * 文章信息 包括管理制度,知识库,通知公告,所以设置为多例模式
 * @author sunsi
 *
 */
public class NoticeController extends ArticleController {

	// TODO 配置文件读取或者数据库读取
	public static final String TAG = "notice";
	public static final String CODE = "tzgg";

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		checkDictionary(CODE);
		return super.manager(request, TAG);
	}

//	@Override
//	@RequestMapping("/dataGrid")
//	@ResponseBody
//	public Grid dataGrid(ArticleVo articleVo, PageFilter ph) {
//		checkDictionary(CODE);
//		if (dictionaryCache != null) {
//			articleVo.setDictionaryId(dictionaryCache.getId());
//		}
//		return super.dataGrid(articleVo, ph);
//	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ArticleVo articleVo, PageFilter ph, boolean zdTag) {
		checkDictionary(CODE);
		if (dictionaryCache != null) {
			articleVo.setDictionaryId(dictionaryCache.getId());
		}
		return super.dataGrid(articleVo, ph);
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return super.addPage(request, TAG);
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ArticleVo avo, HttpServletRequest request) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		checkDictionary(CODE);
		avo.setCreateDT(new Date());
		avo.setCreateUserID(sessionInfo.getId());
		if (dictionaryCache != null) {
			avo.setDictionaryId(dictionaryCache.getId());
		}
		return super.add(avo, request);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ids) {
		return super.delete(ids);
	}

	@RequestMapping("/get")
	@ResponseBody
	public ArticleVo get(Long id) {
		return super.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		return super.editPage(request, id, TAG);
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ArticleVo articleVo, HttpServletRequest request) {
		return super.edit(articleVo, request);
	}

	/**
	 * 发布通知
	 */
	@RequestMapping("/publish")
	@ResponseBody
	public Json publish(HttpServletRequest request, String ids) {
		return super.publish(request, ids);
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		return super.detailPage(request, id, TAG);
	}

	@RequestMapping("/findAll")
	@ResponseBody
	public Json findAll(HttpServletRequest request, Long id, String type) {
		return super.findAll(request, id, type);
	}
}