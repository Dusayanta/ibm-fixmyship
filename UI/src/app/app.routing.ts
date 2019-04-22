import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { AuthGuard } from './_guards/auth.guard';
import { NotfoundComponent } from "./notfound/notfound.component";
import { PostsComponent } from "./posts/posts.component";
import { AllPostsComponent } from './home/all-posts/all-posts.component';
import { PostDetailsComponent } from './home/post-details/post-details.component';

const appRoutes: Routes = [
    { path: '', redirectTo: '/home/posts', pathMatch: 'full' },
    { path: 'home', component: HomeComponent, canActivate: [AuthGuard],
      children: [
        { path: '', redirectTo: 'posts', pathMatch: 'full' },
        { path: 'posts', component: AllPostsComponent },
        {path: 'post/:id', component: PostDetailsComponent}
      ]},
    { path: 'selfposts', component: PostsComponent, canActivate: [AuthGuard]},
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },

    // otherwise redirect to home
    { path: '**', component: NotfoundComponent }
];

export const routing = RouterModule.forRoot(appRoutes);
