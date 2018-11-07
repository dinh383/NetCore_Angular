import { CategoryComponent } from '@app/main/modules/resoure-management/category/category.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DxDataGridModule, DxButtonModule } from 'devextreme-angular';

@NgModule({
  imports: [
    CommonModule,
    DxDataGridModule,
    DxButtonModule
  ],
  declarations: [
    CategoryComponent
  ],
  providers:[
  ]
})
export class CategoryModule { }
