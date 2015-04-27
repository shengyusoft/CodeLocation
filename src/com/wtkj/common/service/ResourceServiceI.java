package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.SessionInfo;
import com.wtkj.common.Tree;
import com.wtkj.common.model.Resource;

public interface ResourceServiceI {

	public List<Resource> treeGrid();

	public void add(Resource resource);

	public void delete(Long id);

	public void edit(Resource resource);

	public Resource get(Long id);

	public List<Tree> tree(SessionInfo sessionInfo);

	public List<Tree> allTree(boolean flag);

	public List<String> resourceAllList();

	
	List<Tree> treeShotcut(SessionInfo sessionInfo);
}
