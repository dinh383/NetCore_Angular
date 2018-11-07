import { SystemConstants } from '@app/core/common/system.constants';
import { BaseController } from '@app/core/common/baseController';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent extends BaseController implements OnInit {
  imgLogoPath:string;
  constructor() {
    super();
  }

  ngOnInit() {
   this.imgLogoPath = SystemConstants.BASE_API + "/images/admin-layout/userLogo.png"
  }

}
