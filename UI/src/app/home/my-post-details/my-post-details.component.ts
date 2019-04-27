import { Component, OnInit } from '@angular/core';
import { PostModel } from 'src/app/_models/postModel';
import { ActivatedRoute } from '@angular/router';
import { PostService } from 'src/app/_services/post.service';
import { AlertService } from 'src/app/_services/alert.service';
import { CommentModel } from 'src/app/_models/commentModel';

@Component({
  selector: 'app-my-post-details',
  templateUrl: './my-post-details.component.html',
  styleUrls: ['./my-post-details.component.css']
})
export class MyPostDetailsComponent implements OnInit {

  id: number;
  post: PostModel;
  commentsByPostId: CommentModel[];
  numberOfComments = 0;

  showCommentBox = false;

  likes: number[];
  dislikes: number[];

  iconClassLike = 'far fa-thumbs-up';
  iconClassDislike = 'far fa-thumbs-down';

  solidThumbsUp = 'fas fa-thumbs-up';
  regularThumbsUp = 'far fa-thumbs-up';

  solidThumbsDown = 'fas fa-thumbs-down';
  regularThumbsDown = 'far fa-thumbs-down';

  likeDislikeCount: number[];
  solutionList: number[];

  constructor(private route: ActivatedRoute,
              private postService: PostService,
              private alertService: AlertService) {
                this.getLikesList();
                this.getDisLikeList();
               }

  ngOnInit() {
    this.id = +this.route.snapshot.paramMap.get('id');
    this.getSolutionList();
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

  upVote(id: number) {

    const spanLike = document.getElementById(`spanLike${id}`);
    const spanDislike = document.getElementById(`spanDislike${id}`);

    this.postService.likePost({ cid: id })
      .subscribe(
        data => {
          this.likeDislikeCount = data;
          spanLike.innerText = data[0].toString();
          spanDislike.innerText = data[1].toString();
          console.log(data);
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

    const spanLike = document.getElementById(`spanLike${id}`);
    const spanDislike = document.getElementById(`spanDislike${id}`);

    this.postService.dislikePost({ cid: id })
      .subscribe(
        data => {
          this.likeDislikeCount = data;
          spanLike.innerText = data[0].toString();
          spanDislike.innerText = data[1].toString();
          console.log(data);
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

  submitSolution(cid: number){

    console.log('cid: '+ cid);
    const solutionObj = {
      pid: this.id,
      cid
    };
    this.postService.writeSolution(solutionObj)
    .subscribe(
      data =>{
        console.log(data);
        this.getSolutionList();
        this.getCommentsByPostId();
      },
      error =>{
        console.log(error);
      }
    );
  }

  getSolutionList(){
    this.postService.getSolutionList(this.id)
    .subscribe(
      data =>{
        console.log(data);
        this.solutionList = data;
      },
      error =>{
        console.log(error);
      }
    );
  }

  existsSolution(cid: number){
    if (this.solutionList === undefined || this.solutionList === null) {
      return false;
    } else {
      let status = this.solutionList.indexOf(cid) !== -1 ? true : false;
      // console.log(cid);
      // console.log(status);
      return status;
    }
  }
}
