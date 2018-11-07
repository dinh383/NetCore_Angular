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
    public class Resource_AudioService : IResource_AudioService
    {
        private readonly IResource_AudioRepository _audioRepository;
        public Resource_AudioService(IResource_AudioRepository audioRepository)
        {
            this._audioRepository = audioRepository;
        }
        public Task<Resource_Audio> AddAsync(Resource_Audio entity)
        {
            return _audioRepository.AddAsync(entity);
        }
        public Task<Resource_Audio> UpdateAsync(Resource_Audio entity)
        {
            return _audioRepository.UpdateAsync(entity);
        }
        public Task<Resource_Audio> DeleteAsync(Resource_Audio entity)
        {
            return _audioRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Resource_Audio>> ListAsync(Expression<Func<Resource_Audio, bool>> filter, Func<IQueryable<Resource_Audio>, IOrderedQueryable<Resource_Audio>> orderBy, Func<IQueryable<Resource_Audio>, IIncludableQueryable<Resource_Audio, object>> includeProperties)
        {
            return _audioRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<Resource_Audio> GetSingleByIdAsync(dynamic id)
        {
            return _audioRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Resource_Audio> GetAll(string[] includes = null)
        {
            return _audioRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Resource_Audio> entities)
        {
            _audioRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Resource_Audio> entities)
        {
            return _audioRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Resource_Audio> entities)
        {
            _audioRepository.UpdateRange(entities);
        }

        public Task<Resource_Audio> DeleteByIdAsync(dynamic id)
        {
            return _audioRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Resource_Audio, bool>> where)
        {
            return _audioRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Resource_Audio> entities)
        {
            return _audioRepository.RemoveRangeAsync(entities);
        }

        public Resource_Audio GetSingleByCondition(Expression<Func<Resource_Audio, bool>> expression, string[] includes = null)
        {
            return _audioRepository.GetSingleByCondition(expression);
        }

        public Task<Resource_Audio> GetSingleByConditionAsync(Expression<Func<Resource_Audio, bool>> filter, Func<IQueryable<Resource_Audio>, IIncludableQueryable<Resource_Audio, object>> includeProperties = null)
        {
            return _audioRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public Task<bool> AnyAsync(Expression<Func<Resource_Audio, bool>> filter, Func<IQueryable<Resource_Audio>, IIncludableQueryable<Resource_Audio, object>> includeProperties = null)
        {
            return _audioRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _audioRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _audioRepository.SaveChangesAsync();
        }
    }
}
