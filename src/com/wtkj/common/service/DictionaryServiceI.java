package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.Dictionary;

public interface DictionaryServiceI {

	public List<Dictionary> dataGrid(Dictionary dictionary, PageFilter ph);

	public Long count(Dictionary dictionary, PageFilter ph);

	public void add(Dictionary dictionary);

	public void delete(Long id);

	public void edit(Dictionary dictionary);

	public Dictionary get(Long id);

	public List<Dictionary> combox(String code);

	public Dictionary checkUnique(Dictionary dictionary);

	public List<Dictionary> find(String code, String codeType);

	public List<Dictionary> findCodeLk(String code, String codeType);

	public List<Dictionary> findByViewCode(String viewcode, int lvs);

	/**
	 * 行政区划列表
	 * 
	 * @param pid
	 *            上级id
	 * @param lvs
	 *            编码等级
	 * @return
	 */
	public List<Dictionary> xzqhCombox(Long pid, int lvs);

}
