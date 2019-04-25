import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { first } from 'rxjs/operators';
import { ReactiveFormsModule, FormControl } from '@angular/forms';
import { Router } from '@angular/router';

import { User } from '../_models/user';
import { UserService } from '../_services/user.service';
import { AuthenticationService } from '../_services/authentication.service';
import { AlertService } from '../_services/alert.service';
import { PostModel } from '../_models/postModel';
import { PostService } from '../_services/post.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {
  currentUser: User;
  currentUserSubscription: Subscription;
  userDetails: User;
  user = { firstName: '', lastName: '', email: '' };
  title = new FormControl('');
  description = new FormControl('');
  //postsByOthers: PostModel[];

  myPosts: PostModel[];

  badgeLevel: string;

  constructor(
    private authenticationService: AuthenticationService,
    private userService: UserService,
    private router: Router,
    private alertService: AlertService,
    private postService: PostService
  ) {
    this.currentUserSubscription = this.authenticationService.currentUser.subscribe(user => {
      this.currentUser = user;
    });
  }

  ngOnInit() {
    this.getCurrentUserDetails();
  }

  ngOnDestroy() {
    // unsubscribe to ensure no memory leaks
    this.currentUserSubscription.unsubscribe();
  }

  private loadUser() {
    this.userService.getCurrentUserDetails()
      .subscribe(
        data => {
          console.log(data);
        },
        error => {
          console.log(error);
        }
      );
  }
  post() {
    if (this.title.value !== '' && this.description.value !== '') {

      const postInfo = {
        title: this.title.value,
        description: this.description.value,
      };

      this.postService.writePost(postInfo)
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
  }
  getCurrentUserDetails(){
    this.userService.getCurrentUserDetails()
    .subscribe(
      data =>{
        this.userDetails = data;
        if(data.badgeValue <= 25){
          this.badgeLevel = 'bronze';
        }
        else if(data.badgeValue > 25 && data.badgeValue <=100){
          this.badgeLevel = 'silver';
        }
        else if(data.badgeValue > 100 && data.badgeValue <=200){
          this.badgeLevel = 'gold';
        }
        else if(data.badgeValue > 200){
          this.badgeLevel = 'platinum';
        }
      },
      error =>{
        console.log(error);
      }
    );
  }
}
