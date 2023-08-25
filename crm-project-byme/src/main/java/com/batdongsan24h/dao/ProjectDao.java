package com.batdongsan24h.dao;

import java.util.List;

import com.batdongsan24h.dao.impl.AbstractDao;
import com.batdongsan24h.dao.impl.IProjectDao;
import com.batdongsan24h.mapper.ProjectMapper;
import com.batdongsan24h.model.ProjectModel;

public class ProjectDao extends AbstractDao<ProjectModel> implements IProjectDao{

	@Override
	public List<ProjectModel> findAll() {
		String sql = "SELECT * FROM project";
		return query(sql, new ProjectMapper());
	}

	@Override
	public Integer save(ProjectModel projectModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO project");
		sql.append(" (name, starteddate, endeddate)");
		sql.append(" VALUES (?, ?, ?)");
		return insert(sql.toString(), projectModel.getName(), projectModel.getStartedDate(), projectModel.getEndedDate());
	}

	@Override
	public void update(ProjectModel projectModel) {
		
	}

	@Override
	public void delete(Integer id) {
		
	}
	
}
