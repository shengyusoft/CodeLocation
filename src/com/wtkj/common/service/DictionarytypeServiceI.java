package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.Tree;
import com.wtkj.common.model.Dictionarytype;

public interface DictionarytypeServiceI {


	public void add(Dictionarytype dictionarytype);

	public void delete(Long id);

	public void edit(Dictionarytype dictionarytype);

	public Dictionarytype get(Long id);

	public List<Tree> tree();

	public List<Dictionarytype> combox(String pid);


}
