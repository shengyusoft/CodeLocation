package com.wtkj.rms.reimbursement.service.impl;

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
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.reimbursement.model.po.Reimbursement;
import com.wtkj.rms.reimbursement.service.ReimbursementServiceI;

@Service
public class ReimbursementServiceImpl implements ReimbursementServiceI {

	@Autowired
	private BaseDaoI<Reimbursement> reimbursementDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Process> processDao;

	@Autowired
	private BaseDaoI<ProcessHistory> processHistoryDao;

	@Override
	public Long add(Reimbursement r, HttpServletRequest request) {
		// 保存或者提交，保存对应的process以及processHistory
		return (Long) reimbursementDao.save(r);
	}

	@Override
	public void delete(Long id) {
		Reimbursement p = reimbursementDao.get(Reimbursement.class, id);
		// 删除对应的流程信息以及流程历史记录信息
		reimbursementDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from reimbursement where id in (" + ids + ")";
		try {
			reimbursementDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Reimbursement r, HttpServletRequest request) {
		reimbursementDao.saveOrUpdate(r);
	}

	@Override
	public Reimbursement get(Long id) {
		Reimbursement r = reimbursementDao.get(Reimbursement.class, id);
		return r;
	}

	@Override
	public List<Reimbursement> dataGrid(Reimbursement Reimbursement,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Reimbursement t ";
		List<Reimbursement> l = reimbursementDao.find(
				hql + whereHql(Reimbursement, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<Reimbursement> findAll() {
		String hql = " from Reimbursement t ";
		List<Reimbursement> l = reimbursementDao.find(hql);

		return l;
	}

	@Override
	public Long count(Reimbursement Reimbursement, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Reimbursement t ";
		return reimbursementDao.count(
				"select count(*) " + hql + whereHql(Reimbursement, params),
				params);
	}

	private String whereHql(Reimbursement r, Map<String, Object> params) {
		String hql = "";
		if (r != null) {
			hql += " where 1=1 ";
			if (r.getProcess() != null && r.getProcess().getState() > 0) {
				hql += " and t.process.state = :state";
				params.put("state", r.getProcess().getState());
			}
			if (r.getStartDT() != null) {
				hql += " and t.startDT > :startDT";
				params.put("startDT", r.getStartDT());
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
	public List<Project> checkRelate(String ids) {
		return null;
	}

}
