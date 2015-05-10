package com.wtkj.rms.reimbursement.service.impl;

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
import com.wtkj.common.model.User;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessVo;
import com.wtkj.rms.reimbursement.model.po.Reimbursement;
import com.wtkj.rms.reimbursement.model.vo.ReimbursementVo;
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
	public List<Reimbursement> dataGrid(User user,ReimbursementVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Reimbursement t ";
		List<Reimbursement> l = reimbursementDao.find(hql
				+ whereHql(user,vo, params) + orderHql(ph), params, ph.getPage(),
				ph.getRows());

		return l;
	}

	@Override
	public List<Reimbursement> findAll() {
		String hql = " from Reimbursement t ";
		List<Reimbursement> l = reimbursementDao.find(hql);

		return l;
	}

	@Override
	public Long count(User user,ReimbursementVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Reimbursement t ";
		return reimbursementDao.count(
				"select count(*) " + hql + whereHql(user,vo, params), params);
	}

	private String whereHql(User user, ReimbursementVo r, Map<String, Object> params) {
		String hql = "";
		if (r != null) {
			hql += " where 1=1 ";
			ProcessVo process = r.getProcess_vo();
			
			if(user != null){
				hql += " and t.process.applyUser.id = :userId";
				params.put("userId", user.getId());
			}
			
			if (process != null) {
				if (process.getState() != null) {
					hql += " and t.process.state = :state";
					params.put("state", process.getState());
				}

				if (process.getApplyUserId() != null && process.getApplyUserId() > 0) {
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", process.getApplyUserId());
				}
				
				if(!StringUtils.isEmpty(process.getApplyUserName())){
					hql += " and t.process.applyUser.name like :username";
					params.put("username", "%%"+process.getApplyUserName()+"%%");
				}
			}

			if (!StringUtils.isEmpty(r.getPlaceName())) {
				hql += " and t.place.description like :place";
				params.put("place", "%%" + r.getPlaceName() + "%%");

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
