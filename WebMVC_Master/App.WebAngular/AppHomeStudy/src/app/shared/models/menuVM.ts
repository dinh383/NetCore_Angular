export interface IMenu {
    id?: string;
    text?: string;
    expanded?: boolean;
    routerLink?: string;
    items?: Menu[];
  
  }
export class Menu {
    id: string;
    text: string;
    expanded?: boolean;
    routerLink: string;
    items?: Menu[];
  
  }