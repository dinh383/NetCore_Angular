import { VideoComponent } from '@app/main/modules/resoure-management/video/video.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { DxDataGridModule, DxButtonModule } from 'devextreme-angular';
import { ResourceCategoryService } from '@app/main/shared/services/resource-category.service';
import { ResourceChannelService } from '@app/main/shared/services/resource-channel.service';

@NgModule({
  imports: [
    CommonModule,
    DxDataGridModule,
    DxButtonModule
  ],
  declarations: [
    VideoComponent
  ],
  providers:[
    ResourceCategoryService,
    ResourceChannelService
  ]
})
export class VideoModule { }
