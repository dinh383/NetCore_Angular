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
    public class Resource_VideoService : IResource_VideoService
    {
        private readonly IResource_VideoRepository _videoRepository;
        private readonly IResource_CategoryRepository _categoryRepository;
        private const int MAX_VIDEOS = 8;
        private const int PAGE_SIZE = 4;

        public Resource_VideoService(IResource_VideoRepository videoRepository, IResource_CategoryRepository categoryRepository)
        {
            this._categoryRepository = categoryRepository;
            this._videoRepository = videoRepository;
        }
        public async Task<IEnumerable<Resource_Video>> VideosCategory(int categoryId)
        {
            var videoResults = await _videoRepository.ListAsync(n => n.CategoryId == categoryId);
            return videoResults;
        }
        public async Task<IEnumerable<Resource_Video>> SearchVideo(string keySearch)
        {
            var videoResults = await _videoRepository.ListAsync(n => n.VideoName.Contains(keySearch));
            return videoResults;
        }
        public async Task<IEnumerable<VideoForCategoryModel>> GetVideosForCategory()
        {
            List<VideoForCategoryModel> videoForCategoryModels = new List<VideoForCategoryModel>();
            var categories = await _categoryRepository.ListAsync();
            foreach (var categorie in categories)
            {
                var videos = _videoRepository.ListAsync(n => n.CategoryId == categorie.CategoryId).Result.Take(MAX_VIDEOS).ToList();
                if (videos.Any())
                {
                    var videoForCategoryModel = new VideoForCategoryModel()
                    {
                        Category = categorie,
                        GroupVideoForCategories = GetVideosForGroup(videos)
                    };
                    videoForCategoryModels.Add(videoForCategoryModel);
                }
            }
            return videoForCategoryModels;
        }
        private IList<GroupVideoForCategoryModel> GetVideosForGroup(List<Resource_Video> videos)
        {
            int pageIndex = 0;
            var groupVideoForCategorys = new List<GroupVideoForCategoryModel>();
            decimal totalGroup = Math.Ceiling(videos.Count / decimal.Parse(PAGE_SIZE.ToString()));
            for (int i = 1; i <= totalGroup; i++)
            {
                var status = i == 1 ? "active" : "";
                var groupVideoForCategory = new GroupVideoForCategoryModel()
                {
                    GroupID = i,
                    GroupName = $"Group_{i}",
                    Status = status,
                    Videos = videos.Skip(pageIndex).Take(PAGE_SIZE).ToList()
                };
                groupVideoForCategorys.Add(groupVideoForCategory);
                pageIndex++;
                pageIndex = PAGE_SIZE * pageIndex;
            }
            return groupVideoForCategorys;
        }
        public async Task<IEnumerable<Resource_Video>> GetVideosConcern(int id)
        {
            var video = await _videoRepository.GetSingleByIdAsync(id);
            var videoConcerns = await _videoRepository.ListAsync(n => n.CategoryId == video.CategoryId || n.ChannelId == video.ChannelId);
            return videoConcerns;
        }
        #region FUNCTION COMMOM
        public Task<Resource_Video> AddAsync(Resource_Video entity)
        {
            return _videoRepository.AddAsync(entity);
        }
        public Task<Resource_Video> UpdateAsync(Resource_Video entity)
        {
            return _videoRepository.UpdateAsync(entity);
        }
        public Task<Resource_Video> DeleteAsync(Resource_Video entity)
        {
            return _videoRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Resource_Video>> ListAsync(Expression<Func<Resource_Video, bool>> filter, Func<IQueryable<Resource_Video>, IOrderedQueryable<Resource_Video>> orderBy, Func<IQueryable<Resource_Video>, IIncludableQueryable<Resource_Video, object>> includeProperties)
        {
            return _videoRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<Resource_Video> GetSingleByIdAsync(dynamic id)
        {
            return _videoRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Resource_Video> GetAll(string[] includes = null)
        {
            return _videoRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Resource_Video> entities)
        {
            throw new NotImplementedException();
        }

        public Task AddRangeAsync(IEnumerable<Resource_Video> entities)
        {
            throw new NotImplementedException();
        }

        public void UpdateRange(IEnumerable<Resource_Video> entities)
        {
            throw new NotImplementedException();
        }

        public Task<Resource_Video> DeleteByIdAsync(dynamic id)
        {
            return _videoRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Resource_Video, bool>> where)
        {
            throw new NotImplementedException();
        }

        public Task RemoveRangeAsync(IEnumerable<Resource_Video> entities)
        {
            throw new NotImplementedException();
        }

        public Resource_Video GetSingleByCondition(Expression<Func<Resource_Video, bool>> expression, string[] includes = null)
        {
            throw new NotImplementedException();
        }



        public Task<Resource_Video> GetSingleByConditionAsync(Expression<Func<Resource_Video, bool>> filter, Func<IQueryable<Resource_Video>, IIncludableQueryable<Resource_Video, object>> includeProperties = null)
        {
            throw new NotImplementedException();
        }

        public Task<bool> AnyAsync(Expression<Func<Resource_Video, bool>> filter, Func<IQueryable<Resource_Video>, IIncludableQueryable<Resource_Video, object>> includeProperties = null)
        {
            throw new NotImplementedException();
        }
        public int SaveChanges()
        {
            return _videoRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _videoRepository.SaveChangesAsync();
        }
        #endregion FUNCTION COMMOM

    }
}
