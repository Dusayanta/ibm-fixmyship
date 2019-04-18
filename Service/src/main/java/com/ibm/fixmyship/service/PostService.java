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
}
