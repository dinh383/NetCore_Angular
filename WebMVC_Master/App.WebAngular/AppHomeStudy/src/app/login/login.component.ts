import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthenService } from '@app/core/services/authen.service';
import { error } from 'util';
import { UrlConstants } from '@app/core/common/url.constants';
import { IUserLoginModel } from '@app/shared/models/loggedin.user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  userLogin: IUserLoginModel;
  constructor(private authenService: AuthenService, private router: Router) {
    this.initUser();
  }

  ngOnInit() {
    // let user = this.authenService.getLoggedInUser();
    // if (user != null) {
    //   this.router.navigate([UrlConstants.HOME])
    // } else {
    //   this.router.navigate([UrlConstants.LOGIN])
    // }
  }

  onLogin() {
    this.authenService.login(this.userLogin.userName, this.userLogin.password).subscribe(data => {
      window.location.href = "/#/main/resoure-management/video-list";
      //this.router.navigate([UrlConstants.HOME])
    }, error => {
      alert('Sai tài khoản hoặc mật khẩu!');
    });
  }

  initUser() {
    this.userLogin = {
      userName: "",
      password: ""
    }
  }
}
