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

namespace App.Service.Implement
{
    public class Test_ExamQuestionDetailService : ITest_ExamQuestionDetailService
    {
        private readonly ITest_ExamQuestionDetailRepository _examQuestionDetailRepository;
        public Test_ExamQuestionDetailService(ITest_ExamQuestionDetailRepository examQuestionDetailRepository)
        {
            this._examQuestionDetailRepository = examQuestionDetailRepository;
        }
        public Task<Test_ExamQuestionDetail> AddAsync(Test_ExamQuestionDetail entity)
        {
            return _examQuestionDetailRepository.AddAsync(entity);
        }
        public Task<Test_ExamQuestionDetail> UpdateAsync(Test_ExamQuestionDetail entity)
        {
            return _examQuestionDetailRepository.UpdateAsync(entity);
        }
        public Task<Test_ExamQuestionDetail> DeleteAsync(Test_ExamQuestionDetail entity)
        {
            return _examQuestionDetailRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Test_ExamQuestionDetail>> ListAsync(Expression<Func<Test_ExamQuestionDetail, bool>> filter, Func<IQueryable<Test_ExamQuestionDetail>, IOrderedQueryable<Test_ExamQuestionDetail>> orderBy, Func<IQueryable<Test_ExamQuestionDetail>, IIncludableQueryable<Test_ExamQuestionDetail, object>> includeProperties)
        {
            return _examQuestionDetailRepository.ListAsync(filter, orderBy, includeProperties);
        }

        public Task<PaginatedItems<Test_ExamQuestionDetail>> ListAsync(int pageIndex, int pageSize, Expression<Func<Test_ExamQuestionDetail, bool>> filter, Func<IQueryable<Test_ExamQuestionDetail>, IOrderedQueryable<Test_ExamQuestionDetail>> orderBy, Func<IQueryable<Test_ExamQuestionDetail>, IIncludableQueryable<Test_ExamQuestionDetail, object>> includeProperties)
        {
            return _examQuestionDetailRepository.ListAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
        }

        public async Task<Test_ExamQuestionDetail> GetSingleByIdAsync(dynamic id)
        {
            return await _examQuestionDetailRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Test_ExamQuestionDetail> GetAll(string[] includes = null)
        {
            return _examQuestionDetailRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Test_ExamQuestionDetail> entities)
        {
            _examQuestionDetailRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Test_ExamQuestionDetail> entities)
        {
            return _examQuestionDetailRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Test_ExamQuestionDetail> entities)
        {
            _examQuestionDetailRepository.UpdateRange(entities);
        }

        public async Task<Test_ExamQuestionDetail> DeleteByIdAsync(dynamic id)
        {
            return await _examQuestionDetailRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Test_ExamQuestionDetail, bool>> where)
        {
            return _examQuestionDetailRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Test_ExamQuestionDetail> entities)
        {
            return _examQuestionDetailRepository.RemoveRangeAsync(entities);
        }

        public Test_ExamQuestionDetail GetSingleByCondition(Expression<Func<Test_ExamQuestionDetail, bool>> expression, string[] includes = null)
        {
            return _examQuestionDetailRepository.GetSingleByCondition(expression, includes);
        }

        public async Task<Test_ExamQuestionDetail> GetSingleByConditionAsync(Expression<Func<Test_ExamQuestionDetail, bool>> filter, Func<IQueryable<Test_ExamQuestionDetail>, IIncludableQueryable<Test_ExamQuestionDetail, object>> includeProperties = null)
        {
            return await _examQuestionDetailRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public async Task<bool> AnyAsync(Expression<Func<Test_ExamQuestionDetail, bool>> filter, Func<IQueryable<Test_ExamQuestionDetail>, IIncludableQueryable<Test_ExamQuestionDetail, object>> includeProperties = null)
        {
            return await _examQuestionDetailRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _examQuestionDetailRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _examQuestionDetailRepository.SaveChangesAsync();
        }


    }
}
