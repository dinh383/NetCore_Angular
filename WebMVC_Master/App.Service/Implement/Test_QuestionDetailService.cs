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
    public class Test_QuestionDetailService : ITest_QuestionDetailService
    {
        private readonly ITest_QuestionDetailRepository _questionDetailRepository;
        public Test_QuestionDetailService(ITest_QuestionDetailRepository questionDetailRepository)
        {
            this._questionDetailRepository = questionDetailRepository;
        }
        public Task<Test_QuestionDetail> AddAsync(Test_QuestionDetail entity)
        {
            return _questionDetailRepository.AddAsync(entity);
        }
        public Task<Test_QuestionDetail> UpdateAsync(Test_QuestionDetail entity)
        {
            return _questionDetailRepository.UpdateAsync(entity);
        }
        public Task<Test_QuestionDetail> DeleteAsync(Test_QuestionDetail entity)
        {
            return _questionDetailRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Test_QuestionDetail>> ListAsync(Expression<Func<Test_QuestionDetail, bool>> filter, Func<IQueryable<Test_QuestionDetail>, IOrderedQueryable<Test_QuestionDetail>> orderBy, Func<IQueryable<Test_QuestionDetail>, IIncludableQueryable<Test_QuestionDetail, object>> includeProperties)
        {
            return _questionDetailRepository.ListAsync(filter, orderBy, includeProperties);
        }

        public Task<PaginatedItems<Test_QuestionDetail>> ListAsync(int pageIndex, int pageSize, Expression<Func<Test_QuestionDetail, bool>> filter, Func<IQueryable<Test_QuestionDetail>, IOrderedQueryable<Test_QuestionDetail>> orderBy, Func<IQueryable<Test_QuestionDetail>, IIncludableQueryable<Test_QuestionDetail, object>> includeProperties)
        {
            return _questionDetailRepository.ListAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
        }

        public async Task<Test_QuestionDetail> GetSingleByIdAsync(dynamic id)
        {
            return await _questionDetailRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Test_QuestionDetail> GetAll(string[] includes = null)
        {
            return _questionDetailRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Test_QuestionDetail> entities)
        {
            _questionDetailRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Test_QuestionDetail> entities)
        {
            return _questionDetailRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Test_QuestionDetail> entities)
        {
            _questionDetailRepository.UpdateRange(entities);
        }

        public async Task<Test_QuestionDetail> DeleteByIdAsync(dynamic id)
        {
            return await _questionDetailRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Test_QuestionDetail, bool>> where)
        {
            return _questionDetailRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Test_QuestionDetail> entities)
        {
            return _questionDetailRepository.RemoveRangeAsync(entities);
        }

        public Test_QuestionDetail GetSingleByCondition(Expression<Func<Test_QuestionDetail, bool>> expression, string[] includes = null)
        {
            return _questionDetailRepository.GetSingleByCondition(expression, includes);
        }

        public async Task<Test_QuestionDetail> GetSingleByConditionAsync(Expression<Func<Test_QuestionDetail, bool>> filter, Func<IQueryable<Test_QuestionDetail>, IIncludableQueryable<Test_QuestionDetail, object>> includeProperties = null)
        {
            return await _questionDetailRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public async Task<bool> AnyAsync(Expression<Func<Test_QuestionDetail, bool>> filter, Func<IQueryable<Test_QuestionDetail>, IIncludableQueryable<Test_QuestionDetail, object>> includeProperties = null)
        {
            return await _questionDetailRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _questionDetailRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _questionDetailRepository.SaveChangesAsync();
        }


    }
}
