import { Component, OnInit } from '@angular/core';
import * as jwt_decode from "jwt-decode";

import { UserService } from "../_services/user.service";
import { PostModel } from '../_models/postModel';
import { CommentModel } from '../_models/commentModel';
import { AlertService } from '../_services/alert.service';
import { AuthenticationService } from '../_services/authentication.service';
import { User } from "../_models/user";


@Component({
  selector: 'app-comments',
  templateUrl: './comments.component.html',
  styleUrls: ['./comments.component.css']
})
export class CommentsComponent implements OnInit {

  myComments: CommentModel[];
  myPosts: PostModel[];

  constructor(
    private userService: UserService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService
  ) { }

  ngOnInit() {
    this.getComments();
  }


  getComments(){
    this.userService.getMyComments()
    .subscribe(
      data =>{
        this.myComments = data;
      },
      error =>{
        this.alertService.error(error);
      }
    );
  }

}
