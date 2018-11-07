using App.Data.Entities;
using App.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace App.Service.Interface
{
    public interface IResource_VideoService : IServiceCommon<Resource_Video>
    {
        Task<IEnumerable<VideoForCategoryModel>> GetVideosForCategory();
        Task<IEnumerable<Resource_Video>> GetVideosConcern(int id);
        Task<IEnumerable<Resource_Video>> SearchVideo(string keySearch);
        Task<IEnumerable<Resource_Video>> VideosCategory(int categoryId);
    }
}
