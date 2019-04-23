package com.ibm.fixmyship.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Dislike;

@Repository
public interface DislikeRepository extends JpaRepository<Dislike, Long> {

	Boolean existsByCidAndUid(Long cid, Long uid);
	
	@Transactional
	Long deleteByCidAndUid(Long cid, Long uid);
}
