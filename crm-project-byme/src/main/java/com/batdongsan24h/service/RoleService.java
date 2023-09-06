package com.batdongsan24h.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.batdongsan24h.dao.impl.IRoleDao;
import com.batdongsan24h.model.RoleModel;
import com.batdongsan24h.service.impl.IRoleService;

public class RoleService implements IRoleService{
	
	@Inject
	private IRoleDao roleDao;

	@Override
	public List<RoleModel> findAll() {
		return roleDao.findAll();
	}

	@Override
	public RoleModel findOne(Integer id) {
		return roleDao.findOne(id);
	}

	@Override
	public RoleModel save(RoleModel saveRole) {
		saveRole.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		roleDao.save(saveRole);
		return saveRole;
	}

	@Override
	public RoleModel update(RoleModel updateRole) {
		RoleModel oldRole = roleDao.findOne(updateRole.getId());
		updateRole.setCreatedBy(oldRole.getCreatedBy());
		updateRole.setCreatedDate(oldRole.getCreatedDate());
		updateRole.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		roleDao.update(updateRole);
		return updateRole;
	}

	@Override
	public void deleteById(Integer id) {
		this.roleDao.deleteById(id);
	}

}
