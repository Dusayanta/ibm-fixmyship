package com.ibm.fms.service;

import java.util.List;
import java.util.Optional;

import com.ibm.fms.model.Comment;
import com.ibm.fms.model.Post;

public interface FixMyShipService {
	List<Post> getAllPosts();
	boolean addPost(Post post);
	Optional<Post> findPost(int id);
	
	List<Comment> getAllComments();
	boolean addComment(Comment comment);
	Optional<Comment> findComment(int id);
}
