package com.wtkj.rms.process.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.service.ProcessHistoryServiceI;

@Service
public class ProcessHistoryServiceImpl implements ProcessHistoryServiceI {

	@Autowired
	private BaseDaoI<ProcessHistory> processHistoryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public Long add(ProcessHistory p, HttpServletRequest request) {
		return (Long)processHistoryDao.save(p);
	}

	@Override
	public void delete(Long id) {
		ProcessHistory p = processHistoryDao.get(ProcessHistory.class, id);
		processHistoryDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from process_history where id in (" + ids + ")";
		try {
			processHistoryDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ProcessHistory p, HttpServletRequest request) {
		processHistoryDao.saveOrUpdate(p);
	}

	@Override
	public ProcessHistory get(Long id) {
		ProcessHistory p = processHistoryDao.get(ProcessHistory.class, id);
		return p;
	}

	@Override
	public List<ProcessHistory> dataGrid(ProcessHistory ProcessHistory,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProcessHistory t ";
		List<ProcessHistory> ps = processHistoryDao.find(
				hql + whereHql(ProcessHistory, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		return ps;
	}

	@Override
	public List<ProcessHistory> findAll() {
		String hql = " from ProcessHistory t ";
		List<ProcessHistory> ps = processHistoryDao.find(hql);
		return ps;
	}

	@Override
	public Long count(ProcessHistory ProcessHistory, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProcessHistory t ";
		return processHistoryDao.count(
				"select count (*) " + hql + whereHql(ProcessHistory, params),
				params);
	}

	private String whereHql(ProcessHistory processHistory,
			Map<String, Object> params) {
		String hql = "";
		if (processHistory != null) {
			hql += " where 1=1 ";
			if (processHistory.getProcess() != null) {
				hql += " and t.process.id = :processId ";
				params.put("processId", processHistory.getProcess().getId());
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
	public void deleteByProcessId(String ids) {
		String sql = "delete from process_history where process_id in (" + ids
				+ ")";
		try {
			processHistoryDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
