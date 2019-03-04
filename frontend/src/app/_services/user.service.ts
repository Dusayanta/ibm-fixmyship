import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { User } from '../_models/user';

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
}
