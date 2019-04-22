import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PostModel } from 'src/app/_models/postModel';
import { PostService } from 'src/app/_services/post.service';
import { AlertService } from 'src/app/_services/alert.service';
import { FormsModule } from "@angular/forms";
import { CommentModel } from 'src/app/_models/commentModel';

@Component({
  selector: 'app-post-details',
  templateUrl: './post-details.component.html',
  styleUrls: ['./post-details.component.css']
})
export class PostDetailsComponent implements OnInit {

  id: number;
  post: PostModel;
  showCommentBox: boolean;
  comment;
  errorMsg: string;
  commentsByPostId: CommentModel[];
  numberOfComments: number;

  constructor(private route: ActivatedRoute,
    private postService: PostService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.id = +this.route.snapshot.paramMap.get('id');
    this.getPostById();
    this.getCommentsByPostId();
  }

  getPostById() {
    this.postService.getPostById(this.id)
      .subscribe(
        data => this.post = data,
        error => this.alertService.error(error)
      );
  }

  getCommentsByPostId() {
    this.postService.getCommentsByPostId(this.id)
      .subscribe(
        data => {
          if (data) {
            this.numberOfComments = data.length;
          }
          this.commentsByPostId = data;
        },
        error => this.alertService.error(error)
      );
  }

  toggleCommentBox() {
    this.showCommentBox = !this.showCommentBox;
  }

  submitComment() {
    if (this.comment !== undefined && this.comment.length >= 30) {
      this.errorMsg = '';
      console.log(this.comment);
      const commentObj = {
        comment: this.comment,
        pid: this.id
      };
      this.postService.writeComment(commentObj)
      .subscribe(
        data =>{
          this.comment = '';
          this.showCommentBox = false;
          this.alertService.success('Comment Added Successfully..');
          this.getCommentsByPostId();
        },
        error =>{
          this.alertService.error(error);
        }
      );
    }
    else {
      if (this.comment === undefined || this.comment.length <= 0) {
        this.errorMsg = 'You need to write first';
      }
      else {
        this.errorMsg = 'Minimum 30 characters required';
      }
    }
  }

  upVote(id: number){
    console.log('comment '+id+' upVoted');
  }

  downVote(id: number){
    console.log('comment '+id+' downVoted');
  }
}
