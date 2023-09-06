package com.batdongsan24h.service.impl;

import java.util.List;

import com.batdongsan24h.model.RoleModel;

public interface IRoleService {
	List<RoleModel> findAll();
	RoleModel findOne(Integer id);
	RoleModel save(RoleModel saveRole);
	RoleModel update(RoleModel updateRole);
	void deleteById(Integer id);
}
