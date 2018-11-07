import { DataService } from '@app/core/services/data.service';
import { SidebarMenuComponent } from '@app/shared/layout/sidebar-menu/sidebar-menu.component';
import { DxTextBoxModule, DxTreeViewModule } from 'devextreme-angular';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthenService } from '@app/core/services/authen.service';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [],
  providers: [AuthenService, DataService]
})
export class SidebarMenuModule { }
