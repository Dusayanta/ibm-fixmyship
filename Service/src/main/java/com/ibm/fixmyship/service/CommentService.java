package com.ibm.fixmyship.service;

import java.util.List;

import com.ibm.fixmyship.model.Comment;

public interface CommentService {

	Comment save(Comment comment);
	
	List<Comment> findByPid(Long pid);
}
