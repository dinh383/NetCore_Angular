import { RegisterConsultativeComponent } from '@app/main/modules/home-study/register-consultative/register-consultative.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DxDataGridModule, DxButtonModule, DxPopupModule, DxFormModule } from 'devextreme-angular';
import { ButtonControlModule } from '@app/shared/layout/button-control/button-control.module';

@NgModule({
  imports: [
    CommonModule,
    DxDataGridModule,
    DxButtonModule,
    DxPopupModule,
    DxFormModule,
    ButtonControlModule
  ],
  declarations: [
    RegisterConsultativeComponent
  ]
})
export class RegisterConsultativeModule { }
