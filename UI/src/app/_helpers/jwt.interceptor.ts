import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs';

import { AuthenticationService } from '../_services/authentication.service';

@Injectable()
export class JwtInterceptor implements HttpInterceptor {
  constructor(private authenticationService: AuthenticationService) { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const re = /signin/gi;
    // add authorization header with jwt token if available
    if (request.url.search(re) === -1) {

      let currentUser = this.authenticationService.currentUserValue;
      //console.log(currentUser.accessToken);
      if (currentUser && currentUser.accessToken) {
        request = request.clone({
          setHeaders: {
            Authorization: `Bearer ${currentUser.accessToken}`
          }
        });
        //console.log(request);
      }
    }

    return next.handle(request);
  }
}
