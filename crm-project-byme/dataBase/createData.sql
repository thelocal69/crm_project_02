CREATE DATABASE account;

USE account;

CREATE TABLE role(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	role_id int NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

CREATE TABLE userdetail(
	user_id int PRIMARY KEY,
	avatar varchar(255) NOT NULL,
	firstname varchar(255) NOT NULL,
	lastname varchar(255) NOT NULL,
	username varchar(255) NOT NULL,
	fullname varchar(255) NOT NULL,
	phone varchar(10) NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

ALTER TABLE user ADD CONSTRAINT fk_roleid_user FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE userdetail ADD CONSTRAINT fk_userid_userdetail FOREIGN KEY (user_id) REFERENCES user(id);

CREATE TABLE status (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

CREATE TABLE project(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	starteddate timestamp,
	endeddate timestamp,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

CREATE TABLE job (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	content text NOT NULL,
	starteddate timestamp,
	endeddate timestamp,
	project_id int NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp
);

ALTER TABLE job ADD CONSTRAINT fk_projectid_job FOREIGN KEY (project_id) REFERENCES project(id);

CREATE TABLE job_status_user (
	user_id int NOT NULL,
	status_id int NOT NULL,
	job_id int NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp,
	
	PRIMARY KEY(user_id, status_id, job_id)
);

ALTER TABLE job_status_user ADD CONSTRAINT fk_userid_jobstatususer FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE job_status_user ADD CONSTRAINT fk_statusid_jobstatususer FOREIGN KEY (status_id) REFERENCES status(id);
ALTER TABLE job_status_user ADD CONSTRAINT fk_jobid_jobstatususer FOREIGN KEY (job_id) REFERENCES job(id);

CREATE TABLE project_user (
	user_id int NOT NULL,
	project_id int NOT NULL,
	createdby varchar(255),
	createddate timestamp,
	modifiedby varchar(255),
	modifieddate timestamp,
	
	PRIMARY KEY(user_id, project_id)
);

ALTER TABLE project_user ADD CONSTRAINT fk_userid_projectuser FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE project_user ADD CONSTRAINT fk_projectid_projectuser FOREIGN KEY (project_id) REFERENCES project(id);