package com.ibm.fms.service;

import java.util.List;

import com.ibm.fms.model.Post;

public interface FixMyShipService {
	List<Post> getAllPosts();
	boolean addPost(Post post);
	boolean updatePost(Post post);
	boolean deletePost(int id);
}
