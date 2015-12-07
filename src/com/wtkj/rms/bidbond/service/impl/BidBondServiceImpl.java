package com.wtkj.rms.bidbond.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.bidbond.model.BidBond;
import com.wtkj.rms.bidbond.model.BidBondVo;
import com.wtkj.rms.bidbond.service.BidBondServiceI;

@Service
public class BidBondServiceImpl implements BidBondServiceI {

	@Autowired
	private BaseDaoI<BidBond> bidBondDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(BidBondVo vo, HttpServletRequest request) {
		bidBondDao.save(toPo(vo));
	}

	@Override
	public void delete(Long id) {
		BidBond p = bidBondDao.get(BidBond.class, id);
		bidBondDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from BidBond where id in (" + ids + ")";
		try {
			bidBondDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(BidBondVo vo, HttpServletRequest request) {
		bidBondDao.update(toPo(vo));
	}

	@Override
	public BidBondVo get(Long id) {
		BidBond po = bidBondDao.get(BidBond.class, id);
		return toVo(po);
	}

	@Override
	public List<BidBondVo> dataGrid(BidBondVo BidBondVo, PageFilter ph) {
		List<BidBondVo> pl = new ArrayList<BidBondVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";
		List<BidBond> l = bidBondDao.find(hql + whereHql(BidBondVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (BidBond t : l) {
			BidBondVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<BidBondVo> findAll() {
		List<BidBondVo> pl = new ArrayList<BidBondVo>();
		String hql = " from BidBond t ";
		List<BidBond> l = bidBondDao.find(hql);
		for (BidBond t : l) {
			BidBondVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(BidBondVo vo) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";
		return bidBondDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	@Override
	public Long countByIdNumber(String idNumber, int type) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";

		// 缴号，退号
		if (!StringUtils.isEmpty(idNumber)) {
			hql += " where t.idNumber = :idNumber and t.type =:type";
			params.put("idNumber", idNumber);
			params.put("type", type);
		}
		return bidBondDao.count("select count(*) " + hql, params);
	}

	@Override
	public Long count(BidBondVo BidBondVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBond t ";
		return bidBondDao.count(
				"select count(*) " + hql + whereHql(BidBondVo, params), params);
	}

	private String whereHql(BidBondVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getId() != null && vo.getId() > 0) {
				hql += " and t.id = :id";
				params.put("id", vo.getId());
			}

			// 申请人ID查询
			if (vo.getApplierId() != null && vo.getApplierId() > 0) {
				hql += " and t.applier.id = :applierId";
				params.put("applierId", vo.getApplierId());
			}

			// 申请人姓名模糊查询
			if (!StringUtils.isEmpty(vo.getApplierName())) {
				hql += " and t.applier.name like :aName";
				params.put("aName", "%%" + vo.getApplierName() + "%%");
			}

			// 申请时间范围查询
			if (vo.getStartDT() != null && vo.getEndDT() != null) {
				hql += " and t.applyDT >= :startDT";
				hql += " and t.applyDT <= :endDT";
				params.put("startDT", vo.getStartDT());
				params.put("endDT", vo.getEndDT());
			} else if (vo.getStartDT() != null && vo.getEndDT() == null) {
				hql += " and t.applyDT >= :startDT";
				params.put("startDT", vo.getStartDT());
			} else if (vo.getStartDT() == null && vo.getEndDT() != null) {
				hql += " and t.applyDT <= :endDT";
				params.put("endDT", vo.getEndDT());
			}

			// 缴号，退号
			if (!StringUtils.isEmpty(vo.getIdNumber())) {
				hql += " and t.idNumber like :idNumber";
				params.put("idNumber", "%%" + vo.getIdNumber() + "%%");
			}

			// 项目名称
			if (!StringUtils.isEmpty(vo.getProjectName())) {
				hql += " and t.projectName like :pname";
				params.put("pname", "%%" + vo.getProjectName() + "%%");
			}

			// 类型，批量报销或者单独报销
			if (vo.getType() >= 0) {
				hql += " and t.type = :type";
				params.put("type", vo.getType());
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

	// vo to po
	private BidBond toPo(BidBondVo vo) {
		BidBond po = new BidBond();
		BeanUtils.copyProperties(vo, po);
		po.setTotalFee(calTotal(po));
		if (vo.getApplierId() != null && vo.getApplierId() > 0) {
			Tuser applier = userDao.get(Tuser.class, vo.getApplierId());
			if (applier != null) {
				po.setApplier(applier);
			}
		}
		if (vo.getHandlerId() != null && vo.getHandlerId() > 0) {
			Tuser handler = userDao.get(Tuser.class, vo.getHandlerId());
			if (handler != null) {
				po.setHandler(handler);
			}
		}
		if (vo.getHandlerId2() != null && vo.getHandlerId2() > 0) {
			Tuser handler = userDao.get(Tuser.class, vo.getHandlerId2());
			if (handler != null) {
				po.setHandler2(handler);
			}
		}
		return po;
	}

	// po to vo
	private BidBondVo toVo(BidBond po) {
		BidBondVo vo = new BidBondVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getApplier() != null) {
			Tuser applier = userDao.get(Tuser.class, po.getApplier().getId());
			vo.setApplierId(applier.getId());
			vo.setApplierName(applier.getName());
			vo.setApplierPhone(applier.getMobilePhone());
		}

		if (po.getHandler() != null) {
			Tuser handler = userDao.get(Tuser.class, po.getHandler().getId());
			vo.setHandlerId(handler.getId());
			vo.setHandlerName(handler.getName());
		}

		if (po.getHandler2() != null) {
			Tuser handler = userDao.get(Tuser.class, po.getHandler2().getId());
			vo.setHandlerId2(handler.getId());
			vo.setHandlerName2(handler.getName());
		}

		if (!StringUtils.isEmpty(po.getBidSection())) {
			vo.setBdNames(getDicTexts(po.getBidSection()));
		}

		return vo;
	}

	@Override
	public long countAll(int type) {
		// 根据类型获取总数
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select count(*) from BidBond t where t.type = :type";
		params.put("type", type);
		return bidBondDao.count(hql, params);
	}

	@Override
	public long countAll(int type, String idNumber) {
		// 根据类型获取总数
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select count(*) from BidBond t where t.type=:type and t.idNumber like :idNumber";
		params.put("type", type);
		params.put("idNumber", idNumber + "%%");
		return bidBondDao.count(hql, params);
	}

	@Override
	public Long countByState(int state) {
		return bidBondDao.count("select count(*) from BidBond t where t.state="
				+ state);
	}

	private double calTotal(BidBond p) {
		double lfee = p.getLuFee() == null ? 0 : p.getLuFee();
		double zsfee = p.getZsFee() == null ? 0 : p.getZsFee();
		double zzfee = p.getZzFee() == null ? 0 : p.getZzFee();
		double bsfee = p.getBsFee() == null ? 0 : p.getBsFee();
		double ysfee = p.getYsFee() == null ? 0 : p.getYsFee();
		double h1fee = 0;
		double h2fee = 0;
		double h3fee = 0;

		if (!StringUtils.isEmpty(p.getHead1())) {
			h1fee = p.getHead1Fee() == null ? 0 : p.getHead1Fee();
		}
		if (!StringUtils.isEmpty(p.getHead2())) {
			h2fee = p.getHead2Fee() == null ? 0 : p.getHead2Fee();
		}
		if (!StringUtils.isEmpty(p.getHead3())) {
			h3fee = p.getHead3Fee() == null ? 0 : p.getHead3Fee();
		}
		double total = lfee + zsfee + zzfee + bsfee + ysfee + h1fee + h2fee
				+ h3fee;

		return total;
	}

	private String getDicTexts(String dicIds) {
		StringBuilder texts = new StringBuilder();
		List<Tdictionary> ds = dictionaryDao.findBySql(
				"select * from sys_dictionary where id in(" + dicIds + ")",
				Tdictionary.class);
		for (Tdictionary t : ds) {
			texts.append(t.getText() + ",");
		}
		if (texts.length() == 0) {
			return "";
		}
		return texts.substring(0, texts.length() - 1);
	}

}
