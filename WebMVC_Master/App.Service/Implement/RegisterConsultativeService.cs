using App.Data.Entities;
using App.Data.IRepositories;
using App.Service.Interface;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace App.Service.Implement
{
    public class RegisterConsultativeService : IRegisterConsultativeService
    {
        private readonly IRegisterConsultativeRepository _registerConsultativeRepository;
        public RegisterConsultativeService(IRegisterConsultativeRepository registerConsultativeRepository)
        {
            this._registerConsultativeRepository = registerConsultativeRepository;
        }
        public Task<RegisterConsultative> AddAsync(RegisterConsultative entity)
        {
            return _registerConsultativeRepository.AddAsync(entity);
        }
        public Task<RegisterConsultative> UpdateAsync(RegisterConsultative entity)
        {
            return _registerConsultativeRepository.UpdateAsync(entity);
        }
        public Task<RegisterConsultative> DeleteAsync(RegisterConsultative entity)
        {
            return _registerConsultativeRepository.DeleteAsync(entity);
        }

        public Task<IEnumerable<RegisterConsultative>> ListAsync(Expression<Func<RegisterConsultative, bool>> filter, Func<IQueryable<RegisterConsultative>, IOrderedQueryable<RegisterConsultative>> orderBy, Func<IQueryable<RegisterConsultative>, IIncludableQueryable<RegisterConsultative, object>> includeProperties)
        {
            return _registerConsultativeRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<RegisterConsultative> GetSingleByIdAsync(dynamic id)
        {
            return _registerConsultativeRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<RegisterConsultative> GetAll(string[] includes = null)
        {
            return _registerConsultativeRepository.GetAll();
        }

        public void AddRange(IEnumerable<RegisterConsultative> entities)
        {
            _registerConsultativeRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<RegisterConsultative> entities)
        {
            return _registerConsultativeRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<RegisterConsultative> entities)
        {
            _registerConsultativeRepository.UpdateRange(entities);
        }

        public Task<RegisterConsultative> DeleteByIdAsync(dynamic id)
        {
            return _registerConsultativeRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<RegisterConsultative, bool>> where)
        {
            return _registerConsultativeRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<RegisterConsultative> entities)
        {
            return _registerConsultativeRepository.RemoveRangeAsync(entities);
        }

        public RegisterConsultative GetSingleByCondition(Expression<Func<RegisterConsultative, bool>> expression, string[] includes = null)
        {
            return _registerConsultativeRepository.GetSingleByCondition(expression, includes);
        }
        public Task<RegisterConsultative> GetSingleByConditionAsync(Expression<Func<RegisterConsultative, bool>> filter, Func<IQueryable<RegisterConsultative>, IIncludableQueryable<RegisterConsultative, object>> includeProperties = null)
        {
            return _registerConsultativeRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public Task<bool> AnyAsync(Expression<Func<RegisterConsultative, bool>> filter, Func<IQueryable<RegisterConsultative>, IIncludableQueryable<RegisterConsultative, object>> includeProperties = null)
        {
            return _registerConsultativeRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _registerConsultativeRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _registerConsultativeRepository.SaveChangesAsync();
        }


    }
}
