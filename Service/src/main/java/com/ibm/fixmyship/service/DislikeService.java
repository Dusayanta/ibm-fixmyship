package com.ibm.fixmyship.service;

import com.ibm.fixmyship.model.Dislike;

public interface DislikeService {

	Dislike save(Dislike disLike);
	
	Boolean existsByCidAndUid(Long cid, Long uid);
	
	Long deleteByCidAndUid(Long cid, Long uid);
}
