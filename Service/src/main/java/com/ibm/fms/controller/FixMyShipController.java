package com.ibm.fms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.fms.model.Like;
import com.ibm.fms.model.Post;
import com.ibm.fms.service.FixMyShipService;

@RestController
@CrossOrigin(origins = "*")
public class FixMyShipController {
	
	@Autowired
	private FixMyShipService fmsService;
	
	@GetMapping("status")
	public ResponseEntity<String> status(){
		return new ResponseEntity<>("Service is up and running", HttpStatus.OK);
	}
	
	@GetMapping("post")
	public ResponseEntity<List<Post>> getAllPosts(){
		List<Post> list = fmsService.getAllPosts();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("post/{id}")
	public ResponseEntity<Post> findPost(@PathVariable int id){
		Optional<Post> post = fmsService.findPost(id);
		if(post.isPresent()) {
			return new ResponseEntity<>(post.get(),HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);		
	}
	
	@PostMapping("post")
	public ResponseEntity<Void> addPost(@RequestBody Post post){
		boolean flag = fmsService.addPost(post);
		if(!flag) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
// 	Like
	
	@PostMapping("comment/like")
	public ResponseEntity<Void> addLike(@RequestBody Like like){
		int flag = fmsService.addLike(like);
		//List mxl=fmsService.maxLike();
		//System.out.println("max like "+mxl);
		//System.out.println("Like" +like.getUid());
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@GetMapping("mostlike")
	public ResponseEntity<?> mostLike(){
		String mxl=fmsService.maxLike();
		List mxll=new ArrayList();
		mxll.add(mxl);
		System.out.println("max like "+mxl+" list is:  "+mxll);
		//System.out.println("Like" +like.getUid());
		//return mxl;
		return new ResponseEntity<>(mxll, HttpStatus.OK);
	}
	
		
	@GetMapping("likes")
	public ResponseEntity<?> getLikes(){
		List countl=fmsService.getLike();
		System.out.println("Counts: "+countl);
		return new ResponseEntity<>(countl, HttpStatus.OK);
		//return countl;
	}
	
}