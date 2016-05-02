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
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessHistory;
import com.wtkj.rms.process.model.ProcessVo;
import com.wtkj.rms.reimbursement.model.po.ReimbursementBatch;
import com.wtkj.rms.reimbursement.model.vo.ReimbursementBatchVo;
import com.wtkj.rms.reimbursement.service.ReimbursementBatchServiceI;

@Service
public class ReimbursementBatchServiceImpl implements
		ReimbursementBatchServiceI {

	@Autowired
	private BaseDaoI<ReimbursementBatch> reimbursementBatchDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Process> processDao;

	@Autowired
	private BaseDaoI<ProcessHistory> processHistoryDao;

	@Override
	public Long add(ReimbursementBatch r, HttpServletRequest request) {
		// 保存或者提交，保存对应的process以及processHistory
		return (Long) reimbursementBatchDao.save(r);
	}

	@Override
	public void delete(Long id) {
		ReimbursementBatch p = reimbursementBatchDao.get(
				ReimbursementBatch.class, id);
		// 删除对应的流程信息以及流程历史记录信息
		reimbursementBatchDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from ReimbursementBatch where id in (" + ids + ")";
		try {
			reimbursementBatchDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ReimbursementBatch r, HttpServletRequest request) {
		reimbursementBatchDao.saveOrUpdate(r);
	}

	@Override
	public ReimbursementBatch get(Long id) {
		ReimbursementBatch r = reimbursementBatchDao.get(
				ReimbursementBatch.class, id);
		return r;
	}

	@Override
	public List<ReimbursementBatch> dataGrid(User user,
			ReimbursementBatchVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ReimbursementBatch t ";
		List<ReimbursementBatch> l = reimbursementBatchDao.find(
				hql + whereHql(user, vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<ReimbursementBatch> findAll() {
		String hql = " from ReimbursementBatch t ";
		List<ReimbursementBatch> l = reimbursementBatchDao.find(hql);

		return l;
	}

	@Override
	public Long count(User user, ReimbursementBatchVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ReimbursementBatch t ";
		return reimbursementBatchDao.count(
				"select count(*) " + hql + whereHql(user, vo, params), params);
	}

	private String whereHql(User user, ReimbursementBatchVo r,
			Map<String, Object> params) {
		String hql = "";
		if (r != null) {
			hql += " where 1=1 ";
			ProcessVo process = r.getProcess_vo();

			if (user != null) {
				// 申请人查看自己申请的
				if (user.getRoleNames().indexOf("会计") >= 0) {
					// 如果申请人是别人则审批人查看已到到达自己的任务,如果是自己则显示申请人是自己的
					hql += " and (t.process.state >= :state or t.process.applyUser.id = :userId)";
					params.put("state", 1);
					params.put("userId", user.getId());
				} else if (user.getRoleNames().indexOf("总经理") >= 0) {
					hql += " and (t.process.state >= :state or t.locked=1 or t.process.applyUser.id = :userId)";
					params.put("userId", user.getId());
					params.put("state", 2);
				} else if (user.getRoleNames().indexOf("出纳") >= 0) {
					//TODO 如果是办理人自己的单子，，这里有问题，，需要在前台处理下用状体处理
					hql += " and (t.process.state >= :state or t.process.applyUser.id = :userId)";
					params.put("userId", user.getId());
					params.put("state", 3);
				} else if(!"admin".equals(user.getName())) {
					//其他类型都视为普通员工
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", user.getId());
				}
			}

			if (process != null) {
				if (process.getState() != null) {
					hql += " and t.process.state = :state";
					params.put("state", process.getState());
				}

				if (process.getApplyUserId() != null
						&& process.getApplyUserId() > 0) {
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", process.getApplyUserId());
				}

				if (!StringUtils.isEmpty(process.getApplyUserName())) {
					hql += " and t.process.applyUser.name like :username";
					params.put("username", "%%" + process.getApplyUserName()
							+ "%%");
				}
			}

			// 批量查询按月份查
			if (r.getMonth() != null) {
				hql += " and t.month = :month";
				params.put("month", r.getMonth());
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

}
