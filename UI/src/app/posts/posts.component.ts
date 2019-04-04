import { Component, OnInit } from '@angular/core';
import * as jwt_decode from "jwt-decode";

import { UserService } from "../_services/user.service";
import { PostModel } from '../_models/postModel';
import { AlertService } from '../_services/alert.service';
import { AuthenticationService } from '../_services/authentication.service';
import { User } from "../_models/user";

@Component({
  selector: 'app-posts',
  templateUrl: './posts.component.html',
  styleUrls: ['./posts.component.css']
})
export class PostsComponent implements OnInit {

  myPosts:PostModel[];
  email;

  constructor(
    private userService: UserService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService
    ) { }

  ngOnInit() {
    this.getUserEmail();
    console.log('email: '+this.email)
    this.getMyPosts();
  }

  getUserEmail(){
    try {
      let currentUser:User = this.authenticationService.currentUserValue
      const data = jwt_decode(currentUser.token)
      console.log('running')
      this.email = data.email
    } catch (error) {
      console.log(error)
    }
  }
  getMyPosts(){
    this.userService.getSelfPosts(this.email)
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
