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
  nextBadgeLevel: string;
  nextBadgeValue: number;
  progressWidth: number;

  // interval: any;


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
  //   this.interval = setInterval(() => {
  //     this.getCurrentUserDetails()
  // }, 2000);
  }

  ngOnDestroy() {
    // unsubscribe to ensure no memory leaks
    this.currentUserSubscription.unsubscribe();
    // clearInterval(this.interval);
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
        // console.log(data);
        this.userDetails = data;
        if(data.badgeValue <= 5){
          this.badgeLevel = 'bronze';
          this.nextBadgeLevel = 'silver';
          this.nextBadgeValue = 10;
          if(data.badgeValue <=0 ){
            this.progressWidth = 0.01;
          }
          else{
            this.progressWidth = data.badgeValue * 5;
          }
        }
        else if(data.badgeValue > 5 && data.badgeValue <=10){
          this.badgeLevel = 'silver';
          this.nextBadgeLevel = 'gold';
          this.nextBadgeValue = 10;
          this.progressWidth = data.badgeValue * 5;
        }
        else if(data.badgeValue > 10 && data.badgeValue <=15){
          this.badgeLevel = 'gold';
          this.nextBadgeLevel = 'platinum';
          this.nextBadgeValue = 15;
          this.progressWidth = data.badgeValue * 5;
        }
        else if(data.badgeValue > 15){
          this.badgeLevel = 'platinum';
          // this.progressWidth = data.badgeValue * 5;
        }
      },
      error =>{
        console.log(error);
      }
    );
  }
}
