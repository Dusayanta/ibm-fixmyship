package com.ibm.fms.service;

import java.util.List;

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
	public boolean deletePost(int pId) {
		fmsDAO.delete(fmsDAO.findById(pId).get());
		return true;
	}

	@Override
	public boolean updatePost(Post post) {
		fmsDAO.save(post);
		return true;
	}	
}
