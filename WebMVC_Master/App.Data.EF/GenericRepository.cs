using App.Infrastructure.Interface;
using App.Infrastructure.SharedKernel;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using App.Configuaration.ConfigCommon;
using EFCore.BulkExtensions;

namespace App.Data.EF
{
    public class GenericRepository<TEntity> : IRepository<TEntity>
     where TEntity : class //DomainEntity<int>
    {
        internal DbContext _context;
        internal DbSet<TEntity> _dbSet;

        public GenericRepository(DbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _dbSet = _context.Set<TEntity>();
        }

        /// <summary>
        /// GET LIST
        /// </summary>
        /// <param name="includes"></param>
        /// <returns></returns>
        #region GET LIST
        public virtual IEnumerable<TEntity> GetAll(string[] includes = null)
        {
            //HANDLE INCLUDES FOR ASSOCIATED OBJECTS IF APPLICABLE
            if (includes != null && includes.Count() > 0)
            {
                var query = _context.Set<TEntity>().Include(includes.First());
                foreach (var include in includes.Skip(1))
                    query = query.Include(include);
                return query.AsQueryable();
            }
            return _context.Set<TEntity>().AsQueryable();
        }
        public virtual async Task<IReadOnlyList<TEntity>> ListAsync(Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            params Expression<Func<TEntity, object>>[] includeProperties)
        {
            var query = _dbSet.AsNoTracking();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (includeProperties != null)
            {
                foreach (var includeProperty in includeProperties)
                {
                    query = query.Include(includeProperty);
                }
            }

            if (orderBy != null)
            {
                return await orderBy(query).ToListAsync();
            }
            else
            {
                return await query.ToListAsync();
            }
        }

        public virtual async Task<IEnumerable<TEntity>> ListAsync(
             Expression<Func<TEntity, bool>> filter = null,
             Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
             Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null)
        {
            var query = _dbSet.AsNoTracking();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (includeProperties != null)
            {
                query = includeProperties(query);
            }

            if (orderBy != null)
            {
                return await orderBy(query).ToListAsync();
            }
            else
            {
                return await query.ToListAsync();
            }
        }

        public virtual async Task<IReadOnlyList<TEntity>> ListAsync(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null)
        {
            var query = _dbSet.AsNoTracking();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (orderBy != null)
            {
                return await orderBy(query).ToListAsync();
            }

            return await query.ToListAsync();
        }

        public virtual async Task<PaginatedItems<TEntity>> ListAsync(
            int pageIndex,
            int pageSize,
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null)
        {
            List<TEntity> result;
            var query = _dbSet.AsNoTracking();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (includeProperties != null)
            {
                query = includeProperties(query);
            }

            var projectTotal = query.Count();

            if (orderBy != null)
            {
                result = await orderBy(query).Paginate(pageIndex, pageSize).ToListAsync();
            }
            else
            {
                result = await query.Paginate(pageIndex, pageSize).ToListAsync();
            }
            return new PaginatedItems<TEntity>(pageIndex, pageSize, projectTotal, result);
        }
        public virtual IEnumerable<TEntity> GetMultiPaging(Expression<Func<TEntity, bool>> predicate, out int total, int index = 0, int size = 20, string[] includes = null)
        {
            int skipCount = index * size;
            IQueryable<TEntity> _resetSet;

            //HANDLE INCLUDES FOR ASSOCIATED OBJECTS IF APPLICABLE
            if (includes != null && includes.Count() > 0)
            {
                var query = _context.Set<TEntity>().Include(includes.First());
                foreach (var include in includes.Skip(1))
                    query = query.Include(include);
                _resetSet = predicate != null ? query.Where<TEntity>(predicate).AsQueryable() : query.AsQueryable();
            }
            else
            {
                _resetSet = predicate != null ? _context.Set<TEntity>().Where<TEntity>(predicate).AsQueryable() : _context.Set<TEntity>().AsQueryable();
            }

            _resetSet = skipCount == 0 ? _resetSet.Take(size) : _resetSet.Skip(skipCount).Take(size);
            total = _resetSet.Count();
            return _resetSet.AsQueryable();
        }
        #endregion GET LIST

        /// <summary>
        /// Add entity
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        #region ADD ENTITY
        public virtual EntityEntry<TEntity> Add(TEntity entity)
        {
            return _dbSet.Add(entity);
        }
        public virtual async Task<TEntity> AddAsync(TEntity entity)
        {
            FunctionCore.SetValueObjectProperty(entity, "CreateDate", DateTime.Now);
            var dbEntityEntry = _context.Entry(entity);
            await _dbSet.AddAsync(entity);
            await _context.SaveChangesAsync();
            return entity;
        }
        public virtual void AddRange(IEnumerable<TEntity> entities)
        {
            _dbSet.AddRange(entities);
        }
        public virtual async Task AddRangeAsync(IEnumerable<TEntity> entities)
        {
            await _dbSet.AddRangeAsync(entities);
        }

        #endregion ADD ENTITY

        /// <summary>
        ///  UPDATE ENTITY
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        #region UPDATE ENTITY
        public virtual EntityEntry<TEntity> Update(TEntity entity)
        {
            _dbSet.Attach(entity);
            return _context.Update(entity);
            //return _context.Entry(entity).State = EntityState.Modified;
        }
        public virtual async Task<TEntity> UpdateAsync(TEntity entity)
        {
            FunctionCore.SetValueObjectProperty(entity, "UpdtDate", DateTime.Now);
            _context.Entry(entity).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return entity;
        }
        public virtual void UpdateRange(IEnumerable<TEntity> entities)
        {
            _context.UpdateRange(entities);
        }
        #endregion UPDATE ENTITY

        /// <summary>
        /// DELETE ENTITY
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        #region DELETE ENTITY
        public virtual TEntity DeleteById(dynamic id)
        {
            var entity = _dbSet.Find(id);
            return _dbSet.Remove(entity);
        }
        public virtual async Task<TEntity> DeleteAsync(TEntity entity)
        {
            _context.Entry(entity).State = EntityState.Deleted;
            await _context.SaveChangesAsync();
            return entity;
        }
        public virtual async Task<TEntity> DeleteByIdAsync(dynamic id)
        {
            var entity = await GetSingleByIdAsync(id);
            await DeleteAsync(entity);
            return entity;
        }
        public virtual void DeleteMultiByCondition(Expression<Func<TEntity, bool>> where)
        {
            IEnumerable<TEntity> objects = _dbSet.Where<TEntity>(where).AsEnumerable();
            foreach (TEntity obj in objects)
                _dbSet.Remove(obj);
        }
        public virtual async Task DeleteMultiByConditionAsync(Expression<Func<TEntity, bool>> where)
        {
            IEnumerable<TEntity> objects = _dbSet.Where<TEntity>(where).AsEnumerable();
            foreach (TEntity obj in objects)
            {
                _dbSet.Remove(obj);
            }
            await _context.SaveChangesAsync();
        }
        public virtual void RemoveRange(IEnumerable<TEntity> entities)
        {
            _context.RemoveRange(entities);
        }
        public virtual async Task RemoveRangeAsync(IEnumerable<TEntity> entities)
        {
            _context.RemoveRange(entities);
            await _context.SaveChangesAsync();
        }
        #endregion DELETE ENTITY

        /// <summary>
        /// GetSingleById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        #region GET SINGLE BY ID
        public virtual TEntity GetSingleById(dynamic id)
        {
            return _dbSet.Find(id);
        }
        public virtual async Task<TEntity> GetSingleByIdAsync(dynamic id)
        {
            return await _dbSet.FindAsync(id);
        }
        public virtual async Task<TEntity> GetSingleByConditionAsync(
            Expression<Func<TEntity, bool>> filter,
            Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null)
        {
            var query = _dbSet.AsNoTracking();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (includeProperties != null)
            {
                query = includeProperties(query);
            }

            return await query.FirstOrDefaultAsync();
        }
        public virtual TEntity GetSingleByCondition(Expression<Func<TEntity, bool>> expression, string[] includes = null)
        {
            if (includes != null && includes.Count() > 0)
            {
                var query = _context.Set<TEntity>().Include(includes.First());
                foreach (var include in includes.Skip(1))
                    query = query.Include(include);
                return query.FirstOrDefault(expression);
            }
            return _context.Set<TEntity>().FirstOrDefault(expression);
        }
        public virtual async Task<bool> AnyAsync(Expression<Func<TEntity, bool>> filter, Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> includeProperties = null)
        {
            var query = _dbSet.AsNoTracking();

            if (includeProperties != null)
            {
                query = includeProperties(query);
            }

            if (filter != null)
            {
                return await query.AnyAsync(filter);
            }

            return await query.AnyAsync();
        }
        public virtual async Task<int> CountAsync()
        {
            return await _context.Set<TEntity>().CountAsync();
        }
        #endregion GET SINGLE BY ID

        /// <summary>
        /// ExecuteStoreScalar
        /// </summary>
        /// <param name="sqlName"></param>
        /// <param name="parameterValues"></param>
        /// <returns></returns>
        #region ExecuteStore
        public virtual DataSet ExecuteStoreScalar(string sqlName, object[] parameterValues)
        {
            System.Data.DataSet dtReturn = new System.Data.DataSet();

            using (var conn = new SqlConnection(ConfigConstant.CONNECTION_STRING))
            {
                // Create Command
                var cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = sqlName;
                cmd.CommandTimeout = 0;
                // Open Connection
                conn.Open();

                // Discover Parameters for Stored Procedure
                // Populate command.Parameters Collection.
                // Causes Rountrip to Database.
                SqlCommandBuilder.DeriveParameters(cmd);
                // Initialize Index of parameterValues Array
                int index = 0;
                // Populate the Input Parameters With Values Provided        
                foreach (SqlParameter parameter in cmd.Parameters)
                {
                    if (parameter.Direction == System.Data.ParameterDirection.Input ||
                         parameter.Direction == System.Data.ParameterDirection.
                                                     InputOutput)
                    {
                        if (parameterValues.Count() <= index || parameterValues[index] == null)
                        {
                            parameter.Value = DBNull.Value;
                        }
                        else
                            parameter.Value = parameterValues[index];
                        index++;
                    }
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dtReturn);
            }
            return dtReturn;
        }
        #endregion ExecuteStore

        #region BulkExtensions
        public virtual async Task BulkInsertAsync(IList<TEntity> entities)
        {
            await _context.BulkInsertAsync(entities);
        }

        public virtual void BulkInsert(IList<TEntity> entities)
        {
            _context.BulkInsert(entities);
        }

        public virtual async Task BulkInsertOrUpdateAsync(IList<TEntity> entities)
        {
            await _context.BulkInsertOrUpdateAsync(entities);
        }

        public virtual async Task BulkUpdateAsync(IList<TEntity> entities)
        {
            await _context.BulkUpdateAsync(entities);
        }

        public virtual async Task BulkDeleteAsync(IList<TEntity> entities)
        {
            await _context.BulkDeleteAsync(entities);
        }
        #endregion BulkExtensions

        /// <summary>
        /// SAVE CHANGES
        /// </summary>
        #region SAVE CHANGES
        public virtual int SaveChanges()
        {
            return _context.SaveChanges();
        }
        public virtual async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }
        #endregion SAVE CHANGES

    }
}
