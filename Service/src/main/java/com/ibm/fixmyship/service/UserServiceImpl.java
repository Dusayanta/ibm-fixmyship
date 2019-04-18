package com.ibm.fixmyship.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fixmyship.model.User;
import com.ibm.fixmyship.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserRepository userRepo;
	
	@Override
	public User save(User user) {
		return userRepo.save(user);
	}

	@Override
	public Optional<User> findByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	@Override
	public Optional<User> findByUsernameOrEmail(String username, String email) {
		return userRepo.findByUsernameOrEmail(username, email);
	}

	@Override
	public List<User> findByIdIn(List<Long> userIds) {
		return userRepo.findByIdIn(userIds);
	}

	@Override
	public Optional<User> findByUsername(String username) {
		return userRepo.findByUsername(username);
	}

	@Override
	public Boolean existsByUsername(String username) {
		return userRepo.existsByUsername(username);
	}

	@Override
	public Boolean existsByEmail(String email) {
		return userRepo.existsByEmail(email);
	}

	@Override
	public Optional<User> findById(Long id) {
		return userRepo.findById(id);
	}

}
