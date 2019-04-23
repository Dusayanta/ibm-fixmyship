package com.ibm.fms.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.DisLike;

public interface FixMyShipDisLikeDAO extends JpaRepository<DisLike, Integer> {
	
}

