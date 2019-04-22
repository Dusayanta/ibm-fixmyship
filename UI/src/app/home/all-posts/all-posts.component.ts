import { Component, OnInit } from '@angular/core';
import { PostService } from 'src/app/_services/post.service';
import { PostModel } from 'src/app/_models/postModel';
import { AlertService } from 'src/app/_services/alert.service';

@Component({
  selector: 'app-all-posts',
  templateUrl: './all-posts.component.html',
  styleUrls: ['./all-posts.component.css']
})
export class AllPostsComponent implements OnInit {

  postsByOthers: PostModel[];
  constructor(private postService: PostService,
              private alertService: AlertService) { }

  ngOnInit() {
    this.getPostByOthers();
  }
  getPostByOthers() {
    this.postService.getPostByOthers()
      .subscribe(
        data => {
          this.postsByOthers = data;
        },
        error => {
          this.alertService.error(error);
        });
  }
}
