import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { QuestionComponent } from '@app/main/modules/resoure-management/question/question.component';
import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';

@NgModule({
  imports: [
    CommonModule,
    DxDataGridModule,
    DxButtonModule
  ],
  declarations: [
    QuestionComponent
  ]
})
export class QuestionModule { }
