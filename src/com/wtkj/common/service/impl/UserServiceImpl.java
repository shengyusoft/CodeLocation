package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Torganization;
import com.wtkj.common.model.Tresource;
import com.wtkj.common.model.Trole;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.MD5Util;

@Service
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Trole> roleDao;

	@Autowired
	private BaseDaoI<Torganization> organizationDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(User u) {
		Tuser t = new Tuser();
		BeanUtils.copyProperties(u, t);
		t.setIsdefault(1);
		t.setOrganization(organizationDao.get(Torganization.class,
				u.getOrganizationId()));

		List<Trole> roles = new ArrayList<Trole>();
		if (u.getRoleIds() != null) {
			for (String roleId : u.getRoleIds().split(",")) {
				roles.add(roleDao.get(Trole.class, Long.valueOf(roleId)));
			}
		}
		t.setRoles(new HashSet<Trole>(roles));

		t.setPassword(MD5Util.md5(u.getPassword()));
		t.setState(GlobalConstant.ENABLE);
		t.setCreatedatetime(new Date());
		userDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tuser t = userDao.get(Tuser.class, id);
		del(t);
	}

	private void del(Tuser t) {
		userDao.delete(t);
	}

	@Override
	public void edit(User user) {
		Tuser t = userDao.get(Tuser.class, user.getId());
		BeanUtils.copyProperties(user, t);
		t.setAge(user.getAge());
		t.setLoginname(user.getLoginname());
		t.setName(user.getName());
		t.setOrganization(organizationDao.get(Torganization.class,
				user.getOrganizationId()));
		List<Trole> roles = new ArrayList<Trole>();
		if (user.getRoleIds() != null) {
			for (String roleId : user.getRoleIds().split(",")) {
				roles.add(roleDao.get(Trole.class, Long.valueOf(roleId)));
			}
		}
		t.setRoles(new HashSet<Trole>(roles));
		t.setSex(user.getSex());
		t.setUsertype(user.getUsertype());
		if (user.getPassword() != null && !"".equals(user.getPassword())) {
			t.setPassword(MD5Util.md5(user.getPassword()));
		}
		userDao.update(t);
	}

	@Override
	public User get(Long id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Tuser t = userDao.get(
				"from Tuser t  left join fetch t.roles role where t.id = :id",
				params);
		User u = new User();
		BeanUtils.copyProperties(t, u);

		if (t.getOrganization() != null) {
			u.setOrganizationId(t.getOrganization().getId());
			u.setOrganizationName(t.getOrganization().getName());
		}

		if (t.getRoles() != null && !t.getRoles().isEmpty()) {
			String roleIds = "";
			String roleNames = "";
			boolean b = false;
			for (Trole role : t.getRoles()) {
				if (b) {
					roleIds += ",";
					roleNames += ",";
				} else {
					b = true;
				}
				roleIds += role.getId();
				roleNames += role.getName();
			}
			u.setRoleIds(roleIds);
			u.setRoleNames(roleNames);
		}
		return u;
	}

	@Override
	public User login(User user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginname", user.getLoginname());
		params.put("password", MD5Util.md5(user.getPassword()));
		Tuser t = userDao
				.get("from Tuser t left join fetch t.organization organization where t.loginname = :loginname and t.password = :password",
						params);
		if (t != null) {
			User u = new User();
			BeanUtils.copyProperties(t, u);
			if (t.getUsertype() != null) {
				Tdictionary td = dictionaryDao.get(Tdictionary.class,
						t.getUsertype());
				u.setUsertypeName(td.getText());
			}

			if (t.getOrganization() != null) {
				u.setOrganizationName(t.getOrganization().getName());
			}

			return u;
		}
		return null;
	}

	@Override
	public List<String> resourceList(Long id) {
		List<String> resourceList = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Tuser t = userDao
				.get("from Tuser t join fetch t.roles role join fetch role.resources resource where t.id = :id",
						params);
		if (t != null) {
			Set<Trole> roles = t.getRoles();
			if ((roles != null) && !roles.isEmpty()) {
				for (Trole role : roles) {
					Set<Tresource> resources = role.getResources();
					if ((resources != null) && !resources.isEmpty()) {
						for (Tresource resource : resources) {
							if ((resource != null)
									&& (resource.getUrl() != null)) {
								resourceList.add(resource.getUrl());
							}
						}
					}
				}
			}
		}
		return resourceList;
	}

	@Override
	public List<User> dataGrid(User user, PageFilter ph) {
		List<User> ul = new ArrayList<User>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tuser t ";
		List<Tuser> l = userDao.find(hql + whereHql(user, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());
		for (Tuser t : l) {
			User u = new User();
			BeanUtils.copyProperties(t, u);
			Set<Trole> roles = t.getRoles();
			if ((roles != null) && !roles.isEmpty()) {
				String roleIds = "";
				String roleNames = "";
				boolean b = false;
				for (Trole tr : roles) {
					if (b) {
						roleIds += ",";
						roleNames += ",";
					} else {
						b = true;
					}
					roleIds += tr.getId();
					roleNames += tr.getName();
				}
				u.setRoleIds(roleIds);
				u.setRoleNames(roleNames);
			}
			if (t.getOrganization() != null) {
				u.setOrganizationId(t.getOrganization().getId());
				u.setOrganizationName(t.getOrganization().getName());
			}
			ul.add(u);
		}
		return ul;
	}

	@Override
	public List<User> find(String organization, String userType) {
		// 根据部门编码以及用户类型编码查找用户
		List<User> ul = new ArrayList<User>();
		List<Tuser> users = null;
		String sql = "select * from sys_user u ";
		String whereSQL = "";

		if (!StringUtils.isEmpty(organization)) {
			whereSQL = " where u.organization_id in ( select o.id from sys_organization o where o.code ='"
					+ organization + "')";
		}

		if (!StringUtils.isEmpty(userType)) {
			String sql1 = "select d.id from sys_dictionary d left join sys_dictionarytype dt "
					+ "on d.dictionarytype_id = dt.id where dt.code = 'usertype' and d.code in";
			String sqlin = "";

			if ("zy".equals(userType)) {// 组员
				sqlin = "('zy')";
			} else if ("zz".equals(userType)) {// 组长
				sqlin = "('zz','xmjl','ld')";
			} else if ("xmjl".equals(userType)) {
				sqlin = "('xmjl','ld')";
			} else if ("ld".equals(userType)) {
				sqlin += "('ld')";

			}

			whereSQL += " and u.usertype in(" + sql1 + sqlin + ")";
		}

		System.out.println("get user by ocode and dcode-------->" + sql
				+ whereSQL);

		try {
			users = (List<Tuser>) userDao
					.findBySql(sql + whereSQL, Tuser.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		for (Tuser tuser : users) {
			User user = new User();
			BeanUtils.copyProperties(tuser, user);
			ul.add(user);
		}
		return ul;
	}

	@Override
	public Long count(User user, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tuser t ";
		return userDao.count("select count(*) " + hql + whereHql(user, params),
				params);
	}

	private String whereHql(User user, Map<String, Object> params) {
		String hql = "";
		if (user != null) {
			hql += " where 1=1 ";
			if (user.getName() != null) {
				hql += " and t.name like :name";
				params.put("name", "%%" + user.getName() + "%%");
			}
			if (user.getOrganizationId() != null) {
				hql += " and t.organization.id =" + user.getOrganizationId();
			}
		}
		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public boolean editUserPwd(SessionInfo sessionInfo, String oldPwd,
			String pwd) {
		Tuser u = userDao.get(Tuser.class, sessionInfo.getId());
		if (u.getPassword().equalsIgnoreCase(MD5Util.md5(oldPwd))) {// 说明原密码输入正确
			u.setPassword(MD5Util.md5(pwd));
			return true;
		}
		return false;
	}

	@Override
	public User getByLoginName(User user) {
		Tuser t = userDao.get("from Tuser t  where t.loginname = '"
				+ user.getLoginname() + "'");
		User u = new User();
		if (t != null) {
			BeanUtils.copyProperties(t, u);
		} else {
			return null;
		}
		return u;
	}

	@Override
	public void editPersonal(User user) {
		Tuser t = userDao.get(Tuser.class, user.getId());

		t.setAge(user.getAge());
		t.setLoginname(user.getLoginname());
		t.setName(user.getName());
		t.setSex(user.getSex());
		if (user.getPassword() != null && !"".equals(user.getPassword())) {
			t.setPassword(MD5Util.md5(user.getPassword()));
		}
		t.setMobilePhone(user.getMobilePhone());
		t.setOfficePhone(user.getOfficePhone());
		t.setRemark(user.getRemark());
		t.setEmail(user.getEmail());
		t.setFax(user.getFax());

		userDao.update(t);

	}

	@Override
	public List<Tuser> findByRole(String roleCode) {
		String hql = "select * from sys_user u left join sys_user_role ur on u.id = ur.user_id left join sys_role r on ur.role_id=r.id where r.code='"
				+ roleCode + "'";
		return userDao.findBySql(hql, Tuser.class);
	}
}
