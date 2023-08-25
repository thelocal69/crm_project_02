package com.batdongsan24h.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.batdongsan24h.mapper.impl.RowMapper;
import com.batdongsan24h.model.JobModel;

public class JobMMapper implements RowMapper<JobModel> {

	@Override
	public JobModel mapRow(ResultSet rs) {
		try {
			JobModel jobModel = new JobModel();
			jobModel.setId(rs.getInt("id"));
			jobModel.setName(rs.getString("name"));
			jobModel.setContent(rs.getString("content"));
			jobModel.setStartedDate(rs.getTimestamp("starteddate"));
			jobModel.setCreatedBy(rs.getString("createdby"));
			jobModel.setCreatedDate(rs.getTimestamp("createddate"));
			if (jobModel.getModifiedBy() != null) {
				jobModel.setModifiedBy(rs.getString("modifiedby"));
			}
			if (jobModel.getModifiedDate() != null) {
				jobModel.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			return jobModel;
		} catch (SQLException e) {
			return null;
		}
	}
}