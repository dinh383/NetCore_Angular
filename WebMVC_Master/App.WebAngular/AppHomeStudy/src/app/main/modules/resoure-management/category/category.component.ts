import { SystemConstants } from '@app/core/common/system.constants';
import { ResourceCategoryService } from '@app/main/shared/services/resource-category.service';
import { BaseController } from '@app/core/common/baseController';
import { Component, OnInit, Injectable, ViewChild } from '@angular/core';
import { DxDataGridComponent } from 'devextreme-angular';
import * as AspNetData from "devextreme-aspnet-data";
import { AuthenService } from '@app/core/services/authen.service';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})

@Injectable()
export class CategoryComponent extends BaseController implements OnInit {
  dataSource: any;
  channels: any[] = [];
  categories: any[] = [];
  events: Array<string> = [];
  constructor(private _authenService: AuthenService) {
    super();
  }
  @ViewChild(DxDataGridComponent) dataGrid: DxDataGridComponent;

  ngOnInit() {
    this.initGrid();
  }

  initGrid() {
    this.dataSource = AspNetData.createStore({
      key: "categoryId",
      loadUrl: SystemConstants.BASE_API + "api/resource-category/getAll",
      insertUrl: SystemConstants.BASE_API + "api/resource-category/InsertOnGrid",
      updateUrl: SystemConstants.BASE_API + "api/resource-category/UpdateOnGrid",
      deleteUrl: SystemConstants.BASE_API + "api/resource-category/DeleteOnGrid",
      onBeforeSend: this._authenService.getHeaderForGrid()
    });
  }

  onContentReady(e) {
    e.component.columnOption("command:edit", {
      visibleIndex: -1
    });
  }
}

