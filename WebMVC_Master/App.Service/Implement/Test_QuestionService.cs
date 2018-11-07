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
    public class Test_QuestionService : ITest_QuestionService
    {
        private readonly ITest_QuestionRepository _questionRepository;
        public Test_QuestionService(ITest_QuestionRepository questionRepository)
        {
            this._questionRepository = questionRepository;
        }
        public Task<Test_Question> AddAsync(Test_Question entity)
        {
            entity.QuestionId = Guid.NewGuid();
            return _questionRepository.AddAsync(entity);
        }
        public Task<Test_Question> UpdateAsync(Test_Question entity)
        {
            return _questionRepository.UpdateAsync(entity);
        }
        public Task<Test_Question> DeleteAsync(Test_Question entity)
        {
            return _questionRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Test_Question>> ListAsync(Expression<Func<Test_Question, bool>> filter, Func<IQueryable<Test_Question>, IOrderedQueryable<Test_Question>> orderBy, Func<IQueryable<Test_Question>, IIncludableQueryable<Test_Question, object>> includeProperties)
        {
            return _questionRepository.ListAsync(filter, orderBy, includeProperties);
        }

        public Task<PaginatedItems<Test_Question>> ListAsync(int pageIndex, int pageSize, Expression<Func<Test_Question, bool>> filter, Func<IQueryable<Test_Question>, IOrderedQueryable<Test_Question>> orderBy, Func<IQueryable<Test_Question>, IIncludableQueryable<Test_Question, object>> includeProperties)
        {
            return _questionRepository.ListAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
        }

        public async Task<Test_Question> GetSingleByIdAsync(dynamic id)
        {
            return await _questionRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Test_Question> GetAll(string[] includes = null)
        {
            return _questionRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Test_Question> entities)
        {
            _questionRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Test_Question> entities)
        {
            return _questionRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Test_Question> entities)
        {
            _questionRepository.UpdateRange(entities);
        }

        public async Task<Test_Question> DeleteByIdAsync(dynamic id)
        {
            return await _questionRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Test_Question, bool>> where)
        {
            return _questionRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Test_Question> entities)
        {
            return _questionRepository.RemoveRangeAsync(entities);
        }

        public Test_Question GetSingleByCondition(Expression<Func<Test_Question, bool>> expression, string[] includes = null)
        {
            return _questionRepository.GetSingleByCondition(expression, includes);
        }

        public async Task<Test_Question> GetSingleByConditionAsync(Expression<Func<Test_Question, bool>> filter, Func<IQueryable<Test_Question>, IIncludableQueryable<Test_Question, object>> includeProperties = null)
        {
            return await _questionRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public async Task<bool> AnyAsync(Expression<Func<Test_Question, bool>> filter, Func<IQueryable<Test_Question>, IIncludableQueryable<Test_Question, object>> includeProperties = null)
        {
            return await _questionRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _questionRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _questionRepository.SaveChangesAsync();
        }


    }
}
