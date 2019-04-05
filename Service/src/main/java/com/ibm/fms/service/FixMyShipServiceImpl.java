package com.ibm.fms.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fms.dao.FixMyShipDAO;
import com.ibm.fms.model.Post;

@Service
public class FixMyShipServiceImpl implements FixMyShipService {
	
	@Autowired
	private FixMyShipDAO fmsDAO;

	@Override
	public synchronized boolean addPost(Post post) {
		fmsDAO.save(post);
		return true;
	}

	@Override
	public List<Post> getAllPosts() {
		return fmsDAO.findAll();
	}

	@Override
	public Optional<Post> findPost(int id) {
		return fmsDAO.findById(id);
	}
	
}
