import { environment } from "environments/environment.prod";

export class SystemConstants {
    public static CURRENT_USER = "CURRENT_USER";
    public static TIME_NOTIFY: number = 1500;
    public static BASE_API = environment.baseUrl
}

