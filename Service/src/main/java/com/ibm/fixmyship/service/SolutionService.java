package com.ibm.fixmyship.service;

import java.util.List;

import com.ibm.fixmyship.model.Solution;

public interface SolutionService {
	
	Solution save(Solution solution);
	
	List<Long> findCidByPid(Long pid);
}
