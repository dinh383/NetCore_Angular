import { ResoureManagementModule } from '@app/main/modules/resoure-management/resoure-management.module';

describe('ResoureManagementModule', () => {
  let resoureManagementModule: ResoureManagementModule;

  beforeEach(() => {
    resoureManagementModule = new ResoureManagementModule();
  });

  it('should create an instance', () => {
    expect(resoureManagementModule).toBeTruthy();
  });
});
