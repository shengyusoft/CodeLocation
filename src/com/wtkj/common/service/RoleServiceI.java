package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.common.Tree;
import com.wtkj.common.model.Role;
import com.wtkj.common.model.User;

public interface RoleServiceI {

	public List<Role> dataGrid(Role role, PageFilter ph);

	public Long count(Role role, PageFilter ph);

	public void add(Role role);

	public void delete(Long id);

	public void edit(Role role);

	public Role get(Long id);

	public void grant(Role role);

	public List<Tree> tree();

	public List<Role> findByUser(User user);

}
