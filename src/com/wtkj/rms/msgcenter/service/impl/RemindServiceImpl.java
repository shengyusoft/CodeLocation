package com.wtkj.rms.msgcenter.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.msgcenter.model.po.Remind;
import com.wtkj.rms.msgcenter.service.RemindServiceI;

@Service
public class RemindServiceImpl implements RemindServiceI {

	@Autowired
	private BaseDaoI<Remind> remindDao;

	@Override
	public void add(Remind r, HttpServletRequest request) {
		remindDao.save(r);
	}

	@Override
	public void delete(String ids) {
		if (StringUtils.isEmpty(ids)) {
			return;
		}
		String sql = "delete from sys_remind where id in (" + ids + ")";
		try {
			remindDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Remind vo, HttpServletRequest request) {
		remindDao.update(vo);
	}

	@Override
	public Remind get(Long id) {
		return remindDao.get(Remind.class, id);
	}

	@Override
	public List<Remind> dataGrid(Remind r, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Remind t ";
		List<Remind> l = remindDao.find(hql + orderHql(ph), params,
				ph.getPage(), ph.getRows());
		return l;
	}

	@Override
	public Long count(Remind r, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Remind t ";
		return remindDao.count("select count(*) " + hql, params);
	}

	private String orderHql(PageFilter ph) {
		return "";
	}

	@Override
	public List<Remind> findAll(String type) {
		List<Remind> ats = null;
		String sql = "select * from sys_remind a ";
		ats = remindDao.findBySql(sql, Remind.class);
		return ats;
	}

}
