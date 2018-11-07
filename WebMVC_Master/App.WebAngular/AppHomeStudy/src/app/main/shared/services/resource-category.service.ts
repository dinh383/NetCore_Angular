import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { Observable } from "rxjs";
import { BaseService } from "@app/shared/services/baseService";
import { AuthenService } from "@app/core/services/authen.service";

@Injectable()
export class ResourceCategoryService extends BaseService {
    constructor(protected http: HttpClient, protected _authenService: AuthenService) {
        super(http, _authenService);
    }
    getCategories(): Observable<any> {
        return this.get(`api/resource-category/getAll`).catch(
            this.handleError
        );
    }
}