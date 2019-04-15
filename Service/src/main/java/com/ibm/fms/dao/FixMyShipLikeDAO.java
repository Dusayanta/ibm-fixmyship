package com.ibm.fms.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.Like;

public interface FixMyShipLikeDAO extends JpaRepository<Like, Integer> {
	
}

