package com.wtkj.common.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;

public interface UserServiceI {

	public List<User> dataGrid(User user, PageFilter ph);

	public Long count(User user, PageFilter ph);

	public void add(User user);

	public void delete(Long id);

	public void edit(User user);

	public User get(Long id);

	public User login(User user);

	public List<String> resourceList(Long id);

	public boolean editUserPwd(SessionInfo sessionInfo, String oldPwd,
			String pwd);

	public User getByLoginName(User user);

	List<User> find(String organization,String userType);

	public void editPersonal(User user);

	public List<Tuser> findByRole(String string);

}
