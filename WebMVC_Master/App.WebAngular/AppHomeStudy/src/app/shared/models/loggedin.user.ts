export class LoggedInUser {
    constructor(token: string, userName: string, fullName: string, email: string, avatar: string, roles: any, permissions: any
    ) {
        this.token = token;
        this.fullName = fullName;
        this.userName = userName;
        this.email = email;
        this.avatar = avatar;
        this.roles = roles;
        this.permissions = permissions;
    }
    public id: string;
    public token: string;
    public userName: string;
    public fullName: string;
    public email: string;
    public avatar: string;
    public permissions: any;
    public roles: any;
}

export interface IUserLoginModel {
    userName?: string;
    password?: string;
}