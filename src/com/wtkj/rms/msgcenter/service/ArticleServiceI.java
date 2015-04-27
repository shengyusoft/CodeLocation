package com.wtkj.rms.msgcenter.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.msgcenter.model.po.Article;
import com.wtkj.rms.msgcenter.model.vo.ArticleVo;

public interface ArticleServiceI {

	public List<ArticleVo> dataGrid(ArticleVo articleVo, PageFilter ph);

	public Long count(ArticleVo articleVo, PageFilter ph);

	public ArticleVo get(Long id);

	public void add(ArticleVo articleVo, HttpServletRequest request);

	public void edit(ArticleVo articleVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	/**
	 * 查找所有的文章
	 * 
	 * @param type
	 * @return
	 */
	public List<Article> findAll(String type);

	/**
	 * 查找已经发布的文章(通知,制度)
	 * 
	 * @param type
	 * @return
	 */
	public List<ArticleVo> findPublishs(String type, Long userId);

	/**
	 * 发布文章(通知,制度)
	 * 
	 * @param request
	 * @param ids
	 */
	public void publish(HttpServletRequest request, String ids);
}
