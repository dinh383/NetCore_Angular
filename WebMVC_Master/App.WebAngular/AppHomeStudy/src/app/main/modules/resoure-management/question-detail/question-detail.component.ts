
import { SystemConstants } from '@app/core/common/system.constants';
import { BaseController } from '@app/core/common/baseController';
import { Component, OnInit, Injectable, ViewChild } from '@angular/core';
import { DxDataGridComponent } from 'devextreme-angular';
import * as AspNetData from "devextreme-aspnet-data";
import { AuthenService } from '@app/core/services/authen.service';
import { ResourceQuestionService } from '@app/main/shared/services/resource-question.service';

@Component({
  selector: 'app-question-detail',
  templateUrl: './question-detail.component.html',
  styleUrls: ['./question-detail.component.css']
})

@Injectable()
export class QuestionDetailComponent extends BaseController implements OnInit {
  dataSource: any;
  questions: any[] = [];
  constructor(private _authenService: AuthenService, private _questionService: ResourceQuestionService) {
    super();
  }
  @ViewChild(DxDataGridComponent) dataGrid: DxDataGridComponent;

  ngOnInit() {
    this.initGrid();
    this.getQuestions();
  }

  initGrid() {
    this.dataSource = AspNetData.createStore({
      key: "lineId",
      loadUrl: SystemConstants.BASE_API + "api/test-question-detail/getAll",
      insertUrl: SystemConstants.BASE_API + "api/test-question-detail/InsertOnGrid",
      updateUrl: SystemConstants.BASE_API + "api/test-question-detail/UpdateOnGrid",
      deleteUrl: SystemConstants.BASE_API + "api/test-question-detail/DeleteOnGrid",
      onBeforeSend: this._authenService.getHeaderForGrid()
    });
  }

  getQuestions() {
    this._questionService.getQuestions().subscribe(
      result => {
        this.questions = result;
      }
    )
  }

  onContentReady(e) {
    e.component.columnOption("command:edit", {
      visibleIndex: -1
    });
  }
}

