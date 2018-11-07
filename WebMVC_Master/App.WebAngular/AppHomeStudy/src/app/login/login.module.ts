import { AuthenService } from '@app/core/services/authen.service';
import { LoginComponent } from '@app/login/login.component';
import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
export const routes: Routes = [
  { path: '', component: LoginComponent }
]
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    RouterModule.forChild(routes)
  ],
  declarations: [LoginComponent],
  providers:[AuthenService]
})
export class LoginModule { }
