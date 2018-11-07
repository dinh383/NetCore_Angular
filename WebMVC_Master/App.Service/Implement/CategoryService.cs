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
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;
        public CategoryService(ICategoryRepository categoryRepository)
        {
            this._categoryRepository = categoryRepository;
        }
        public Task<Category> AddAsync(Category entity)
        {
            return _categoryRepository.AddAsync(entity);
        }
        public Task<Category> UpdateAsync(Category entity)
        {
            return _categoryRepository.UpdateAsync(entity);
        }
        public Task<Category> DeleteAsync(Category entity)
        {
            return _categoryRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Category>> ListAsync(Expression<Func<Category, bool>> filter, Func<IQueryable<Category>, IOrderedQueryable<Category>> orderBy, Func<IQueryable<Category>, IIncludableQueryable<Category, object>> includeProperties)
        {
            return _categoryRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<Category> GetSingleByIdAsync(dynamic id)
        {
            return _categoryRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Category> GetAll(string[] includes = null)
        {
            return _categoryRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Category> entities)
        {
            _categoryRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Category> entities)
        {
            return _categoryRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Category> entities)
        {
            _categoryRepository.UpdateRange(entities);
        }

        public Task<Category> DeleteByIdAsync(dynamic id)
        {
            return _categoryRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Category, bool>> where)
        {
            return _categoryRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Category> entities)
        {
            return _categoryRepository.RemoveRangeAsync(entities);
        }

        public Category GetSingleByCondition(Expression<Func<Category, bool>> expression, string[] includes = null)
        {
            return _categoryRepository.GetSingleByCondition(expression, includes);
        }

        public Task<Category> GetSingleByConditionAsync(Expression<Func<Category, bool>> filter, Func<IQueryable<Category>, IIncludableQueryable<Category, object>> includeProperties = null)
        {
            return _categoryRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public Task<bool> AnyAsync(Expression<Func<Category, bool>> filter, Func<IQueryable<Category>, IIncludableQueryable<Category, object>> includeProperties = null)
        {
            return _categoryRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _categoryRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _categoryRepository.SaveChangesAsync();
        }


    }
}
