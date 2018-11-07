import { ChannelComponent } from '@app/main/modules/resoure-management/channel/channel.component';
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
    ChannelComponent
  ],
  providers:[
  ]
})
export class ChannelModule { }
