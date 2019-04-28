package com.ibm.fixmyship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.Solution;
import com.ibm.fixmyship.repository.SolutionRepository;

@Service
public class SolutionServiceImpl implements SolutionService{

	@Autowired
	SolutionRepository solutionRepo;
	
	@Override
	public Solution save(Solution solution) {
		return solutionRepo.save(solution);
	}

	@Override
	public List<Long> findCidByPid(Long pid) {
		return solutionRepo.findCidByPid(pid);
	}

}
