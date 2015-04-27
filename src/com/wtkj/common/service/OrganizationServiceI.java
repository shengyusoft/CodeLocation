package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.Tree;
import com.wtkj.common.model.Organization;

public interface OrganizationServiceI {

	public List<Organization> treeGrid();

	public void add(Organization organization);

	public void delete(Long id);

	public void edit(Organization organization);

	public Organization get(Long id);

	public List<Tree> tree();

}
