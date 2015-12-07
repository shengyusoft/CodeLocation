package com.wtkj.rms.process.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.service.ProcessServiceI;

@Service
public class ProcessServiceImpl implements ProcessServiceI {

	@Autowired
	private BaseDaoI<Process> processDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public Long add(Process p, HttpServletRequest request) {
		return (Long) processDao.save(p);
	}

	@Override
	public void delete(Long id) {
		Process p = processDao.get(Process.class, id);
		processDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from process where id in (" + ids + ")";
		try {
			processDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Process p, HttpServletRequest request) {
		processDao.update(p);
	}

	@Override
	public Process get(Long id) {
		Process p = processDao.get(Process.class, id);
		return p;
	}

	@Override
	public List<Process> dataGrid(Process Process, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Process t ";
		List<Process> ps = processDao.find(hql + whereHql(Process, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return ps;
	}

	@Override
	public List<Process> findAll() {
		String hql = " from Process t ";
		List<Process> ps = processDao.find(hql);
		return ps;
	}

	@Override
	public Long count(Process Process, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Process t ";
		return processDao.count(
				"select count(*) " + hql + whereHql(Process, params), params);
	}

	private String whereHql(Process process, Map<String, Object> params) {
		String hql = "";
		if (process != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(process.getProcessName())) {
				hql += " and t.processName like :name";
				params.put("name", "%%" + process.getProcessName() + "%%");
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
	public void deleteByDocIds(String ids) {
		String sql = "delete from process where docId in (" + ids + ")";
		try {
			processDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Process> findProcessByState(int state) {
		String sql = "";
		if (state > 0 && state < 9) {
			sql = " select * from process p where p.state=" + state;
		} else if (state == 9) {//超级管理员查看所有的
			sql = " select * from process p where p.state > 0";;
		} else {
			// 被退回的流程，用户重新申请
			sql = " select * from process p where p.state < 0";
		}
		return processDao.findBySql(sql, Process.class);
	}
}
