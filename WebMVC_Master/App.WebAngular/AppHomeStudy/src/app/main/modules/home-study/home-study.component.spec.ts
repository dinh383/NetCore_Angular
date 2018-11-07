import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HomeStudyComponent } from '@app/main/modules/home-study/home-study.component';

describe('HomeStudyComponent', () => {
  let component: HomeStudyComponent;
  let fixture: ComponentFixture<HomeStudyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HomeStudyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HomeStudyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
