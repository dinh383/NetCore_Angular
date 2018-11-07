
import { HostListener } from '@angular/core';
import { IButtonLinkModel } from '@app/shared/models/buttonLinkModel';
import { ButtonType } from '@app/shared/enums/buttonType';

export class BaseController {
    arrPageSize: any;
    pageSize: number;
    heightGrid: number;
    isShowFilterRow: boolean;
    isShowHeaderFilter: boolean;
    isGroupPanel: boolean;
    isExportData: boolean;
    isExportSelectedData: boolean;
    isSearchPanel: boolean;
    pageIndex: number;
    isShowPageSizeSelector: boolean;
    heightReduce: number;
    heightMenu: number;
    lstButtonLink: IButtonLinkModel[];
    widthSidebar: number;
    groupPanelText: string;
    placeholderSearch: string;

    window: any;
    auto: any;
    fileNameExport: string;
    constructor(heightReduce?: number) {
        this.heightReduce = heightReduce != null ? heightReduce : 162;
        this.setHeightGrid(this.heightReduce);
        this.initParam();
        this.initButtonLink();
    }
    initParam() {
        this.arrPageSize = [20, 50, 100];
        this.pageSize = 10;
        this.isShowFilterRow = true;
        this.isShowHeaderFilter = true;
        this.isGroupPanel = true;
        this.isExportSelectedData = true;
        this.isSearchPanel = true;
        this.isExportData = true;
        this.pageIndex = 0;
        this.isShowPageSizeSelector = true;
        this.heightMenu = window.innerHeight - 228;
        this.widthSidebar = 230;
        this.groupPanelText = "Kéo cột bạn muốn gom nhóm vào đây";
        this.placeholderSearch = "Tìm kiếm";
    }
    //---------------Menu Footer ---------------
    initButtonLink() {
        this.lstButtonLink = [];
    }

    addNewButtonLink(buttonLink: IButtonLinkModel) {
        this.lstButtonLink.push(buttonLink);
        this.getListButtonLink();
    }

    updateButtonLink(buttonLink: IButtonLinkModel) {
        let buttonChange: IButtonLinkModel = (this.lstButtonLink.filter((item: IButtonLinkModel) => {
            return (item.buttonType === buttonLink.buttonType);
        }))[0];
        if (buttonChange) {
            buttonChange.visibility = buttonLink.visibility;
            buttonChange.disabled = buttonLink.disabled;
            buttonChange.icon = buttonLink.icon;
            buttonChange.label = buttonLink.label;
            buttonChange.ordinal = buttonLink.ordinal;
            buttonChange.handler = buttonLink.handler;
        }
        this.getListButtonLink();
    }

    setVisibleButton(buttonLink: IButtonLinkModel, isValue: boolean) {
        let buttonChange: IButtonLinkModel = (this.lstButtonLink.filter((item: IButtonLinkModel) => {
            return (item.buttonType === buttonLink.buttonType);
        }))[0];
        if (buttonChange) {
            buttonChange.visibility = isValue;
        }
        this.getListButtonLink();
    }

    getListButtonLink() {
        this.lstButtonLink = this.lstButtonLink.filter((item: IButtonLinkModel) => {
            return (item.visibility === true);
        });
    }
    /**
     * Phân quyền button theo chức năng
     * @param lstActions 
     */
    checkPermissionAction(lstActions: string[]) {
        for (let button of this.lstButtonLink) {
            if (button.isCheckPermission) {
                if (lstActions.indexOf(ButtonType[button.buttonType].toLowerCase()) === -1) {
                    button.visibility = false;
                }
            }

        }
        this.getListButtonLink();
    }
    /**
     * Xử lý sự kiện khi nhấn vào 1 button
     * @param button 
     */
    handlerAction(button: IButtonLinkModel) {

        button.handler.call(button.handler);
    }
    //---------------#End Menu Footer ---------------

    setHeightGrid(heightReduce: number = 162) {
        let heightWindow = window.innerHeight;
        this.heightGrid = heightWindow - heightReduce;
        this.heightMenu = window.innerHeight - 228;
    }

    @HostListener('window:resize', ['$event'])
    onResize(event) {
        this.setHeightGrid(this.heightReduce);
    }
}
