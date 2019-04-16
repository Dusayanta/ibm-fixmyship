package com.ibm.fms.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ibm.fms.model.Comment;

public interface FixMyShipCommentsDAO extends JpaRepository<Comment, Integer>{

}
