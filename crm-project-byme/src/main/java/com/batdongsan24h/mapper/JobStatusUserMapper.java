package com.batdongsan24h.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.batdongsan24h.mapper.impl.RowMapper;
import com.batdongsan24h.model.JobStatusUserModel;

public class JobStatusUserMapper implements RowMapper<JobStatusUserModel> {

	@Override
	public JobStatusUserModel mapRow(ResultSet rs) {
		try {
			JobStatusUserModel jobStatusUserModel = new JobStatusUserModel();
			jobStatusUserModel.setUserId(rs.getInt("user_id"));
			jobStatusUserModel.setStatusId(rs.getInt("status_id"));
			jobStatusUserModel.setJobId(rs.getInt("job_id"));
			jobStatusUserModel.setCreatedBy(rs.getString("createdby"));
			jobStatusUserModel.setCreatedDate(rs.getTimestamp("createddate"));
			if (jobStatusUserModel.getModifiedBy() != null) {
				jobStatusUserModel.setModifiedBy(rs.getString("modifiedby"));
			}
			if (jobStatusUserModel.getModifiedDate() != null) {
				jobStatusUserModel.setModifiedDate(rs.getTimestamp("modifieddate"));
			}
			return jobStatusUserModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
