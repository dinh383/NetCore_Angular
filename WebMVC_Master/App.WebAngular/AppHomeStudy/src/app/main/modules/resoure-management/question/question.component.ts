
import { SystemConstants } from '@app/core/common/system.constants';
import { BaseController } from '@app/core/common/baseController';
import { Component, OnInit, Injectable, ViewChild } from '@angular/core';
import { DxDataGridComponent } from 'devextreme-angular';
import * as AspNetData from "devextreme-aspnet-data";
import { AuthenService } from '@app/core/services/authen.service';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})

@Injectable()
export class QuestionComponent extends BaseController implements OnInit {
  dataSource: any;
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
      key: "questionId",
      loadUrl: SystemConstants.BASE_API + "api/test-question/getAll",
      insertUrl: SystemConstants.BASE_API + "api/test-question/InsertOnGrid",
      updateUrl: SystemConstants.BASE_API + "api/test-question/UpdateOnGrid",
      deleteUrl: SystemConstants.BASE_API + "api/test-question/DeleteOnGrid",
      onBeforeSend: this._authenService.getHeaderForGrid()
    });
  }

  onContentReady(e) {
    e.component.columnOption("command:edit", {
      visibleIndex: -1
    });
  }
}

