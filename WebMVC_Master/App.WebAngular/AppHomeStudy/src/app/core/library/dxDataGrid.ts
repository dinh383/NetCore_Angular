
import { DxDataGridComponent } from 'devextreme-angular';

export class DataGrid {
    // @ViewChild(DxDataGridComponent) dataGrid: DxDataGridComponent;
    constructor() {

    }

    reloadDataSource(dataGrid: DxDataGridComponent) {
        dataGrid.instance.getDataSource().reload();
    }
}