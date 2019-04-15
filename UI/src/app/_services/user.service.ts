import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { User } from '../_models/user';
import { PostModel } from "../_models/postModel";
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class UserService {
  config ={apiUrl:'http://localhost:3500'};
    constructor(private http: HttpClient) { }

    getAll() {
        return this.http.get<User[]>(`${this.config.apiUrl}/users`);
    }

    getById(id: number) {
        return this.http.get(`${this.config.apiUrl}/users/${id}`);
    }

    register(user: User) {
        return this.http.post(`${this.config.apiUrl}/users/register`, user);
    }

    // update(user: User) {
    //     return this.http.put(`${this.config.apiUrl}/users/${user.id}`, user);
    // }

    delete(id: number) {
        return this.http.delete(`${this.config.apiUrl}/users/${id}`);
    }
    writePost(postInfo){
      return this.http.post(`http://localhost:8080/post`, postInfo);
    }
    getPosts(email):Observable<PostModel[]>{
      return this.http
      .get<PostModel[]>(`${this.config.apiUrl}/users/fetch/post/${email}`)
      .pipe(map((response) => response));
    }
    getSelfPosts(email):Observable<PostModel[]>{
      return this.http
      .get<PostModel[]>(`${this.config.apiUrl}/users/fetch/selfpost/${email}`)
      .pipe(map(response => response));
    }
    getMyPosts():Observable<PostModel[]>{
      return this.http
      .get<PostModel[]>(`http://localhost:8080/post`)
      .pipe(map(response => response));
    }
}
