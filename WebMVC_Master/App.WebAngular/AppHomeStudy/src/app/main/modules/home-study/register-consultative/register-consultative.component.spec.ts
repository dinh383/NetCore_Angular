import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegisterConsultativeComponent } from '@app/main/modules/home-study/register-consultative/register-consultative.component';

describe('RegisterConsultativeComponent', () => {
  let component: RegisterConsultativeComponent;
  let fixture: ComponentFixture<RegisterConsultativeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegisterConsultativeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegisterConsultativeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
