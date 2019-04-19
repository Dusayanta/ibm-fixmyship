package com.ibm.fixmyship.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.fixmyship.model.Post;
import com.ibm.fixmyship.security.CurrentUser;
import com.ibm.fixmyship.security.UserPrincipal;
import com.ibm.fixmyship.service.PostService;
import com.ibm.fixmyship.service.UserService;

@RestController
@RequestMapping("/api/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping
	public ResponseEntity<List<Post>> getAllPosts(){
		List<Post> list = postService.getAllPosts();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Post> findPost(@PathVariable Long id){
		Optional<Post> post = postService.findById(id);
		if(post.isPresent()) {
			return new ResponseEntity<>(post.get(),HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);		
	}
	
	@PostMapping
	public ResponseEntity<?> addPost(@RequestBody Post post, @CurrentUser UserPrincipal currentUser){
		System.out.println(currentUser.getId());
		post.setUid(currentUser.getId());
		Post gotPost = postService.save(post);
		if(gotPost == null) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(gotPost, HttpStatus.CREATED);
	}
	
	@GetMapping("/others")
	public ResponseEntity<?> getPostByOthers(@CurrentUser UserPrincipal currentUser){
		List<Long> userIds = new ArrayList<>();
		userIds.add(currentUser.getId());
		List<Post> postByOthers = postService.findByUidNotIn(userIds);
		if(postByOthers.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(postByOthers, HttpStatus.OK);
	}
	
	@GetMapping("/my")
	public ResponseEntity<?> getMyPosts(@CurrentUser UserPrincipal currentUser){
		List<Long> userIds = new ArrayList<>();
		userIds.add(currentUser.getId());
		List<Post> postByOthers = postService.findByUidIn(userIds);
		if(postByOthers.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(postByOthers, HttpStatus.OK);
	}
}
