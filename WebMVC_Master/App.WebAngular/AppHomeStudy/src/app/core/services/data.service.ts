import { async } from '@angular/core/testing';
import { error } from 'util';
import { AuthenService } from '@app/core/services/authen.service';
import { SystemConstants } from '@app/core/common/system.constants';
import { Injectable } from '@angular/core';
// import { Http, RequestOptions } from "@angular/http";
// import { Observable } from "rxjs/Observable";
// import 'rxjs/add/operator/map';

import { Http, Response, Headers, URLSearchParams, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs';
import 'rxjs/Rx';
import { UtilityService } from '@app/core/services/utility.service';
import { UrlConstants } from '@app/core/common/url.constants';
import { IUserLoginModel } from '@app/shared/models/loggedin.user';
import { methodType } from '@app/shared/enums/methodType';

@Injectable()
export class DataService {
    private headers: Headers;
    private userLogin: IUserLoginModel;
    private headersAsync: any;
    constructor(private _http: Http, private _authenService: AuthenService, private _utilityService: UtilityService) {
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.setHeader();
    }
    ngOnInit(): void {
    }

    setHeader() {
        this.headers.delete("Authorization");
        this.headers.delete("userName");
        this.headers.append("Authorization", "Bearer " + this._authenService._userLogin.token);
        this.headers.append("userName", this._authenService._userLogin.userName);

        this.headersAsync = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'userName': this._authenService._userLogin.userName,
            'Authorization': 'Bearer ' + this._authenService._userLogin.token,
        }
    }
    getHeader() {
        return this.headersAsync;
    }
    get(uri: string) {
        return this._http.get(SystemConstants.BASE_API + uri, { headers: this.headers })
            .map(this.extractData)
            .catch(this.handleError);
    }
    options(uri: string) {
        return this._http.options(SystemConstants.BASE_API + uri, { headers: this.headers })
            .map(this.extractData)
            .catch(this.handleError);
    }
    post(uri: string, data?: any) {
        return this._http.post(SystemConstants.BASE_API + uri, data, { headers: this.headers })
            .map(this.extractData)
            .catch(this.handleError);
    }
    put(uri: string, data?: any) {
        return this._http.put(SystemConstants.BASE_API + uri, data, { headers: this.headers })
            .map(this.extractData)
            .catch(this.handleError);
    }
    delete(uri: string, key: string, id: string) {
        return this._http.delete(SystemConstants.BASE_API + uri + "/?" + key + "=" + id, { headers: this.headers })
            .map(this.extractData)
            .catch(this.handleError);
    }

    postFile(uri: string, data?: any) {
        let newHeader = new Headers();
        newHeader.delete("Authorization");
        newHeader.delete("userName");
        newHeader.append("Authorization", "Bearer " + this._authenService._userLogin.token);
        newHeader.append("userName", this._authenService._userLogin.userName);
        return this._http.post(SystemConstants.BASE_API + uri, data, { headers: newHeader })
            .map(this.extractData);
    }
    async callServiceAsync(props, _method: string = methodType.GET) {
        const { url, params = {} } = props;
        try {
            const response = await fetch(url,
                {
                    method: _method,
                    headers: this.headersAsync,
                    // headers: {
                    //     'Accept': 'application/json',
                    //     'Content-Type': 'application/json',
                    //     'userName': this._authenService.getLoggedInUser().username,
                    //     'Authorization': 'Bearer ' + this._authenService.getLoggedInUser().access_token,
                    // },
                    body: (_method === methodType.GET) ? null : JSON.stringify(params)
                }
            );
            const responseJson = await response.json();
            //this.handleError(response);
            return responseJson;
        } catch (error) {
            console.error(error);
            this.handleError(error);
        }
    }
    public handleError(error: Response | any) {
        debugger;
        if (error.status === 401 && error.statusText === "Unauthorized") {
            alert('Không có quyền truy cập chức năng này. Vui lòng đăng nhập user có quyền truy cập.');
            //localStorage.removeItem(SystemConstants.CURRENT_USER);
            //window.location.href = window.location.origin + "/#" + UrlConstants.LOGIN;
            //this._router.navigate([UrlConstants.LOGIN]);
        }
        console.error(error.message || error);
        return Observable.throw(error.message || error);
    }
    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }

}
