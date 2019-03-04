import { Component, OnInit } from '@angular/core';
import { User } from "../_models/user";
import { AuthenticationService } from "../_services/authentication.service";
import { Router } from '@angular/router';
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor(
    private router: Router,
    private authenticationService : AuthenticationService,
  ) { }

  ngOnInit() {
  }
  isLoggedIn(){
    let currentUser:User = this.authenticationService.currentUserValue
    if(currentUser)
      return true;
    else
      return false;
  }
  logout() {
    this.authenticationService.logout();
    this.router.navigate(['/login']);
}
}
