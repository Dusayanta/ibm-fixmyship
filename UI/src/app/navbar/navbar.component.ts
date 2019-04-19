import { Component, OnInit, OnDestroy } from '@angular/core';
import { User } from "../_models/user";
import { AuthenticationService } from "../_services/authentication.service";
import { Router } from '@angular/router';
import * as jwt_decode from "jwt-decode";
import { UserService } from '../_services/user.service';
import { Subscription } from 'rxjs';
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  user: User;
  userDetailsSubs: Subscription;
  isLoggedInFlag: boolean;
  constructor(
    private router: Router,
    private authenticationService: AuthenticationService,
    private userService: UserService
  ) {
    this.authenticationService.currentUser.subscribe(
      x => {
        if(x){
          this.isLoggedInFlag = true;
          this.userService.getCurrentUserDetails()
        .subscribe(data => this.user = data);
        }

      }
      );
   }

  ngOnInit() {
      }
  logout() {
    this.authenticationService.logout();
    this.isLoggedInFlag = false;
    this.router.navigate(['/login']);
  }
}

