package com.ibm.fixmyship.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Like;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long>{
	
	Boolean existsByCidAndUid(Long cid, Long uid);
	
	@Transactional
	Long deleteByCidAndUid(Long cid, Long uid);
	
	List<Like> findByUid(Long uid);
}
