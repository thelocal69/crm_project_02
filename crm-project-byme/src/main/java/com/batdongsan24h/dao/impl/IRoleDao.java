package com.batdongsan24h.dao.impl;

import java.util.List;

import com.batdongsan24h.model.RoleModel;

public interface IRoleDao {
	RoleModel findOneByName(String name);
	RoleModel findOne(Integer id);
	List<RoleModel> findAll();
	Integer save(RoleModel saveRole);
	void update(RoleModel updateRole);
	void deleteById(Integer id);
}
