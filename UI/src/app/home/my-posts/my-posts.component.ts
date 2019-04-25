import { Component, OnInit } from '@angular/core';
import { PostModel } from 'src/app/_models/postModel';
import { AlertService } from 'src/app/_services/alert.service';
import { PostService } from 'src/app/_services/post.service';

@Component({
  selector: 'app-my-posts',
  templateUrl: './my-posts.component.html',
  styleUrls: ['./my-posts.component.css']
})
export class MyPostsComponent implements OnInit {

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
