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
  fragment;

  likes: number[];
  dislikes: number[];

  iconClassLike = 'far fa-thumbs-up';
  iconClassDislike = 'far fa-thumbs-down';

  solidThumbsUp = 'fas fa-thumbs-up';
  regularThumbsUp = 'far fa-thumbs-up';

  solidThumbsDown = 'fas fa-thumbs-down';
  regularThumbsDown = 'far fa-thumbs-down';

  showFetched = false;

  likeDislikeCount: number[];



  constructor(private route: ActivatedRoute,
    private postService: PostService,
    private alertService: AlertService
    ) {
    this.getLikesList();
    this.getDisLikeList();
  }

  ngOnInit() {
    this.id = +this.route.snapshot.paramMap.get('id');
    this.fragment = this.route.snapshot.fragment;
    if (this.fragment === 'commentSection') {
      this.showCommentBox = true;
    }
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
          data => {
            this.comment = '';
            this.showCommentBox = false;
            this.alertService.success('Comment Added Successfully..');
            this.getCommentsByPostId();
          },
          error => {
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

  upVote(id: number) {

    this.postService.likePost({ cid: id })
      .subscribe(
        data => {
          this.likeDislikeCount = data;
          this.showFetched = true;
        //  console.log(data);
        },
        error => console.log(error)
      );

    const like = document.getElementById(`like${id}`);
    const dislike = document.getElementById(`dislike${id}`);

    if (like.className === this.regularThumbsUp) {
      like.className = this.solidThumbsUp;
    }
    else {
      like.className = this.regularThumbsUp;
    }

    if (dislike.className === this.solidThumbsDown) {
      dislike.className = this.regularThumbsDown;
    }
  }

  downVote(id: number) {

    this.postService.dislikePost({ cid: id })
      .subscribe(
        data => {
          this.likeDislikeCount = data;
          this.showFetched = true;
         // console.log(data);
        },
        error => console.log(error)
      );


    const dislike = document.getElementById(`dislike${id}`);
    const like = document.getElementById(`like${id}`);


    if (dislike.className === this.regularThumbsDown) {
      dislike.className = this.solidThumbsDown;
    }
    else {
      dislike.className = this.regularThumbsDown;
    }

    if (like.className === this.solidThumbsUp) {
      like.className = this.regularThumbsUp;
    }
  }

  getLikesList() {
    this.postService.getLikesList()
      .subscribe(
        data => {
          console.log('Likes list');
          this.likes = data;
          console.log(data);
        },
        error => {
          console.log(error);
        }
      );
  }

  getDisLikeList() {
    this.postService.getDisLikesList()
      .subscribe(
        data => {
          console.log('Dislikes list');
          this.dislikes = data;
          console.log(data);
        },
        error => {
          console.log(error);
        }
      );
  }

  existsLike(id: number) {
    if (this.likes === undefined || this.likes === null) {
      return false;
    } else {
      let status = this.likes.indexOf(id) !== -1 ? true : false;
      // console.log(id+' '+status);
      return status;
    }
  }

  existsDislike(id: number) {
    if (this.dislikes === undefined || this.dislikes === null) {
      return false;
    } else {
      let status = this.dislikes.indexOf(id) !== -1 ? true : false;
      return status;
    }
  }
}
