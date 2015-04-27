package com.wtkj.rms.code.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.vo.ContractVo;
import com.wtkj.rms.code.service.ContractServiceI;

@Service
public class ContractServiceImpl implements ContractServiceI {

	@Autowired
	private BaseDaoI<Contract> contractDao;

	@Autowired
	private BaseDaoI<Project> projectDao;

	@Autowired
	private BaseDaoI<Merchant> merchantDao;

	@Override
	public void add(ContractVo vo, HttpServletRequest request) {
		Contract po = vo.toPo(merchantDao, projectDao);
		contractDao.save(po);
	}

	@Override
	public void delete(Long id) {
		Contract p = contractDao.get(Contract.class, id);
		contractDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from CM_Contract where id in (" + ids + ")";
		try {
			contractDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ContractVo vo, HttpServletRequest request) {
		Contract po = vo.toPo(merchantDao, projectDao);
		contractDao.update(po);
	}

	@Override
	public ContractVo get(Long id) {
		ContractVo vo = new ContractVo();
		Contract po = contractDao.get(Contract.class, id);
		vo = po.toVo();
		return vo;

	}

	@Override
	public List<ContractVo> dataGrid(ContractVo vo, PageFilter ph) {
		List<ContractVo> pl = new ArrayList<ContractVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Contract t ";
		List<Contract> l = contractDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Contract t : l) {
			ContractVo p = t.toVo();
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<ContractVo> findAll() {
		List<ContractVo> pl = new ArrayList<ContractVo>();
		String hql = " from Contract t ";
		List<Contract> l = contractDao.find(hql);
		if (l != null && l.size() > 0) {
			for (Contract t : l) {
				ContractVo p = t.toVo();
				pl.add(p);
			}

		}
		return pl;
	}

	@Override
	public Long count(ContractVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Contract t ";
		return contractDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(ContractVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}
			if (!StringUtils.isEmpty(vo.getCode())) {
				hql += " and t.code like :code";
				params.put("code", "%%" + vo.getCode() + "%%");
			}

			if (!StringUtils.isEmpty(vo.getSignDT())) {
				hql += " and t.signTime = :singTime";
				Date date = null;
				try {
					date = DateUtil.convertStringToDate("yyyy-MM-dd",
							vo.getSignDT());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if (date != null) {
					params.put("singTime", date);
				}
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
	public List<Contract> checkRelate(String ids) {
		String sql = "select distinct c.* from CM_Contract c "
				+ "left join DM_Task t on t.contractId = c.id "
				+ "where t.contractId is not null and c.id in(" + ids + ")";
		
		List<Contract> contracts = null;

		try {
			contracts = contractDao.findBySql(sql, Contract.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return contracts;
	}

}
