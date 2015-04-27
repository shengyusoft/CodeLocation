package com.wtkj.rms.functional.sys;

import javax.annotation.Resource;

import org.junit.Test;

import com.wtkj.common.model.User;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.functional.base.BaseTestTemplate;

/**
 * 用户管理的功能测试.
 * 
 * @author 鸵鸟
 */
public class UserRestFT extends BaseTestTemplate {

	@Resource
	private UserServiceI userService;
	
	
	@SuppressWarnings("unused")
	@Test
	public void list() {
		User user = new User();
		user.setLoginname("admin");
		user.setPassword("admin");
		User u = userService.login(user);
	}
}
