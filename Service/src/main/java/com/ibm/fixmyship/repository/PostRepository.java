package com.ibm.fixmyship.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
	List<Post> findByUidNotIn(List<Long> userIds);
	List<Post> findByUidIn(List<Long> userIds);
}
