import { Component, OnInit } from '@angular/core';
import * as jwt_decode from "jwt-decode";

import { PostModel } from '../_models/postModel';
import { AlertService } from '../_services/alert.service';
import { PostService } from '../_services/post.service';

@Component({
  selector: 'app-posts',
  templateUrl: './posts.component.html',
  styleUrls: ['./posts.component.css']
})
export class PostsComponent implements OnInit {

  myPosts: PostModel[];

  constructor(
    private alertService: AlertService,
    private postService: PostService
    ) { }

  ngOnInit() {
    this.getMyPosts();
  }

  getMyPosts(){
    this.postService.getMyPosts()
    .subscribe(
      data =>{
        this.myPosts = data;
      },
      error =>{
        this.alertService.error(error);
      }
    );
  }
}
