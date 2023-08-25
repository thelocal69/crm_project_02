package com.batdongsan24h.model;

import com.batdongsan24h.model.exte.AbstractModel;
import com.google.protobuf.Timestamp;

public class ProjectModel extends AbstractModel{
	private String name;
	private java.sql.Timestamp startedDate;
	private Timestamp endedDate;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

}
