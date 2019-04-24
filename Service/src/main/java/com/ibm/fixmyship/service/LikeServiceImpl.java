package com.ibm.fixmyship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.Like;
import com.ibm.fixmyship.repository.LikeRepository;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeRepository likeRepo;

	@Override
	public Like save(Like like) {
		return likeRepo.save(like);
	}

	@Override
	public Boolean existsByCidAndUid(Long cid, Long uid) {
		return likeRepo.existsByCidAndUid(cid, uid);
	}

	@Override
	public Long deleteByCidAndUid(Long cid, Long uid) {
		return likeRepo.deleteByCidAndUid(cid, uid);
	}

	@Override
	public List<Like> findByUid(Long uid) {
		return likeRepo.findByUid(uid);
	}

	@Override
	public List<Long> findCidByUid(Long uid) {
		return likeRepo.findCidByUid(uid);
	}

}
