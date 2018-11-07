import { UtilityService } from '@app/core/services/utility.service';
import { AuthenService } from '@app/core/services/authen.service';
import { DxTextBoxModule, DxTreeViewModule } from 'devextreme-angular';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { mainRoutes } from "@app/main/main.routes";
import { RouterModule } from '@angular/router';
import { ResoureManagementModule } from '@app/main/modules/resoure-management/resoure-management.module';
import { MainComponent } from '@app/main/main.component';
import { SidebarMenuModule } from '@app/shared/layout/sidebar-menu/sidebar-menu.module';
import { TopNavigationModule } from '@app/shared/layout/top-navigation/top-navigation.module';
import { SidebarMenuComponent } from '@app/shared/layout/sidebar-menu/sidebar-menu.component';

@NgModule({
  imports: [
    CommonModule,
    DxTextBoxModule,
    DxTreeViewModule,
    SidebarMenuModule,
    TopNavigationModule,
    ResoureManagementModule,
    RouterModule.forChild(mainRoutes)
  ],
  declarations: [
    SidebarMenuComponent,
    MainComponent
  ],
  entryComponents: [],
  providers: [AuthenService, UtilityService]
})
export class MainModule { }
