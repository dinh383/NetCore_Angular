import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { Observable } from "rxjs";
import { SystemConstants } from "@app/core/common/system.constants";
import { BaseService } from "@app/shared/services/baseService";
import { AuthenService } from "@app/core/services/authen.service";

@Injectable()
export class ResourceChannelService extends BaseService {
    constructor(protected http: HttpClient, protected _authenService: AuthenService) {
        super(http, _authenService);
    }
    getChannels(): Observable<any> {
        return this.get(`api/resource-channel/getAll`).catch(
            this.handleError
        );
    }
}