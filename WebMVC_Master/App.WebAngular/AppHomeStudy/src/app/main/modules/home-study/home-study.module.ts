import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeStudyComponent } from '@app/main/modules/home-study/home-study.component';
import { RegisterConsultativeModule } from '@app/main/modules/home-study/register-consultative/register-consultative.module';
import { RouterModule } from '@angular/router';
import { homeStudyRoutes } from '@app/main/modules/home-study/home-study.routing';

@NgModule({
  imports: [
    CommonModule,
    RegisterConsultativeModule,
    RouterModule.forChild(homeStudyRoutes)
  ],
  declarations: [
    HomeStudyComponent
  ]
})
export class HomeStudyModule { }
