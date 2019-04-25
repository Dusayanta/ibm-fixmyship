package com.ibm.fixmyship.service;

import java.util.List;


import com.ibm.fixmyship.model.Comment;

public interface CommentService {
	
	Comment findById(Long id);

	Comment save(Comment comment);
	
	List<Comment> findByPid(Long pid);
	
	List<Long> findLikeAndDislikeCountByCid(Long cid);
}
