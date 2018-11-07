using App.Data.Entities;
using App.Data.IRepositories;
using App.Model.ViewModel;
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
    public class Resource_MagazineService : IResource_MagazineService
    {
        private readonly IResource_MagazineRepository _magazineRepository;
        public Resource_MagazineService(IResource_MagazineRepository magazineRepository)
        {
            this._magazineRepository = magazineRepository;
        }
        public Task<Resource_Magazine> AddAsync(Resource_Magazine entity)
        {
            return _magazineRepository.AddAsync(entity);
        }
        public Task<Resource_Magazine> UpdateAsync(Resource_Magazine entity)
        {
            return _magazineRepository.UpdateAsync(entity);
        }
        public Task<Resource_Magazine> DeleteAsync(Resource_Magazine entity)
        {
            return _magazineRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Resource_Magazine>> ListAsync(Expression<Func<Resource_Magazine, bool>> filter, Func<IQueryable<Resource_Magazine>, IOrderedQueryable<Resource_Magazine>> orderBy, Func<IQueryable<Resource_Magazine>, IIncludableQueryable<Resource_Magazine, object>> includeProperties)
        {
            return _magazineRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<Resource_Magazine> GetSingleByIdAsync(dynamic id)
        {
            return _magazineRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Resource_Magazine> GetAll(string[] includes = null)
        {
            return _magazineRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Resource_Magazine> entities)
        {
            _magazineRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Resource_Magazine> entities)
        {
            return _magazineRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Resource_Magazine> entities)
        {
            _magazineRepository.UpdateRange(entities);
        }

        public Task<Resource_Magazine> DeleteByIdAsync(dynamic id)
        {
            return _magazineRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Resource_Magazine, bool>> where)
        {
            return _magazineRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Resource_Magazine> entities)
        {
            return _magazineRepository.RemoveRangeAsync(entities);
        }

        public Resource_Magazine GetSingleByCondition(Expression<Func<Resource_Magazine, bool>> expression, string[] includes = null)
        {
            return _magazineRepository.GetSingleByCondition(expression);
        }

        public Task<Resource_Magazine> GetSingleByConditionAsync(Expression<Func<Resource_Magazine, bool>> filter, Func<IQueryable<Resource_Magazine>, IIncludableQueryable<Resource_Magazine, object>> includeProperties = null)
        {
            return _magazineRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public Task<bool> AnyAsync(Expression<Func<Resource_Magazine, bool>> filter, Func<IQueryable<Resource_Magazine>, IIncludableQueryable<Resource_Magazine, object>> includeProperties = null)
        {
            return _magazineRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _magazineRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _magazineRepository.SaveChangesAsync();
        }
    }
}
