import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';
import { environment } from 'environments/environment';
import { SystemConstants } from '@app/core/common/system.constants';
import { AuthenService } from '@app/core/services/authen.service';
import { UrlConstants } from '@app/core/common/url.constants';
@Injectable()
export class BaseService {
    protected baseUrl: string;
    private headers: Headers;
    private headersAsync: any;
    private httpOptions: any;
    //private _authenService: AuthenService
    constructor(protected http: HttpClient, protected _authenService: AuthenService) {
        this.baseUrl = SystemConstants.BASE_API;
        this.setHeader();
    }
    setHeader() {
        this.httpOptions = {
            headers: new HttpHeaders({
                'Content-Type': 'application/json',
                'UserName': this._authenService._userLogin.userName,
                'Authorization': 'Bearer ' + this._authenService._userLogin.token
            })
        };

    }
    
    protected get<Type>(url: string): Observable<any> {
        return this.http.get(this.baseUrl + url, this.httpOptions)
            .catch(this.handleError);
    }

    protected post<Type>(url: string, data: Type) {
        return this.http.post(this.baseUrl + url, data, this.httpOptions)
            .catch(this.handleError);
    }

    protected put<Type>(url: string, data: Type) {
        return this.http.put(this.baseUrl + url, data, this.httpOptions)
            .catch(this.handleError);
    }

    protected delete<Type>(url: string, data: Type) {
        return this.http.delete(this.baseUrl + url, this.httpOptions)
            .catch(this.handleError);
    }

    protected handleError(error: HttpErrorResponse) {
        if (error != null && error.status === 403) {
            //this.getRefreshToken();
            localStorage.removeItem(SystemConstants.CURRENT_USER);
            window.location.reload();
            window.location.href = window.location.origin + "/#" + UrlConstants.LOGIN;
        }
        return Observable.throw(error);
    }

    // protected handleError(error: HttpErrorResponse, $this: any, callBack: any = null) {
    //     if (error != null && error.status === 403) {
    //         alert(3)
    //         debugger;
    //         $this.getRefreshToken();
    //         return callBack();
    //     }
    //     return Observable.throw(error);
    // }

    // protected handleError(error: HttpErrorResponse) {
    //     if (error != null && error.status === 403) {
    //         this.getRefreshToken();
    //         // localStorage.removeItem(SystemConstants.CURRENT_USER);
    //         // window.location.reload();
    //         // window.location.href = window.location.origin + "/#" + UrlConstants.LOGIN;
    //     }
    //     return Observable.throw(error);
    // }

    // protected getRefreshToken() {
    //     const data = {
    //         token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJzdWIiOiJiOTg3YjdiMS04ZGU3LTQwZGYtOTBlOC02YmM3YTIwNDAzNjkiLCJlbWFpbCI6InN0cmluZyIsImp0aSI6ImRlNWQ5NmZjLTNkNzgtNDRjMC05M2ZkLTBjMzQzMGI1MDQ0MSIsIm5iZiI6MTUzNjgxMjg2MiwiZXhwIjoxNTM2ODEyODkyLCJpc3MiOiJJc3N1ZXIiLCJhdWQiOiJBdWRpZW5jZSJ9.vh8nwZhQCqdV-_TmUxuiGRQD7b2ZT6bPhw0CXYOxF8Y",
    //         refresToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    //     }
    //     const url = SystemConstants.BASE_API + "api/user/refresh-Token";
    //     this.post(url, data).subscribe(
    //         result => {
    //             alert('ok')
    //             console.log(result)
    //         }

    //     )
    // }
}
