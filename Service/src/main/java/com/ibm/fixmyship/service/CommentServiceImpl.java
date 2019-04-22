package com.ibm.fixmyship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.Comment;
import com.ibm.fixmyship.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentRepository commentRepo;

	@Override
	public Comment save(Comment comment) {
		return commentRepo.save(comment);
	}

	@Override
	public List<Comment> findByPid(Long pid) {
		return commentRepo.findByPid(pid);
	}
	
	
}
