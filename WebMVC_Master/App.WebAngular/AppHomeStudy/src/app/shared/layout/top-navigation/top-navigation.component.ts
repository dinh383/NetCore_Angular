
import { Component, OnInit } from '@angular/core';
import notify from 'devextreme/ui/notify';
import { BaseController } from '@app/core/common/baseController';
import { DataService } from '@app/core/services/data.service';
import { TitlePopup } from '@app/shared/models/title-popup';
import { SystemConstants } from '@app/core/common/system.constants';
import { UrlConstants } from '@app/core/common/url.constants';


@Component({
  selector: 'app-top-navigation',
  templateUrl: './top-navigation.component.html',
  styleUrls: ['./top-navigation.component.css']
})
export class TopNavigationComponent extends BaseController implements OnInit {
  config: string;
  isVisibleChangePassword: boolean;
  userChangePasswordVM: any;
  titlePopup: any;
  constructor(private _dataService: DataService) {
    super();
  }

  ngOnInit() {
    this.config = "Cài đặt";
    this.isVisibleChangePassword = false;
    this.titlePopup = new TitlePopup(false, 'mật khẩu');
    this.initPasswordVM();
  }

  initPasswordVM() {
    this.userChangePasswordVM = {
      oldPassword: null,
      newPassword: null,
      confirmPassword: null
    }
  }
  onClick() {
    let widthWindow = window.innerHeight;

    var $BODY = $('body'),
      $MENU_TOGGLE = $('#menu_toggle'),
      $SIDEBAR_MENU = $('#sidebar-menu'),
      $SIDEBAR_FOOTER = $('.sidebar-footer'),
      $LEFT_COL = $('.left_col'),
      $RIGHT_COL = $('.right_col'),
      $NAV_MENU = $('.nav_menu'),
      $FOOTER = $('footer');

    if ($BODY.hasClass('nav-md')) {
      if (widthWindow > 602) {
        $('.scroll-view').hide();
      }

      $SIDEBAR_MENU.find('li.active ul').hide();
      $SIDEBAR_MENU.find('li.active').addClass('active-sm').removeClass('active');
    } else {
      $('.scroll-view').show();
      $SIDEBAR_MENU.find('li.active-sm ul').show();
      $SIDEBAR_MENU.find('li.active-sm').addClass('active').removeClass('active-sm');
    }

    $BODY.toggleClass('nav-md nav-sm');
  }

  logout() {
    localStorage.removeItem(SystemConstants.CURRENT_USER);
    window.location.reload();
    window.location.href = window.location.origin + "/#" + UrlConstants.LOGIN;
  }
  showPopupChangePass() {
    // return this._dataService.get('api/report/ReportRevenuesGeneral').subscribe((response: any) => {
    //   debugger;
    //   alert(SystemConstants.BASE_API + response.message);
    //   window.open(SystemConstants.BASE_API + response.message);
    // });
    this.initPasswordVM();
    this.isVisibleChangePassword = true;
  }
  changePassword() {
    if (this.isPasswordValid()) {
      return this._dataService.put('api/AppUser/ChangePassword', this.userChangePasswordVM).subscribe((response: any) => {
        debugger;
        if (response.userName) {
          notify("Đổi mật khẩu thành công", "success", 1000);
          this.isVisibleChangePassword = false;
        } else {
          notify("Đổi mật khẩu không thành công", "error", 1000);
        }

      }, error => this._dataService.handleError(error));
    } else {
      notify("Mật khẩu mới và mật khẩu xác nhận không trùng nhau!", "error", 1000);
    }

  }
  isPasswordValid(): boolean {
    return this.userChangePasswordVM.newPassword === this.userChangePasswordVM.confirmPassword;
  }
  cancelPopup() {
    this.isVisibleChangePassword = false;
  }
}
