package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.ServiceException;
import com.wtkj.common.Tree;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Organization;
import com.wtkj.common.model.Torganization;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.service.OrganizationServiceI;

@Service
public class OrganizationServiceImpl implements OrganizationServiceI {
	
	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Torganization> organizationDao;

	@Override
	public List<Organization> treeGrid() {
		List<Organization> lr = new ArrayList<Organization>();
		List<Torganization> l = organizationDao
				.find("from Torganization t left join fetch t.organization  order by t.seq");
		if ((l != null) && (l.size() > 0)) {
			for (Torganization t : l) {
				Organization r = new Organization();
				BeanUtils.copyProperties(t, r);
				if (t.getOrganization() != null) {
					r.setPid(t.getOrganization().getId());
					r.setPname(t.getOrganization().getName());
				}
				r.setIconCls(t.getIcon());
				lr.add(r);
			}
		}
		return lr;
	}

	@Override
	public void add(Organization org) {
		Torganization t = new Torganization();
		BeanUtils.copyProperties(org, t);
		if ((org.getPid() != null) && !"".equals(org.getPid())) {
			t.setOrganization(organizationDao.get(Torganization.class, org.getPid()));
		}
		t.setCreatedatetime(new Date());
		organizationDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Torganization t = organizationDao.get(Torganization.class, id);
		del(t);
	}

	private void del(Torganization t) {
		List<Tuser> list = userDao.find("from Tuser t left join t.organization org where org.id="+t.getId());
		if(list!=null&&list.size()>0){
			throw new ServiceException("该部门已经被用户使用");
		}else{
			if ((t.getOrganizations() != null) && (t.getOrganizations().size() > 0)) {
				for (Torganization r : t.getOrganizations()) {
					del(r);
				}
			}
			organizationDao.delete(t);
		}
	}

	@Override
	public void edit(Organization r) {
		Torganization t = organizationDao.get(Torganization.class, r.getId());
		t.setCode(r.getCode());
		t.setIcon(r.getIcon());
		t.setName(r.getName());
		t.setAddress(r.getAddress());
		t.setSeq(r.getSeq());
		if ((r.getPid() != null) && !"".equals(r.getPid())) {
			t.setOrganization(organizationDao.get(Torganization.class, r.getPid()));
		}
		organizationDao.update(t);
	}

	@Override
	public Organization get(Long id) {
		Torganization t = organizationDao.get(Torganization.class, id);
		Organization r = new Organization();
		BeanUtils.copyProperties(t, r);
		if (t.getOrganization() != null) {
			r.setPid(t.getOrganization().getId());
			r.setPname(t.getOrganization().getName());
		}
		return r;
	}

	@Override
	public List<Tree> tree() {
		List<Torganization> l = null;
		List<Tree> lt = new ArrayList<Tree>();

		l = organizationDao.find("select distinct t from Torganization t order by t.seq");

		if ((l != null) && (l.size() > 0)) {
			for (Torganization r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				if (r.getOrganization() != null) {
					tree.setPid(r.getOrganization().getId().toString());
				}
				tree.setText(r.getName());
				tree.setIconCls(r.getIcon());
				lt.add(tree);
			}
		}
		return lt;
	}

}
