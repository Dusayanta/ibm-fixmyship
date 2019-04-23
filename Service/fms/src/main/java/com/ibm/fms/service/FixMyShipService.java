package com.ibm.fms.service;

import java.util.List;

import com.ibm.fms.model.Like;
import com.ibm.fms.model.Post;
import com.ibm.fms.model.Tag;

public interface FixMyShipService {
	List<Post> getAllPosts();
	boolean addPost(Post post);
	boolean updatePost(Post post);
	boolean deletePost(int id);
	
	//Debo part-- Like count:
	int addLike(Like like);
	String maxLike();
	List getLike();
	
	List<Tag> getAllTags();
}
