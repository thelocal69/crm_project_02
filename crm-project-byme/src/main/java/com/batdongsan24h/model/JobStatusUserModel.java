package com.batdongsan24h.model;

import com.batdongsan24h.model.exte.AbstractModel;

public class JobStatusUserModel extends AbstractModel {
	private Integer userId;
	private Integer statusId;
	private Integer jobId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

}