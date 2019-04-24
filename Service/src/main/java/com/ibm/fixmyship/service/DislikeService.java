package com.ibm.fixmyship.service;

import java.util.List;

import com.ibm.fixmyship.model.Dislike;

public interface DislikeService {

	Dislike save(Dislike disLike);
	
	Boolean existsByCidAndUid(Long cid, Long uid);
	
	Long deleteByCidAndUid(Long cid, Long uid);
	
	List<Long> findCidByUid(Long uid);
}
