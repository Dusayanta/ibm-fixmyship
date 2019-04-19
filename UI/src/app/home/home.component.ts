import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { first } from 'rxjs/operators';
import { ReactiveFormsModule, FormControl } from "@angular/forms";
import { Router } from '@angular/router';

import { User } from '../_models/user';
import { UserService } from '../_services/user.service';
import { AuthenticationService } from "../_services/authentication.service";
import { AlertService } from "../_services/alert.service";
import * as jwt_decode from "jwt-decode";
import { PostModel } from '../_models/postModel';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {
  currentUser: User;
  currentUserSubscription: Subscription;
  users: User[] = [];
  user = {firstName: '',lastName:'',email:''}
  title = new FormControl('');
  description = new FormControl('');
  postsByOthers:PostModel[];

  myPosts:PostModel[];

  constructor(
      private authenticationService: AuthenticationService,
      private userService: UserService,
      private router: Router,
      private alertService: AlertService
  ) {
      this.currentUserSubscription = this.authenticationService.currentUser.subscribe(user => {
          this.currentUser = user;
      });
  }

  ngOnInit() {
     // this.loadUser();
     // this.getPost();
     this.getMyPosts();
  }

  ngOnDestroy() {
      // unsubscribe to ensure no memory leaks
      this.currentUserSubscription.unsubscribe();
  }

  // deleteUser(id: number) {
  //     this.userService.delete(id).pipe(first()).subscribe(() => {
  //         this.loadAllUsers()
  //     });
  // }

  private loadUser() {
    try {
      const data = jwt_decode(this.currentUser.token)
      this.user.firstName = data.firstName
      this.user.lastName = data.lastName
      this.user.email = data.email
    } catch (error) {
      console.log(error)
    }
  }
  post()
  {
    if(this.title.value !='' && this.description.value !=''){

      // let postInfo ={
      //   title: this.title.value,
      //   description: this.description.value,
      //   byEmail: this.user.email,
      //   byFirstName: this.user.firstName
      // }

      let postInfo ={
        title: this.title.value,
        description: this.description.value,
        uid : 1
      }

      this.userService.writePost(postInfo)
          .pipe(first())
          .subscribe(
              data => {
                  this.alertService.success('Post Added', true);
                  this.router.navigate(['/home']);
              },
              error => {
                  this.alertService.error(error);
              });
    }
    this.getMyPosts();
  }
  getPost(){
    this.userService.getPosts(this.user.email)
          .subscribe(
              data => {
                  //this.alertService.success('Post Added', true);
                  this.postsByOthers = data;
                  //console.log("Inside: "+this.postsByOthers);
                  //console.log(data)
                  //this.router.navigate(['/login']);
              },
              error => {
                  this.alertService.error(error);
              });
              console.log(this.postsByOthers);
    // return this.postsByOthers;
  }
  getMyPosts(){
    this.userService.getMyPosts()
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
