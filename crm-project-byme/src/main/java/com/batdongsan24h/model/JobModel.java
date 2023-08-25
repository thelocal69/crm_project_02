package com.batdongsan24h.model;

import com.batdongsan24h.model.exte.AbstractModel;
import com.google.protobuf.Timestamp;

public class JobModel extends AbstractModel{
	private String name;
	private String content;
	private java.sql.Timestamp startedDate;
	private Timestamp endedDate;
	private Integer projectId;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Timestamp getStartedDate() {
		return startedDate;
	}

	public void setStartedDate(java.sql.Timestamp timestamp) {
		this.startedDate = timestamp;
	}

	public Timestamp getEndedDate() {
		return endedDate;
	}

	public void setEndedDate(Timestamp endedDate) {
		this.endedDate = endedDate;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}


}
