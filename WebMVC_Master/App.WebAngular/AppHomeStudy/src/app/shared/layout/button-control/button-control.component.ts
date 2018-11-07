import { BaseController } from '@app/core/common/baseController';
import { Component, OnInit, Input } from '@angular/core';
import { IButtonLinkModel } from '@app/shared/models/buttonLinkModel';


@Component({
  selector: 'app-button-control',
  templateUrl: './button-control.component.html',
  styleUrls: ['./button-control.component.css']
})
export class ButtonControlComponent extends BaseController implements OnInit {
  constructor() {
    super();
  }

  @Input() lstButtonLink: IButtonLinkModel[] = this.lstButtonLink;
  
  ngOnInit() {

    var $BTN_COMPACT = $('.btn-compact'),
      $BTN_CLOSE_COMPACT = $('.btn-close-compact'),
      $SHEET_BUTTON = $('.sheet-bottom');

    $(document).ready(function () {
      $BTN_COMPACT.on('click', function () {
        $SHEET_BUTTON.toggleClass('open-menu');
      });
      $BTN_CLOSE_COMPACT.on('click', function () {
        $SHEET_BUTTON.removeClass('open-menu');
      });
    });

  }

//   onAddPress() {
//     debugger;
//     alert('ButtonControlComponent');
// }

}
