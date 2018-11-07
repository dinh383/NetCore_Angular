using App.Infrastructure.SharedKernel;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace App.Service
{
    public interface IServiceCommon<TEntity>
        where TEntity : class
    {
        //GET LIST
        IEnumerable<TEntity> GetAll(string[] includes = null);

        Task<IEnumerable<TEntity>> ListAsync(
             Expression<Func<TEntity, bool>> filter = null,
             Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
             Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null);

        //Task<PaginatedItems<TEntity>> ListAsync(
        //    int pageIndex,
        //    int pageSize,
        //    Expression<Func<TEntity, bool>> filter,
        //    Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy,
        //    Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties);


        //ADD
        Task<TEntity> AddAsync(TEntity entity);
        void AddRange(IEnumerable<TEntity> entities);
        Task AddRangeAsync(IEnumerable<TEntity> entities);

        //UPDATE
        Task<TEntity> UpdateAsync(TEntity entity);
        void UpdateRange(IEnumerable<TEntity> entities);

        //DELETE
        Task<TEntity> DeleteAsync(TEntity entity);
        Task<TEntity> DeleteByIdAsync(dynamic id);
        Task DeleteMultiByConditionAsync(Expression<Func<TEntity, bool>> where);
        Task RemoveRangeAsync(IEnumerable<TEntity> entities);

        //GET SINGLE BY ID
        Task<TEntity> GetSingleByIdAsync(dynamic id);
        TEntity GetSingleByCondition(Expression<Func<TEntity, bool>> expression, string[] includes = null);
        Task<TEntity> GetSingleByConditionAsync(
           Expression<Func<TEntity, bool>> filter,
           Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null);
        Task<bool> AnyAsync(Expression<Func<TEntity, bool>> filter, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null);
        //SAVE
        int SaveChanges();
        Task<int> SaveChangesAsync();
    }
}
