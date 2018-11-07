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
    public class Test_ExamStructureService : ITest_ExamStructureService
    {
        private readonly ITest_ExamStructureRepository _examStructureRepository;
        public Test_ExamStructureService(ITest_ExamStructureRepository examStructureRepository)
        {
            this._examStructureRepository = examStructureRepository;
        }
        public Task<Test_ExamStructure> AddAsync(Test_ExamStructure entity)
        {
            return _examStructureRepository.AddAsync(entity);
        }
        public Task<Test_ExamStructure> UpdateAsync(Test_ExamStructure entity)
        {
            return _examStructureRepository.UpdateAsync(entity);
        }
        public Task<Test_ExamStructure> DeleteAsync(Test_ExamStructure entity)
        {
            return _examStructureRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Test_ExamStructure>> ListAsync(Expression<Func<Test_ExamStructure, bool>> filter, Func<IQueryable<Test_ExamStructure>, IOrderedQueryable<Test_ExamStructure>> orderBy, Func<IQueryable<Test_ExamStructure>, IIncludableQueryable<Test_ExamStructure, object>> includeProperties)
        {
            return _examStructureRepository.ListAsync(filter, orderBy, includeProperties);
        }

        public Task<PaginatedItems<Test_ExamStructure>> ListAsync(int pageIndex, int pageSize, Expression<Func<Test_ExamStructure, bool>> filter, Func<IQueryable<Test_ExamStructure>, IOrderedQueryable<Test_ExamStructure>> orderBy, Func<IQueryable<Test_ExamStructure>, IIncludableQueryable<Test_ExamStructure, object>> includeProperties)
        {
            return _examStructureRepository.ListAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
        }

        public async Task<Test_ExamStructure> GetSingleByIdAsync(dynamic id)
        {
            return await _examStructureRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Test_ExamStructure> GetAll(string[] includes = null)
        {
            return _examStructureRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Test_ExamStructure> entities)
        {
            _examStructureRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Test_ExamStructure> entities)
        {
            return _examStructureRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Test_ExamStructure> entities)
        {
            _examStructureRepository.UpdateRange(entities);
        }

        public async Task<Test_ExamStructure> DeleteByIdAsync(dynamic id)
        {
            return await _examStructureRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Test_ExamStructure, bool>> where)
        {
            return _examStructureRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Test_ExamStructure> entities)
        {
            return _examStructureRepository.RemoveRangeAsync(entities);
        }

        public Test_ExamStructure GetSingleByCondition(Expression<Func<Test_ExamStructure, bool>> expression, string[] includes = null)
        {
            return _examStructureRepository.GetSingleByCondition(expression, includes);
        }

        public async Task<Test_ExamStructure> GetSingleByConditionAsync(Expression<Func<Test_ExamStructure, bool>> filter, Func<IQueryable<Test_ExamStructure>, IIncludableQueryable<Test_ExamStructure, object>> includeProperties = null)
        {
            return await _examStructureRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public async Task<bool> AnyAsync(Expression<Func<Test_ExamStructure, bool>> filter, Func<IQueryable<Test_ExamStructure>, IIncludableQueryable<Test_ExamStructure, object>> includeProperties = null)
        {
            return await _examStructureRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _examStructureRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _examStructureRepository.SaveChangesAsync();
        }


    }
}
