import { ButtonType } from "@app/shared/enums/buttonType";


export interface IButtonLinkModel {
  id?: string | number;
  buttonType?: ButtonType,
  label?: string;
  ordinal?: number;
  icon?: string;
  visibility?: boolean;
  disabled?: boolean;
  handler?: () => void;
  isCheckPermission?: boolean;
}

export class ButtonLinkModel implements IButtonLinkModel {
  id?: string | number;
  buttonType?: ButtonType;
  label?: string;
  ordinal?: number;
  icon?: string;
  visibility?: boolean;
  disabled?: boolean;
  handler: () => void;
  constructor(id: string | number, buttonType: ButtonType, label: string, ordinal: number, icon: string, visibility: boolean, disabled: boolean, handler: () => void) {
    this.id = id;
    this.buttonType = buttonType;
    this.label = label;
    this.ordinal = ordinal;
    this.icon = icon;
    this.visibility = visibility;
    this.disabled = disabled;
    this.handler = handler;
  }
}