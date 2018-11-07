import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResoureManagementComponent } from '@app/main/modules/resoure-management/resoure-management.component';

describe('ResoureManagementComponent', () => {
  let component: ResoureManagementComponent;
  let fixture: ComponentFixture<ResoureManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResoureManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResoureManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
