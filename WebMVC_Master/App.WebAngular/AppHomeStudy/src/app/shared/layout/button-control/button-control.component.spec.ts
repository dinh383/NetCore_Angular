import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ButtonControlComponent } from '@app/shared/layout/button-control/button-control.component';

describe('ButtonControlComponent', () => {
  let component: ButtonControlComponent;
  let fixture: ComponentFixture<ButtonControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ButtonControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ButtonControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
