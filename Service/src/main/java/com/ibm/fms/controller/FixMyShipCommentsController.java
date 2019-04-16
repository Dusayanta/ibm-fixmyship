package com.ibm.fms.controller;

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

import com.ibm.fms.model.Comment;
import com.ibm.fms.model.Post;
import com.ibm.fms.service.FixMyShipService;

@RestController
@CrossOrigin(origins = "*")
public class FixMyShipCommentsController {
	
	@Autowired
	private FixMyShipService fmsService;
	
//	@GetMapping("status")
//	public ResponseEntity<String> status(){
//		return new ResponseEntity<>("Service is up and running", HttpStatus.OK);
//	}
	
	@GetMapping("comment")
	public ResponseEntity<List<Comment>> getAllComments(){
		List<Comment> list = fmsService.getAllComments();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("comment/{id}")
	public ResponseEntity<Comment> findComment(@PathVariable int id){
		Optional<Comment> comment = fmsService.findComment(id);
		if(comment.isPresent()) {
			return new ResponseEntity<>(comment.get(),HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);		
	}
	
	@PostMapping("comment")
	public ResponseEntity<Void> addComment(@RequestBody Comment comment){
		boolean flag = fmsService.addComment(comment);
		if(!flag) {
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
}