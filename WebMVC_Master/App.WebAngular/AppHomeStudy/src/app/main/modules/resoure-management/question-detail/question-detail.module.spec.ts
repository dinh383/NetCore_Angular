import { QuestionDetailModule } from './question-detail.module';

describe('QuestionDetailModule', () => {
  let questionDetailModule: QuestionDetailModule;

  beforeEach(() => {
    questionDetailModule = new QuestionDetailModule();
  });

  it('should create an instance', () => {
    expect(questionDetailModule).toBeTruthy();
  });
});
