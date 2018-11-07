using App.Data.Entities;
using App.Data.IRepositories;
using App.Infrastructure.SharedKernel;
using App.Service.Interface;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using App.Model.ViewModel;

namespace App.Service.Implement
{
    public class Test_ExamService : ITest_ExamService
    {
        private readonly ITest_ExamRepository _examRepository;
        private readonly ITest_ExamStructureRepository _examStructureRepository;
        private readonly ITest_QuestionRepository _questionRepository;
        public Test_ExamService(ITest_ExamRepository examRepository,
            ITest_ExamStructureRepository examStructureRepository, ITest_QuestionRepository questionRepository)
        {
            this._examRepository = examRepository;
            this._examStructureRepository = examStructureRepository;
            this._questionRepository = questionRepository;
        }
        #region Function Extensions
        public async Task<QuestionVideoModel> GetInfoExamTest(int videoLineId)
        {
            var examStructure = await _examStructureRepository.GetSingleByConditionAsync(n => n.VideoLineId == videoLineId);
            if (examStructure != null)
            {
                var questionIds = examStructure.QuestionLineId.Split(";").ToList();
                var exam = new Test_Exam()
                {
                    ExamId = Guid.NewGuid(),
                    ExamName = "User 1 test",
                    TotalScore = 0,
                    QtyCorrect = 0,
                    QtyIncorrect = 0
                };
                var result = await _questionRepository
                 .ListAsync(null, null,
                 z => z.Include(i => i.QuestionDetails)
                 .Include(i => i.ExamQuestionDetails)
                 //.Include(i => i.AppUser)
                 );
                var questions = (from question in result
                                 where questionIds.Contains(question.LineId.ToString())
                                 select question
                                 ).OrderBy(n => n.Order).ToList();
                QuestionVideoModel questionVideo = new QuestionVideoModel()
                {
                    Exam = exam,
                    //ExamStructure = examStructure,
                    Questions = questions
                };
                return questionVideo;
            }
            return new QuestionVideoModel();
        }

        public void BulkInsert(IList<Test_Exam> entities)
        {
            _examRepository.BulkInsert(entities);
        }

        public Task BulkInsertAsync(IList<Test_Exam> entities)
        {
            return _examRepository.BulkInsertAsync(entities);
        }

        public Task BulkInsertOrUpdateAsync(IList<Test_Exam> entities)
        {
            return _examRepository.BulkInsertOrUpdateAsync(entities);
        }

        public Task BulkUpdateAsync(IList<Test_Exam> entities)
        {
            return _examRepository.BulkUpdateAsync(entities);
        }

        public Task BulkDeleteAsync(IList<Test_Exam> entities)
        {
            return _examRepository.BulkDeleteAsync(entities);
        }

        #endregion Function Extensions
        #region Function Common
        public Task<Test_Exam> AddAsync(Test_Exam entity)
        {
            return _examRepository.AddAsync(entity);
        }
        public Task<Test_Exam> UpdateAsync(Test_Exam entity)
        {
            return _examRepository.UpdateAsync(entity);
        }
        public Task<Test_Exam> DeleteAsync(Test_Exam entity)
        {
            return _examRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Test_Exam>> ListAsync(Expression<Func<Test_Exam, bool>> filter, Func<IQueryable<Test_Exam>, IOrderedQueryable<Test_Exam>> orderBy, Func<IQueryable<Test_Exam>, IIncludableQueryable<Test_Exam, object>> includeProperties)
        {
            return _examRepository.ListAsync(filter, orderBy, includeProperties);
        }

        public Task<PaginatedItems<Test_Exam>> ListAsync(int pageIndex, int pageSize, Expression<Func<Test_Exam, bool>> filter, Func<IQueryable<Test_Exam>, IOrderedQueryable<Test_Exam>> orderBy, Func<IQueryable<Test_Exam>, IIncludableQueryable<Test_Exam, object>> includeProperties)
        {
            return _examRepository.ListAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
        }

        public async Task<Test_Exam> GetSingleByIdAsync(dynamic id)
        {
            return await _examRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Test_Exam> GetAll(string[] includes = null)
        {
            return _examRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Test_Exam> entities)
        {
            _examRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Test_Exam> entities)
        {
            return _examRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Test_Exam> entities)
        {
            _examRepository.UpdateRange(entities);
        }

        public async Task<Test_Exam> DeleteByIdAsync(dynamic id)
        {
            return await _examRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Test_Exam, bool>> where)
        {
            return _examRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Test_Exam> entities)
        {
            return _examRepository.RemoveRangeAsync(entities);
        }

        public Test_Exam GetSingleByCondition(Expression<Func<Test_Exam, bool>> expression, string[] includes = null)
        {
            return _examRepository.GetSingleByCondition(expression, includes);
        }

        public async Task<Test_Exam> GetSingleByConditionAsync(Expression<Func<Test_Exam, bool>> filter, Func<IQueryable<Test_Exam>, IIncludableQueryable<Test_Exam, object>> includeProperties = null)
        {
            return await _examRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public async Task<bool> AnyAsync(Expression<Func<Test_Exam, bool>> filter, Func<IQueryable<Test_Exam>, IIncludableQueryable<Test_Exam, object>> includeProperties = null)
        {
            return await _examRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _examRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _examRepository.SaveChangesAsync();
        }




        #endregion Function Common

    }
}
