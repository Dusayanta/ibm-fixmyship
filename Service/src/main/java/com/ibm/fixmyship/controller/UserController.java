package com.ibm.fixmyship.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.fixmyship.payload.UserIdentityAvailability;
import com.ibm.fixmyship.payload.UserSummary;
import com.ibm.fixmyship.security.CurrentUser;
import com.ibm.fixmyship.security.UserPrincipal;
import com.ibm.fixmyship.service.UserService;

@RestController
@RequestMapping("/api")
public class UserController {
	
	@Autowired
    private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@GetMapping("/status")
	public String status() {
		return "Services accessible after login";
	}

    @GetMapping("/user/me")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<UserSummary> getCurrentUser(@CurrentUser UserPrincipal currentUser) {
        UserSummary userSummary = new UserSummary(currentUser.getId(), currentUser.getUsername(), currentUser.getFirstname(), currentUser.getLastname(), currentUser.getEmail(), currentUser.getGender(), currentUser.getBadgeValue());
        return new ResponseEntity<>(userSummary, HttpStatus.OK);
    }
    
    @GetMapping("/user/checkUsernameAvailability")
    public UserIdentityAvailability checkUsernameAvailability(@RequestParam(value = "username") String username) {
        Boolean isAvailable = !userService.existsByUsername(username);
        return new UserIdentityAvailability(isAvailable);
    }

    @GetMapping("/user/checkEmailAvailability")
    public UserIdentityAvailability checkEmailAvailability(@RequestParam(value = "email") String email) {
        Boolean isAvailable = !userService.existsByEmail(email);
        return new UserIdentityAvailability(isAvailable);
    }
    
    @GetMapping("/user/badge/{uid}")
    public ResponseEntity<?> getBadgeValue(@PathVariable Long uid){
    	Long badgeValue = userService.findBadgeValueByUid(uid);
    	List<Long> badgeValueList = new ArrayList<>();
    	badgeValueList.add(badgeValue);
    	return new ResponseEntity<>(badgeValueList, HttpStatus.OK);
    }
}
