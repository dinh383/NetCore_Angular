import { ChannelModule } from '@app/main/modules/resoure-management/channel/channel.module';
import { CategoryModule } from '@app/main/modules/resoure-management/category/category.module';
import { VideoModule } from '@app/main/modules/resoure-management/video/video.module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ResoureManagementComponent } from '@app/main/modules/resoure-management/resoure-management.component';
import { RouterModule } from '@angular/router';
import { resoureRoutes } from '@app/main/modules/resoure-management/resoure-management.routing';
import { QuestionModule } from '@app/main/modules/resoure-management/question/question.module';
import { QuestionDetailModule } from '@app/main/modules/resoure-management/question-detail/question-detail.module';

@NgModule({
  imports: [
    CommonModule,
    VideoModule,
    CategoryModule,
    ChannelModule,
    QuestionModule,
    QuestionDetailModule,
    RouterModule.forChild(resoureRoutes)
  ],
  declarations: [
    ResoureManagementComponent
  ]
})
export class ResoureManagementModule { }
