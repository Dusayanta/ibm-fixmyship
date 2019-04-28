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
  singlePost: PostModel;
  updateTitle;
  updateDesc;

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

  loadEditData(pid: number){
    this.postService.getMyPostById(pid)
    .subscribe(
      data =>{
        this.singlePost = data;
        this.updateTitle = data.title;
        this.updateDesc = data.description;
      },
      error =>{
        console.log(error);
      }
    );
  }

  updatePost(){
    const updateObj = {
      id: this.singlePost.id,
      title: this.updateTitle,
      description: this.updateDesc
    };
    this.postService.updatePost(updateObj)
    .subscribe(
      data => {
        this.alertService.success('Post Updated Successfully');
        this.getMyPosts();
      },
      error =>{
        console.log(error);
      }
    );
  }

}
