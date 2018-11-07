import { HomeStudyModule } from '@app/main/modules/home-study/home-study.module';

describe('HomeStudyModule', () => {
  let homeStudyModule: HomeStudyModule;

  beforeEach(() => {
    homeStudyModule = new HomeStudyModule();
  });

  it('should create an instance', () => {
    expect(homeStudyModule).toBeTruthy();
  });
});
