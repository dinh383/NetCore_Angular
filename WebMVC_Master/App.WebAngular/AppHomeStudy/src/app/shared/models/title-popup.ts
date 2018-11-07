export class TitlePopup {
    Title: String;
    ButtonName:String;

    constructor(IsNew:Boolean,Title:String){
        this.Title = IsNew ? ("Thêm " + Title) : ("Chỉnh sửa " + Title);
        this.ButtonName = IsNew ? "Thêm":"Cập nhật";
    }
}

