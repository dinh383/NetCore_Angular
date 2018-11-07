import { Component, OnInit, ViewChild, Injectable } from '@angular/core';
import * as AspNetData from "devextreme-aspnet-data";
import { SystemConstants } from '@app/core/common/system.constants';
import { DxDataGridComponent } from 'devextreme-angular';
import { ResourceCategoryService } from '@app/main/shared/services/resource-category.service';
import { BaseController } from '@app/core/common/baseController';
import { ResourceChannelService } from '@app/main/shared/services/resource-channel.service';
import { AuthenService } from '@app/core/services/authen.service';

@Component({
  selector: 'app-video',
  templateUrl: './video.component.html',
  styleUrls: ['./video.component.css']
})

@Injectable()
export class VideoComponent extends BaseController implements OnInit {
  dataSource: any;
  channels: any[] = [];
  categories: any[] = [];
  events: Array<string> = [];
  constructor(private _categoryService: ResourceCategoryService,
    private _channelService: ResourceChannelService,
    private _authenService: AuthenService) {
    super();
  }
  @ViewChild(DxDataGridComponent) dataGrid: DxDataGridComponent;

  ngOnInit() {
    this.initGrid();
    this.getChannels();
  }

  initGrid() {
    this.dataSource = AspNetData.createStore({
      key: "lineId",
      loadUrl: SystemConstants.BASE_API + "api/video/getAll",
      insertUrl: SystemConstants.BASE_API + "api/video/InsertOnGrid",
      updateUrl: SystemConstants.BASE_API + "api/video/UpdateOnGrid",
      deleteUrl: SystemConstants.BASE_API + "api/video/DeleteOnGrid",
      onBeforeSend: this._authenService.getHeaderForGrid()
    });
  }

  getChannels() {
    this._categoryService.getCategories().subscribe(
      result => {
        this.categories = result.data;
      }
    )
    this._channelService.getChannels().subscribe(
      result => {
        this.channels = result.data;
      }
    )
  }

  onContentReady(e) {
    e.component.columnOption("command:edit", {
      visibleIndex: -1
    });
  }
}
