import { ButtonControlComponent } from '@app/shared/layout/button-control/button-control.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



@NgModule({
  imports: [
    CommonModule
  ],
  exports: [
    //CommonModule,
    ButtonControlComponent
  ],
  declarations: [ButtonControlComponent]
})
export class ButtonControlModule { }
