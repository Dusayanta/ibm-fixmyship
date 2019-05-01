package com.ibm.fixmyship.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
	
	List<Post> findByUidNotIn(List<Long> userIds);
	
	List<Post> findByUidIn(List<Long> userIds);
	
	Post findByIdAndUid(Long id, Long uid);
	
	List<Post> findAllByOrderByCreatedAtDesc();
	
	List<Post> findByUidNotInOrderByCreatedAtDesc(List<Long> userIds);
	
	List<Post> findByUidInOrderByCreatedAtDesc(List<Long> userIds);
}
