package com.ibm.fixmyship.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ibm.fixmyship.model.Solution;

@Repository
public interface SolutionRepository extends JpaRepository<Solution, Long>{

	@Query("select cid from Solution s where s.pid = ?1")
	List<Long> findCidByPid(Long pid);
}
