package com.wtkj.rms.msgcenter.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Dictionary;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.rms.msgcenter.model.po.Article;
import com.wtkj.rms.msgcenter.model.vo.ArticleVo;
import com.wtkj.rms.msgcenter.service.ArticleServiceI;

/**
 * 文章信息 包括管理制度,知识库,通知公告,所以设置为多例模式
 * 
 * @author sunsi
 * 
 */
public abstract class ArticleController extends BaseController {

	protected static final Logger LOGGER = LoggerFactory
			.getLogger(ArticleController.class);

	protected Dictionary dictionaryCache;

	@Autowired
	protected ArticleServiceI articleService;

	@Autowired
	protected DictionaryServiceI dictionaryService;

	public String manager(HttpServletRequest request, String tag) {
		return "/basic/msgcenter/" + tag;
	}

	public Grid dataGrid(ArticleVo articleVo, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(articleService.dataGrid(articleVo, ph));
		grid.setTotal(articleService.count(articleVo, ph));
		return grid;
	}

	public String addPage(HttpServletRequest request, String tag) {
		return "/basic/msgcenter/" + tag + "Add";
	}

	public Json add(ArticleVo avo, HttpServletRequest request) {
		Json j = new Json();
		try {
			articleService.add(avo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	public Json delete(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}

		try {
			articleService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	public ArticleVo get(Long id) {
		return articleService.get(id);
	}

	public String editPage(HttpServletRequest request, Long id, String tag) {
		ArticleVo article = articleService.get(id);
		request.setAttribute("article", article);
		return "/basic/msgcenter/" + tag + "Edit";
	}

	public Json findAll(HttpServletRequest request, Long id, String type) {
		Json json = new Json();
		List<Article> articles = null;
		try {
			articles = articleService.findAll(type);
			request.setAttribute("articles", articles.get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	public Json edit(ArticleVo articleVo, HttpServletRequest request) {
		Json j = new Json();
		try {
			articleService.edit(articleVo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * 发布
	 * 
	 * @param articleVo
	 * @param request
	 * @return
	 */
	public Json publish(HttpServletRequest request, String ids) {
		Json j = new Json();
		try {
			articleService.publish(request, ids);
			j.setSuccess(true);
			j.setMsg("发布成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	public String detailPage(HttpServletRequest request, Long id, String tag) {
		ArticleVo articleVo = articleService.get(id);

		// 浏览次数
		int number = articleVo.getNumberOfScan();
		articleVo.setNumberOfScan(++number);
		articleService.edit(articleVo, request);

		request.setAttribute("article", articleVo);
		return "/basic/msgcenter/" + tag + "Detail";
	}

	private void initDictionary(String code) throws Exception {
		if (dictionaryCache == null) {
			dictionaryCache = new Dictionary();
			List<Dictionary> dictionaryList = dictionaryService.find(code,
					"wztype");
			// we can only get one record, if not errors occur
			if (dictionaryList.size() == 1) {
				dictionaryCache = dictionaryList.get(0);
			} else {
				// TODO may be we can throws definition's exception!
				dictionaryCache = null;
				throw new Exception(
						"not unique dictionary,please check ArticleController getUniqueDictionary method");
			}
		}
	}

	protected void checkDictionary(String code) {
		if (dictionaryCache == null) {
			try {
				initDictionary(code);
			} catch (Exception e) {
				LOGGER.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}

}