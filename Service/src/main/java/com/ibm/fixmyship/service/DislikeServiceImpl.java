package com.ibm.fixmyship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.Dislike;
import com.ibm.fixmyship.repository.DislikeRepository;

@Service
public class DislikeServiceImpl implements DislikeService {

	@Autowired
	DislikeRepository dislikeRepo;
	
	@Override
	public Dislike save(Dislike disLike) {
		return dislikeRepo.save(disLike);
	}

	@Override
	public Boolean existsByCidAndUid(Long cid, Long uid) {
		return dislikeRepo.existsByCidAndUid(cid, uid);
	}

	@Override
	public Long deleteByCidAndUid(Long cid, Long uid) {
		return dislikeRepo.deleteByCidAndUid(cid, uid);
	}

	@Override
	public List<Long> findCidByUid(Long uid) {
		return dislikeRepo.findCidByUid(uid);
	}

}
