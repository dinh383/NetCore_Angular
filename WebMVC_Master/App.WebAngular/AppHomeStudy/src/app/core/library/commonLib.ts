export class CommonLib {
    public static getDateNow(date: any, charFormat: string): string {
        var dateNow = new Date(date);
        var day = ("0" + dateNow.getDate()).slice(-2);
        var month = ("0" + (dateNow.getMonth() + 1)).slice(-2);
        var year = dateNow.getFullYear();
        var datestring = year + charFormat + month + charFormat + day;
        return datestring;
    }
    public static getDateNowDMY(date: any, charFormat: string): string {
        var dateNow = new Date(date);
        var day = ("0" + dateNow.getDate()).slice(-2);
        var month = ("0" + (dateNow.getMonth() + 1)).slice(-2);
        var year = dateNow.getFullYear();
        var datestring = day + charFormat + month + charFormat + year;
        return datestring;
    }
    /**
     * Lấy tên file export ra theo thời gian
     * @param fileName 
     */
    public static getFileNameExport(fileName: string): string {
        fileName = fileName + "_" + this.getDateNowDMY(new Date(), "-");
        return fileName;
    }
}