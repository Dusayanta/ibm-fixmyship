package com.ibm.fms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comments")
public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="description")
	private String description;
	
	@Column(name="uid")
	private int uid;
	
	@Column(name="pid")
	private int pid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
	

}
