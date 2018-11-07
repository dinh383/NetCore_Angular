import { ChannelComponent } from '@app/main/modules/resoure-management/channel/channel.component';
import { CategoryComponent } from '@app/main/modules/resoure-management/category/category.component';
import { Routes } from "@angular/router";
import { ResoureManagementComponent } from "@app/main/modules/resoure-management/resoure-management.component";
import { VideoComponent } from "@app/main/modules/resoure-management/video/video.component";
import { QuestionComponent } from '@app/main/modules/resoure-management/question/question.component';
import { QuestionDetailComponent } from '@app/main/modules/resoure-management/question-detail/question-detail.component';

export const resoureRoutes: Routes = [
    {
      path: 'video-list',
      component: VideoComponent
    },
    {
      path: 'category-list',
      component: CategoryComponent
    },
    {
      path: 'channel-list',
      component: ChannelComponent
    },
    {
      path: 'question-list',
      component: QuestionComponent
    },
    {
      path: 'question-detail-list',
      component: QuestionDetailComponent
    }
  ];