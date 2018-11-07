
import { Component, OnInit, ViewChild } from '@angular/core';
import { BaseController } from '@app/core/common/baseController';
import { DxDataGridComponent } from 'devextreme-angular';
import { DataService } from '@app/core/services/data.service';
import * as AspNetData from "devextreme-aspnet-data";
import { SystemConstants } from '@app/core/common/system.constants';
import notify from 'devextreme/ui/notify';
import { TitlePopup } from '@app/shared/models/title-popup';
import { IButtonLinkModel } from '@app/shared/models/buttonLinkModel';
import { ButtonType } from '@app/shared/enums/buttonType';
import { methodType } from '@app/shared/enums/methodType';
import { CommonLib } from '@app/core/library/commonLib';
import { DataGrid } from '@app/core/library/dxDataGrid';
import { AuthenService } from '@app/core/services/authen.service';

@Component({
  selector: 'app-register-consultative',
  templateUrl: './register-consultative.component.html',
  styleUrls: ['./register-consultative.component.css']
})
export class RegisterConsultativeComponent extends BaseController implements OnInit {

  @ViewChild(DxDataGridComponent) dataGrid: DxDataGridComponent;
  titlePage: string = 'công ty';
  titlePopup: TitlePopup;
  dataSource: any;
  entity: any;
  popupVisible = false;
  popupVisibleDel = false;
  constructor(private _authenService: AuthenService) {
    super();
  }

  ngOnInit() {
    this.titlePopup = new TitlePopup(true, 'khách hàng');
    this.initGrid();
    this.onAddButtonLink();
    this.fileNameExport = CommonLib.getFileNameExport("Danh sách công ty");
  }
  //---------------Menu Footer ---------------

  onAddButtonLink() {
    let btnRegisterLearnTrial: IButtonLinkModel = {
      id: 2, buttonType: ButtonType.Add, label: "Đăng ký học thử", ordinal: 1, icon: "fa fa-address-card-o", visibility: true, disabled: true,
      handler: () => {
        this.registerLearnTrial();
      }
    }
    this.addNewButtonLink(btnRegisterLearnTrial);

    let btnRegisterClass: IButtonLinkModel = {
      id: 3, buttonType: ButtonType.Add, label: "Ghi danh học viên", ordinal: 1, icon: "fa fa-user-plus", visibility: true, disabled: true,
      handler: () => {
        this.registerClass();
      }
    }
    this.addNewButtonLink(btnRegisterClass);
  }

  registerLearnTrial() {
    alert('DK hoc thu')
  }
  registerClass() {
    alert('Ghi danh hoc')
  }
  onHidenButton() {
    let button: IButtonLinkModel = {
      buttonType: ButtonType.Edit,
      visibility: false
    }
    this.updateButtonLink(button);
  }
  //-----------
  initGrid() {
    this.dataSource = AspNetData.createStore({
      key: "registerId",
      loadUrl: SystemConstants.BASE_API + "api/registerConsultative/getAll",
      insertUrl: SystemConstants.BASE_API + "api/registerConsultative/InsertOnGrid",
      updateUrl: SystemConstants.BASE_API + "api/registerConsultative/UpdateOnGrid",
      deleteUrl: SystemConstants.BASE_API + "api/registerConsultative/DeleteOnGrid",
      onBeforeSend: this._authenService.getHeaderForGrid()
    });
  }
  onContentReady(e) {
    e.component.columnOption("command:edit", {
      visibleIndex: -1
    });
  }
}
