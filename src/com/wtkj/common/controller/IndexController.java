package com.wtkj.common.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.model.ShotcutInfoVo;
import com.wtkj.common.model.SystemLogVo;
import com.wtkj.common.model.User;
import com.wtkj.common.service.ResourceServiceI;
import com.wtkj.common.service.ShotcutServiceI;
import com.wtkj.common.service.SystemLogServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.dailymaintain.model.TaskVo;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;
import com.wtkj.rms.msgcenter.model.vo.ArticleVo;
import com.wtkj.rms.msgcenter.service.ArticleServiceI;
import com.wtkj.rms.workspace.model.TaskToDoDto;

@Controller
@RequestMapping("/admin")
public class IndexController extends BaseController {

	private static final String LOGIN_COOKIE = "wtkj_rms_loginInfo";

	@Autowired
	private UserServiceI userService;

	@Autowired
	private ResourceServiceI resourceService;

	@Autowired
	private ArticleServiceI articleService;

	@Autowired
	private TaskServiceI taskService;

	@Autowired
	private SystemLogServiceI systemLogService;

	@Autowired
	private ShotcutServiceI shotcutService;

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		if ((sessionInfo != null) && (sessionInfo.getId() != null)) {
			loadData(request, sessionInfo);
			return "/index";
		}
		checkCookies(request);
		return "/login";
	}

	/**
	 * 加载首页所需的数据,通知公告,我的知识,任务等
	 * 
	 * @param request
	 * @param sessionInfo
	 */
	private void loadData(HttpServletRequest request, SessionInfo sessionInfo) {
		// 登录成功后加载已发表的文章或知识
		List<ArticleVo> notices = null;
		List<ArticleVo> knowledges = null;
		List<ShotcutInfoVo> shotcuts = null;
		try {
			// 加载通知和我的知识库
			notices = articleService.findPublishs("tzgg", null);
			knowledges = articleService.findPublishs("zsglk",
					sessionInfo.getId());
			request.setAttribute("notices", notices);
			request.setAttribute("knowledges", knowledges);

			// 加载快键方式
			shotcuts = shotcutService.dataGrid(null, null, sessionInfo.getId());
			request.setAttribute("shotcuts", shotcuts);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 加载我的待办
	 * 
	 * @param request
	 * @param sessionInfo
	 */
	@RequestMapping("/toDoGrid")
	@ResponseBody
	private Grid toDoGrid(HttpServletRequest request) {
		Grid grid = new Grid();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		List<TaskVo> tasks = null;
		List<TaskToDoDto> tasktodos = new ArrayList<TaskToDoDto>();
		try {
			tasks = taskService.findToDoTask(sessionInfo.getId());
			for (TaskVo vo : tasks) {
				TaskToDoDto dto = new TaskToDoDto();
				dto.setName(vo.getName());
				dto.setLevel(vo.getLevel());
				dto.setType(GlobalConstant.TODO_RCWH);
				dto.setId(vo.getId());
				dto.setState(vo.getTaskState());
				dto.setTag("task");
				if (vo.getLevel() == 2) {// 重要
					dto.setLevelText("<font color='#FFC000'>重要</font>");
				} else if (vo.getLevel() == 3) {// 紧急
					dto.setLevelText("<font color='#FF0000'>重要</font>");
				} else {// 一般
					dto.setLevelText("重要");
				}
				tasktodos.add(dto);
			}
			// TODO 加载其他待办...here!

			grid.setRows(tasktodos);
			grid.setTotal((long) tasktodos.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return grid;

	}

	@ResponseBody
	@RequestMapping("/login")
	public Json login(HttpServletRequest request, HttpServletResponse response,
			User user, HttpSession session, String vercode, boolean rememberPwd) {
		Json j = new Json();
		// validate login
		// String vcode = session.getAttribute("randCode").toString();
		//
		// if (vcode == null) {
		// j.setSuccess(false);
		// j.setMsg("验证码过期");
		// return j;
		// }
		// if (vercode == null || vercode.equals("")) {
		// j.setSuccess(false);
		// j.setMsg("验证码不能为空");
		// return j;
		// } else if (!vercode.equals(vcode)) {
		// j.setSuccess(false);
		// j.setMsg("验证码输入错误");
		// return j;
		// }

		User sysuser = userService.login(user);
		if (sysuser != null) {
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setIp(getIpAddr(request));
			sessionInfo.setId(sysuser.getId());
			sessionInfo.setLoginname(sysuser.getLoginname());
			sessionInfo.setName(sysuser.getName());
			sessionInfo.setMobilePhone(sysuser.getMobilePhone());
			sessionInfo.setOrganizationName(sysuser.getOrganizationName());
			sessionInfo.setUsertypeName(sysuser.getUsertypeName());
			// 用户上次登录时间
			String lastLoginTimeStr = systemLogService
					.getUserLastLoginTime(sessionInfo.getId());
			sessionInfo.setLastLoginTimeStr(lastLoginTimeStr);

			sessionInfo.setResourceList(userService.resourceList(sysuser
					.getId()));
			sessionInfo.setResourceAllList(resourceService.resourceAllList());
			session.setAttribute(GlobalConstant.SESSION_INFO, sessionInfo);
			j.setSuccess(true);
			saveCookies(request, response, rememberPwd, user);

			recordLog(sessionInfo);// 记录登录log
			return j;
		} else {
			j.setSuccess(false);
			j.setMsg("用户名或密码错误!");
			return j;
		}
	}

	/**
	 * 记录每次用户的登录信息
	 * 
	 * @param sessionInfo
	 */
	private void recordLog(SessionInfo sessionInfo) {
		// TODO 是否考虑一种算法控制用户 反复登录?
		SystemLogVo log = new SystemLogVo();
		log.setLoginDT(new Date());
		log.setClientIP(sessionInfo.getIp());
		log.setLoginUserId(sessionInfo.getId());
		systemLogService.add(log);
	}

	@ResponseBody
	@RequestMapping("/logout")
	public Json logout(HttpSession session) {
		Json j = new Json();
		if (session != null) {
			session.invalidate();
		}
		j.setSuccess(true);
		j.setMsg("注销成功！");
		return j;
	}

	// cookies操作
	private void saveCookies(HttpServletRequest request,
			HttpServletResponse response, boolean rememberPwd, User sysuser) {
		// 是否记住密码
		StringBuilder cookieSB = new StringBuilder();
		if (rememberPwd) {
			// 保存用户名密码
			cookieSB.append(sysuser.getLoginname() + "-"
					+ sysuser.getPassword());
		} else {
			// 不记住密码,默认保存用户名
			cookieSB.append(sysuser.getLoginname() + "-" + null);
		}

		Cookie loginInfo = new Cookie(LOGIN_COOKIE, cookieSB.toString());
		loginInfo.setPath("/");
		// cookie 保存30天
		loginInfo.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(loginInfo);

	}

	private void checkCookies(HttpServletRequest request) {
		String name = null;
		String password = null;
		Cookie cookie = getCookieByName(request, LOGIN_COOKIE);
		String[] loginInfos = null;

		if (cookie != null && !StringUtils.isEmpty(cookie.getValue())) {
			loginInfos = cookie.getValue().split("-");
			if (loginInfos != null && loginInfos.length > 0) {
				name = loginInfos[0];

				if (loginInfos.length > 1) {
					password = loginInfos[1];
				}
				request.setAttribute("cookie_name", name);
				request.setAttribute("cookie_passward",
						password.equals("null") ? "" : password);
			}
		}

	}

	public static Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}

	private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		if ("0:0:0:0:0:0:0:1".equals(ip)) {// 本地访问
			InetAddress addr = null;
			try {
				addr = InetAddress.getLocalHost();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			if (addr != null) {
				ip = addr.getHostAddress().toString();// 获得本机IP
			}
		}
		return ip;
	}

}
