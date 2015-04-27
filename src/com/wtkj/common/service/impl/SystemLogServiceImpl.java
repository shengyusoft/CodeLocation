package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.SystemLog;
import com.wtkj.common.model.SystemLogVo;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.service.SystemLogServiceI;
import com.wtkj.common.utils.DateUtil;

@Service
public class SystemLogServiceImpl implements SystemLogServiceI {

	@Autowired
	private BaseDaoI<SystemLog> systemLogDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(SystemLogVo vo) {
		SystemLog po = new SystemLog();
		po.setClientIP(vo.getClientIP());
		po.setLoginDT(vo.getLoginDT());

		if (vo.getLoginUserId() != null && vo.getLoginUserId() > 0) {
			po.setLoginUser(userDao.get(Tuser.class, vo.getLoginUserId()));
		}

		systemLogDao.save(po);
	}

	@Override
	public void delete(Long id) {
		SystemLog log = systemLogDao.get(SystemLog.class, id);
		if (log != null) {
			systemLogDao.delete(log);
		}
	}

	@Override
	public SystemLogVo get(Long id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		SystemLog t = systemLogDao
				.get("from SystemLog t  left join fetch t.roles role where t.id = :id",
						params);
		SystemLogVo u = new SystemLogVo();
		BeanUtils.copyProperties(t, u);
		if (t.getLoginUser() != null) {
			u.setLoginUserAccount(t.getLoginUser().getLoginname());
			u.setLoginUserId(t.getLoginUser().getId());
			u.setLoginUserName(t.getLoginUser().getName());
		}

		return u;
	}

	@Override
	public List<SystemLogVo> dataGrid(SystemLogVo vo, PageFilter ph,
			Long currentUserId) {
		List<SystemLogVo> ul = new ArrayList<SystemLogVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder hql = new StringBuilder(
				" from SystemLog t left join fetch t.loginUser u ");

		List<SystemLog> l = systemLogDao.find(
				hql + whereHql(vo, params, currentUserId) + orderHql(ph),
				params, ph.getPage(), ph.getRows());

		for (SystemLog t : l) {
			SystemLogVo u = new SystemLogVo();
			BeanUtils.copyProperties(t, u);

			if (t.getLoginUser() != null) {
				u.setLoginUserAccount(t.getLoginUser().getLoginname());
				u.setLoginUserId(t.getLoginUser().getId());
				u.setLoginUserName(t.getLoginUser().getName());
			}

			ul.add(u);
		}
		return ul;
	}

	@Override
	public Long count(SystemLogVo vo, PageFilter ph, Long currentUserId) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from SystemLog t ";
		return systemLogDao.count(
				"select count(*) " + hql + whereHql(vo, params, currentUserId),
				params);
	}

	private String whereHql(SystemLogVo vo, Map<String, Object> params,
			Long currentUserId) {
		StringBuilder where = new StringBuilder(" where 1=1");

		Tuser currentUser = null;
		if (currentUserId != null && (currentUserId > 0)) {
			currentUser = userDao.get(Tuser.class, currentUserId);
		}

		if (currentUser != null) {
			Long userTypeId = currentUser.getUsertype();
			// 没有用户类型的用户,没有权限
			if (userTypeId != null && userTypeId > 0) {
				Tdictionary userType = dictionaryDao.get(Tdictionary.class,
						currentUser.getUsertype());
				// 组员 组长看到自己的log
				if (userType.getCode().equals(GlobalConstant.USERTYPE_ZY)
						|| userType.getCode()
								.equals(GlobalConstant.USERTYPE_ZZ)) {
					where.append(" and t.loginUser.id=" + currentUserId);
				}
			}
		}

		if (vo != null) {
			if (!StringUtils.isEmpty(vo.getLoginUserName())) {
				where.append(" and t.loginUser.name like :name");
				params.put("name", "%%" + vo.getLoginUserName() + "%%");
			}

			if (!StringUtils.isEmpty(vo.getClientIP())) {
				where.append(" and t.clientIP like :clientIP");
				params.put("clientIP", "%%" + vo.getClientIP() + "%%");
			}

		}

		return where.toString();
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from sys_log where id in (" + ids + ")";
		try {
			systemLogDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void clear() {
		String sql = "delete from sys_log";
		try {
			systemLogDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getUserLastLoginTime(Long id) {
		String hql = "";
		List<SystemLog> logs = null;
		String dateStr = null;
		if(id != null && id > 0){
			hql = "from SystemLog l left join fetch l.loginUser loginUser where l.loginUser.id="+id+"order by l.loginDT desc";
			logs = systemLogDao.find(hql);
		}
		
		if(logs != null && logs.size() > 0){
			dateStr = DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss", logs.get(0).getLoginDT());
		}else{
			dateStr = "第一次登录";
		}
		return dateStr;
	}

}
