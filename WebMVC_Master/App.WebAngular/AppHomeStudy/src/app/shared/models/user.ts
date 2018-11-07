export class User {
    lineID: string;
    userID: number;
    userName: string;
    password: string;
    functionID: string;
    groupID?: any;
    fullName: string;
    firstName?: any;
    lastName?: any;
    sex: boolean;
    cellPhone?: any;
    email?: any;
    countryID?: any;
    provinceID?: any;
    districtID?: any;
    address?: any;
    buid: string;
    stop: boolean;
    createDate: Date;
    createByUser?: any;
    updtDate?: any;
    updtByUser?: any;
    action:String

    constructor(action:String) {
        this.action = action;
    }
}