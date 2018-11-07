import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { QuestionDetailComponent } from '@app/main/modules/resoure-management/question-detail/question-detail.component';
import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';
import { ResourceQuestionService } from '@app/main/shared/services/resource-question.service';

@NgModule({
  imports: [
    CommonModule,
    DxDataGridModule,
    DxButtonModule
  ],
  declarations: [
    QuestionDetailComponent
  ],
  providers: [
    ResourceQuestionService
  ]
})
export class QuestionDetailModule { }
