package com.ibm.fixmyship.service;

import java.util.List;
import java.util.Optional;

import com.ibm.fixmyship.model.Post;

public interface PostService {

	List<Post> getAllPosts();
	
	Post save(Post post);
	
	Optional<Post> findById(Long id);
	
	List<Post> findByUidNotIn(List<Long> userIds);
	
	List<Post> findByUidIn(List<Long> userIds);
	
	Post findByIdAndUid(Long id, Long uid);
	
	Post getOne(Long id);
	
	List<Post> findAllByOrderByCreatedAtDesc();
	
	List<Post> findByUidNotInOrderByCreatedAtDesc(List<Long> userIds);
	
	List<Post> findByUidInOrderByCreatedAtDesc(List<Long> userIds);
}
