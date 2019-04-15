package com.ibm.fms.dao;

import org.hibernate.metamodel.model.convert.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.Post;
import com.ibm.fms.model.Like;

public interface FixMyShipDAO extends JpaRepository<Post, Integer> {
	
}

