package com.ibm.fms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import com.ibm.fms.model.DisLike;
import com.ibm.fms.model.Like;
import com.ibm.fms.model.Post;

public interface FixMyShipService {
	List<Post> getAllPosts();
	boolean addPost(Post post);
	Optional<Post> findPost(int id);
	
//Debo part-- Like count:
	int addLike(Like like);
	String maxLike();
	List<Object[]> getLike();
	//int addDisLike(DisLike dislike, Like like);
	int addDisLike(DisLike dislike);
	
}
