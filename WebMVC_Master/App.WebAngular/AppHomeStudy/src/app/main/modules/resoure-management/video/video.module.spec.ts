import { VideoModule } from '@app/main/modules/resoure-management/video/video.module';

describe('VideoModule', () => {
  let videoModule: VideoModule;

  beforeEach(() => {
    videoModule = new VideoModule();
  });

  it('should create an instance', () => {
    expect(videoModule).toBeTruthy();
  });
});
