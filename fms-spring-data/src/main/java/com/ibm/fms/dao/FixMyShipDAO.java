package com.ibm.fms.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.Post;

public interface FixMyShipDAO extends JpaRepository<Post, Integer> {
	
}
