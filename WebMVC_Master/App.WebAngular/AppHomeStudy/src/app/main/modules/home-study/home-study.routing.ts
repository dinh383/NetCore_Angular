import { Routes } from "@angular/router";
import { VideoComponent } from "@app/main/modules/resoure-management/video/video.component";
import { HomeStudyComponent } from "@app/main/modules/home-study/home-study.component";
import { RegisterConsultativeComponent } from "@app/main/modules/home-study/register-consultative/register-consultative.component";

export const homeStudyRoutes: Routes = [
    {
      path: '',
      component: RegisterConsultativeComponent,
      children: [
        {
          path: 'register-list',
          component: RegisterConsultativeComponent
        }
      ]
    },
  ];