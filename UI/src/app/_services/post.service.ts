import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { User } from '../_models/user';
import { PostModel } from "../_models/postModel";
import { Observable, config } from 'rxjs';
import { map } from 'rxjs/operators';
import { CommentModel } from '../_models/commentModel';

@Injectable({ providedIn: 'root' })
export class PostService{

  config ={apiUrl:'http://localhost:8080/api/post'};
    constructor(private http: HttpClient) { }

    writePost(postInfo){
      return this.http.post(`${this.config.apiUrl}`, postInfo);
    }

    getPostByOthers(): Observable<PostModel[]>{
      return this.http
      .get<PostModel[]>(`${this.config.apiUrl}/others`)
      .pipe(map((response) => response));
    }

    getMyPosts(): Observable<PostModel[]>{
      return this.http
      .get<PostModel[]>(`${this.config.apiUrl}/my`)
      .pipe(map(response => response));
    }

    getPostById(id: number){
      return this.http
      .get<PostModel>(`${this.config.apiUrl}/${id}`)
      .pipe(map(response => response));
    }

    getCommentsByPostId(pid: number){
      return this.http
      .get<CommentModel[]>(`${this.config.apiUrl}/${pid}/comment`)
      .pipe(map(response => response));
    }

    writeComment(commentObj){
      return this.http
      .post(`${this.config.apiUrl}/comment`, commentObj)
      .pipe(map(response => response));
    }

    likePost(cid){
      return this.http
      .post(`${this.config.apiUrl}/comment/like`, cid)
      .pipe(map(response => response));
    }

    dislikePost(cid){
      return this.http
      .post(`${this.config.apiUrl}/comment/dislike`, cid)
      .pipe(map(response => response));
    }
    // getMyPosts(): Observable<PostModel[]>{
    //   return this.http
    //   .get<PostModel[]>(`${this.config.apiUrl}`)
    //   .pipe(map(response => response));
    // }
}
