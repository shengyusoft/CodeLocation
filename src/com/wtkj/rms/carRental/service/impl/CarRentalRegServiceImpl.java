package com.wtkj.rms.carRental.service.impl;

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
import com.wtkj.common.model.User;
import com.wtkj.rms.carRental.model.CarRentalReg;
import com.wtkj.rms.carRental.model.CarRentalRegVo;
import com.wtkj.rms.carRental.service.CarRentalRegServiceI;
import com.wtkj.rms.process.model.ProcessVo;

@Service
public class CarRentalRegServiceImpl implements CarRentalRegServiceI {

	@Autowired
	private BaseDaoI<CarRentalReg> carRentalRegDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<CarRentalReg> dataGrid(User user, CarRentalRegVo p,
			PageFilter ph) {
		Map params = new HashMap();
		String hql = " from CarRentalReg t ";
		List l = carRentalRegDao.find(hql + whereHql(user, p, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());
		return l;
	}

	public Long count(User user, CarRentalRegVo p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from CarRentalReg t ";
		return carRentalRegDao.count(
				"select count(*) " + hql + whereHql(user, p, params), params);
	}

	private String whereHql(User user, CarRentalRegVo p,
			Map<String, Object> params) {
		String hql = " where 1=1 ";
		if (p != null) {
			ProcessVo process = p.getProcess_vo();
			// 权限控制
			if (user != null) {
				// 申请人查看自己申请的
				if (user.getRoleNames().indexOf("综合部经理") >= 0) {
					// 如果申请人是别人则审批人查看已到到达自己的任务,如果是自己则显示申请人是自己的
					hql += " and (t.process.state = :state or t.process.applyUser.id = :userId)";
					params.put("state", 1);
					params.put("userId", user.getId());
				} else if (!"admin".equals(user.getName())
						&& !"总经理".equals(user.getName())) {
					// 其他的都视为普通员工
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", user.getId());
				}
			}

			// 按流程状态以及申请人查询
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

				if (p.getApplyStartDt() != null) {
					hql = hql + " and t.process.startDT >= :rentalTimeST";
					params.put("rentalTimeST", p.getApplyStartDt());
				}

				if (p.getApplyEndDt() != null) {
					hql = hql + " and t.process.startDT <= :rentalTimeET";
					params.put("rentalTimeET", p.getApplyEndDt());
				}
			}

			// 业务查询
			if (!(StringUtils.isEmpty(p.getApplicant()))) {
				hql = hql + " and t.usedName like :applicant";
				params.put("applicant", "%%" + p.getApplicant() + "%%");
			}

			if (p.getRentalTimeST() != null) {
				hql = hql + " and t.usedTime >= :rentalTimeST";
				params.put("rentalTimeST", p.getRentalTimeST());
			}

			if (p.getRentalTimeET() != null) {
				hql = hql + " and t.usedTime <= :rentalTimeET";
				params.put("rentalTimeET", p.getRentalTimeET());
			}
		}
		return hql;
	}

	public CarRentalReg get(Long id) {
		CarRentalReg crr = null;
		if (id != null && id > 0) {
			crr = carRentalRegDao.get(CarRentalReg.class, Long.valueOf(id));
		}
		return crr;
	}

	public Long add(CarRentalReg p, HttpServletRequest request) {
		return (Long) carRentalRegDao.save(p);
	}

	public void edit(CarRentalReg p, HttpServletRequest request) {
		this.carRentalRegDao.update(p);
	}

	public void delete(String ids) {
		String sqlids = "";
		if ((!(StringUtils.isEmpty(ids))) && (ids.length() > 0)) {
			String[] idArray = ids.split(",");
			if (idArray.length == 1)
				sqlids = "'" + idArray[0] + "'";
			else {
				for (int i = 0; i < idArray.length; ++i) {
					String id = idArray[i];
					sqlids = sqlids
							+ ((i == idArray.length - 1) ? "'" + id + "'"
									: new StringBuilder("'").append(id)
											.append("',").toString());
				}
			}
		}
		String sql = "delete from car_rental_reg where id in (" + sqlids + ")";
		this.carRentalRegDao.executeSql(sql);
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
}
