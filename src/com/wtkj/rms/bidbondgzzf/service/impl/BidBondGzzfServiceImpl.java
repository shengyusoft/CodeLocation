package com.wtkj.rms.bidbondgzzf.service.impl;

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
import com.wtkj.rms.bidbondgzzf.model.BidBondGzzf;
import com.wtkj.rms.bidbondgzzf.model.BidBondGzzfVo;
import com.wtkj.rms.bidbondgzzf.service.BidBondGzzfServiceI;

@Service
public class BidBondGzzfServiceImpl implements BidBondGzzfServiceI {

	@Autowired
	private BaseDaoI<BidBondGzzf> bidBondGzzfDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(BidBondGzzfVo vo, HttpServletRequest request) {
		bidBondGzzfDao.save(toPo(vo));
	}

	@Override
	public void delete(Long id) {
		BidBondGzzf p = bidBondGzzfDao.get(BidBondGzzf.class, id);
		bidBondGzzfDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from BidBondGzzf where id in (" + ids + ")";
		try {
			bidBondGzzfDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(BidBondGzzfVo vo, HttpServletRequest request) {
		bidBondGzzfDao.update(toPo(vo));
	}

	@Override
	public BidBondGzzfVo get(Long id) {
		BidBondGzzf po = bidBondGzzfDao.get(BidBondGzzf.class, id);
		return toVo(po);
	}

	@Override
	public List<BidBondGzzfVo> dataGrid(BidBondGzzfVo BidBondVo, PageFilter ph) {
		List<BidBondGzzfVo> pl = new ArrayList<BidBondGzzfVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBondGzzf t ";
		List<BidBondGzzf> l = bidBondGzzfDao.find(hql + whereHql(BidBondVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (BidBondGzzf t : l) {
			BidBondGzzfVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<BidBondGzzfVo> findAll() {
		List<BidBondGzzfVo> pl = new ArrayList<BidBondGzzfVo>();
		String hql = " from BidBondGzzf t ";
		List<BidBondGzzf> l = bidBondGzzfDao.find(hql);
		for (BidBondGzzf t : l) {
			BidBondGzzfVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(BidBondGzzfVo vo) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBondGzzf t ";
		return bidBondGzzfDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}
	
	@Override
	public Long countByIdNumber(String idNumber) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBondGzzf t ";
		
		//缴号，退号
		if (!StringUtils.isEmpty(idNumber)) {
			hql += " where t.idNumber = :idNumber";
			params.put("idNumber", idNumber);
		}
		return bidBondGzzfDao.count(
				"select count(*) " + hql, params);
	}

	@Override
	public Long count(BidBondGzzfVo BidBondVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from BidBondGzzf t ";
		return bidBondGzzfDao.count(
				"select count(*) " + hql + whereHql(BidBondVo, params), params);
	}

	private String whereHql(BidBondGzzfVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getId() != null && vo.getId() > 0) {
				hql += " and t.id = :id";
				params.put("id", vo.getId());
			}

			//申请人ID查询
			if (vo.getApplierId() != null && vo.getApplierId() > 0) {
				hql += " and t.applier.id = :applierId";
				params.put("applierId", vo.getApplierId());
			}

			//申请人姓名模糊查询
			if (!StringUtils.isEmpty(vo.getApplierName())) {
				hql += " and t.applier.name like :aName";
				params.put("aName", "%%" + vo.getApplierName() + "%%");
			}
			
			//申请时间范围查询
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
			
			//缴号，退号
			if (!StringUtils.isEmpty(vo.getIdNumber())) {
				hql += " and t.idNumber like :idNumber";
				params.put("idNumber", "%%" + vo.getIdNumber() + "%%");
			}
			
			//项目名称
			if (!StringUtils.isEmpty(vo.getProjectName())) {
				hql += " and t.projectName like :pname";
				params.put("pname", "%%" + vo.getProjectName() + "%%");
			}
			
			//类型，批量报销或者单独报销
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
	private BidBondGzzf toPo(BidBondGzzfVo vo) {
		BidBondGzzf po = new BidBondGzzf();
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
	private BidBondGzzfVo toVo(BidBondGzzf po) {
		BidBondGzzfVo vo = new BidBondGzzfVo();
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
		String hql = "select count(*) from BidBondGzzf t where t.type=:type";
		params.put("type", type);
		return bidBondGzzfDao.count(hql, params);
	}

	@Override
	public Long countByState(int state) {
		return bidBondGzzfDao.count("select count(*) from BidBondGzzf t where t.state="
				+ state);
	}

	private double calTotal(BidBondGzzf p) {
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
