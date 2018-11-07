import { DxPopupModule, DxButtonModule, DxFormModule } from 'devextreme-angular';
import { TopNavigationComponent } from '@app/shared/layout/top-navigation/top-navigation.component';
import { DataService } from '@app/core/services/data.service';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthenService } from '@app/core/services/authen.service';

@NgModule({
  imports: [
    CommonModule,
    DxPopupModule,
    DxButtonModule,
    DxFormModule
  ],
  exports: [
    TopNavigationComponent
  ],
  declarations: [TopNavigationComponent],
  providers: [DataService]
})
export class TopNavigationModule { }
