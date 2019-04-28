package com.ibm.fixmyship.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.Post;
import com.ibm.fixmyship.repository.PostRepository;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostRepository postRepo;
	
	@Override
	public List<Post> getAllPosts() {
		return postRepo.findAll();
	}

	@Override
	public Post save(Post post) {
		return postRepo.save(post);
	}

	@Override
	public Optional<Post> findById(Long id) {
		return postRepo.findById(id);
	}

	@Override
	public List<Post> findByUidNotIn(List<Long> userIds) {
		return postRepo.findByUidNotIn(userIds);
	}

	@Override
	public List<Post> findByUidIn(List<Long> userIds) {
		return postRepo.findByUidIn(userIds);
	}

	@Override
	public Post findByIdAndUid(Long id, Long uid) {
		return postRepo.findByIdAndUid(id, uid);
	}

	@Override
	public Post getOne(Long id) {
		return postRepo.getOne(id);
	}

}
