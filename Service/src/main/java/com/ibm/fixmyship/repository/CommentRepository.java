package com.ibm.fixmyship.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>{

	List<Comment> findByPid(Long pid);
	
	@Query("select c.likeCount, c.dislikeCount from Comment c where c.id = ?1")
	List<Long> findLikeAndDislikeCountByCid(Long cid);
	
}
