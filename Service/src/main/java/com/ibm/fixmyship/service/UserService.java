package com.ibm.fixmyship.service;

import java.util.List;
import java.util.Optional;

import com.ibm.fixmyship.model.User;

public interface UserService {

	User save(User user);
	
	Optional<User> findByEmail(String email);

    Optional<User> findByUsernameOrEmail(String username, String email);
    
    Optional<User> findById(Long id);

    List<User> findByIdIn(List<Long> userIds);

    Optional<User> findByUsername(String username);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}
