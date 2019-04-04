import { Component, OnInit } from '@angular/core';
import { User } from "../_models/user";
import { AuthenticationService } from "../_services/authentication.service";
import { Router } from '@angular/router';
import * as jwt_decode from "jwt-decode";
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  user = {firstName: '',lastName:'',email:''}
  constructor(
    private router: Router,
    private authenticationService : AuthenticationService,
  ) { }

  ngOnInit() {
  }
  isLoggedIn(){
    let currentUser:User = this.authenticationService.currentUserValue
    if(currentUser){
      try {
        const data = jwt_decode(currentUser.token)
        this.user.firstName = data.firstName
        this.user.lastName = data.lastName
        this.user.email = data.email
        return true;
      } catch (error) {
        console.log(error)
      }
    }
    else
      return false;
  }
  logout() {
    this.authenticationService.logout();
    this.router.navigate(['/login']);
}
}
