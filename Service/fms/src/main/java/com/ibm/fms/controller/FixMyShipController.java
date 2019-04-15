package com.ibm.fms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ibm.fms.model.Post;
import com.ibm.fms.service.FixMyShipService;

@RestController
@CrossOrigin(value="*")
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
	
	@PostMapping("post")
	public ResponseEntity<Void> addPost(@RequestBody Post post){
		boolean flag = fmsService.addPost(post);
		if(!flag) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@PutMapping("post/{id}")
	public ResponseEntity<Void> updatePost(@RequestBody Post post,@PathVariable int id){
		post.setId(id);
		boolean flag = fmsService.updatePost(post);
		if(!flag) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
//	@PutMapping("post")
//	public ResponseEntity<Void> updatePost(@RequestBody Post post){
//		//post.setId(id);
//		boolean flag = fmsService.updatePost(post);
//		if(!flag) {
//			return new ResponseEntity<>(HttpStatus.CONFLICT);
//		}
//		return new ResponseEntity<>(HttpStatus.CREATED);
//	}

	
	@DeleteMapping("post/{id}")
	public ResponseEntity<Void> deletePost(@PathVariable int id)
	{
		boolean flag = fmsService.deletePost(id);
		if(!flag) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
}