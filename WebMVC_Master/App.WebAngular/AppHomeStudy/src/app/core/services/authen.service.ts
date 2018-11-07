import { DataService } from '@app/core/services/data.service';
import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { SystemConstants } from '@app/core/common/system.constants';
//import { LoggedInUser } from '../domain/loggedin.user';
import 'rxjs/add/operator/map';
import { LoggedInUser } from '@app/shared/models/loggedin.user';

@Injectable()
export class AuthenService {
  public _userLogin: LoggedInUser;
  constructor(private _http: Http) {
    this._userLogin = this.getLoggedInUser();
  }

  // login(username: string, password: string) {
  //   let body = "userName=" + encodeURIComponent(username) +
  //     "&password=" + encodeURIComponent(password) +
  //     "&grant_type=password";
  //   let headers = new Headers();
  //   headers.append("Content-Type", "application/x-www-form-urlencoded");
  //   let options = new RequestOptions({ headers: headers });

  //   return this._http.post(SystemConstants.BASE_API + 'api/oauth/token', body, options).map((response: Response) => {
  //     let user: LoggedInUser = response.json();
  //     if (user && user.access_token) {
  //       localStorage.removeItem(SystemConstants.CURRENT_USER);
  //       localStorage.setItem(SystemConstants.CURRENT_USER, JSON.stringify(user));
  //     }
  //   });
  // }

  login(username: string, password: string) {
    const body = {
      username: username,
      password: password
    }
    return this._http.post(SystemConstants.BASE_API + 'api/user/login', body).map((response: Response) => {
      let user: LoggedInUser = response.json();
      if (user && user.token) {
        localStorage.removeItem(SystemConstants.CURRENT_USER);
        localStorage.setItem(SystemConstants.CURRENT_USER, JSON.stringify(user));
      }
      return response.json();
    });
  }

  logout() {
    localStorage.removeItem(SystemConstants.CURRENT_USER);
  }

  isUserAuthenticated(): boolean {
    let user = localStorage.getItem(SystemConstants.CURRENT_USER);
    if (user != null) {
      return true;
    }
    else
      return false;
  }

  getLoggedInUser(): LoggedInUser {
    let user: LoggedInUser;
    if (this.isUserAuthenticated()) {
      user = JSON.parse(localStorage.getItem(SystemConstants.CURRENT_USER));
    }
    else
      user = null;
    return user;
  }

  getHeaderForGrid() {
    let that = this;
    var result = function (method, ajaxOptions) {
      ajaxOptions.headers = {
        //'Content-Type': 'application/json',
        'UserName': that._userLogin.userName,
        'Authorization': 'Bearer ' + that._userLogin.token
      };
    }
    return result;
  }

  //   checkAccess(functionId: string) {
  //     var user = this.getLoggedInUser();
  //     var result: boolean = false;
  //     var permission: any[] = JSON.parse(user.permissions);
  //     var roles: any[] = JSON.parse(user.roles);
  //     var hasPermission: number = permission.findIndex(x => x.FunctionId == functionId && x.CanRead == true);
  //     if (hasPermission != -1 || roles.findIndex(x => x == "Admin") != -1) {
  //       return true;
  //     }
  //     else
  //       return false;
  //   }
  //   hasPermission(functionId: string, action: string): boolean {
  //     var user = this.getLoggedInUser();
  //     var result: boolean = false;
  //     var permission: any[] = JSON.parse(user.permissions);
  //     var roles: any[] = JSON.parse(user.roles);
  //     switch (action) {
  //       case 'create':
  //         var hasPermission: number = permission.findIndex(x => x.FunctionId == functionId && x.CanCreate == true);
  //         if (hasPermission != -1 || roles.findIndex(x => x == "Admin") != -1)
  //           result = true;
  //         break;
  //       case 'update':
  //         var hasPermission: number = permission.findIndex(x => x.FunctionId == functionId && x.CanUpdate == true);
  //         if (hasPermission != -1 || roles.findIndex(x => x == "Admin") != -1)
  //           result = true;
  //         break;
  //       case 'delete':
  //         var hasPermission: number = permission.findIndex(x => x.FunctionId == functionId && x.CanDelete == true);
  //         if (hasPermission != -1 || roles.findIndex(x => x == "Admin") != -1)
  //           result = true;
  //         break;
  //     }
  //     return result;
  //   }
}