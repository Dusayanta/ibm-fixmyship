package com.ibm.fms.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.Tag;

public interface FixMyShipTagDAO extends JpaRepository<Tag,Integer>{

}
