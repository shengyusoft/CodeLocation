package com.wtkj.rms.functional.sys;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.wtkj.common.model.Tuser;
import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.functional.base.BaseTestTemplate;
import com.wtkj.rms.project.service.ProjectAppropriateAccountServiceI;
import com.wtkj.rms.project.service.impl.ProjectAppropriateAccountServiceImpl;

/**
 * 用户管理的功能测试.
 * 
 * @author 鸵鸟
 */
public class UserRestFT extends BaseTestTemplate {

	@Resource
	private UserServiceI userService;

	@Resource
	private ProjectAppropriateAccountServiceI projectAppropriateAccountServiceImpl;

	@SuppressWarnings("unused")
	@Test
	public void list() {
		User user = new User();
		user.setLoginname("admin");
		user.setPassword("admin");
		User u = userService.login(user);
	}

	@Test
	public void list2() {
		List<Tuser> users = userService.findByRole("role_account");
		for (Tuser u : users) {
			System.out.println(u.getName() + "--");
		}
	}

	@Test
	public void testD() {
		BigInteger s = projectAppropriateAccountServiceImpl.countByRegId(21l);
		System.out.println("---------------"+s);
	}
}
