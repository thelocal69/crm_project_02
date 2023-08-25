package com.batdongsan24h.service;

import java.util.List;

import javax.inject.Inject;

import com.batdongsan24h.dao.impl.IProjectDao;
import com.batdongsan24h.model.ProjectModel;
import com.batdongsan24h.service.impl.IProjectService;

public class ProjectService implements IProjectService{
	
	@Inject
	private IProjectDao projectDao;

	@Override
	public List<ProjectModel> findAll() {
		return projectDao.findAll();
	}

	@Override
	public ProjectModel save(ProjectModel projectModel) {
		projectModel.setCreatedDate(new java.sql.Timestamp(System.currentTimeMillis()));
		this.projectDao.save(projectModel);
		return projectModel;
	}

	@Override
	public ProjectModel update(ProjectModel projectModel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Void delete(Integer[] ids) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
