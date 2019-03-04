import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { first } from 'rxjs/operators';

import { User } from '../_models/user';
import { UserService } from '../_services/user.service';
import { AuthenticationService } from "../_services/authentication.service";
import * as jwt_decode from "jwt-decode";

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

  constructor(
      private authenticationService: AuthenticationService,
      private userService: UserService
  ) {
      this.currentUserSubscription = this.authenticationService.currentUser.subscribe(user => {
          this.currentUser = user;
      });
  }

  ngOnInit() {
      this.loadUser();
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
}
