using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components
{
    public class VideoForCategoryViewComponent : ViewComponent
    {
        private readonly IResource_VideoService _videoService;
        public VideoForCategoryViewComponent(IResource_VideoService videoService)
        {
            this._videoService = videoService;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = await _videoService.GetVideosForCategory();
            return View("VideoForCategory", categories);
        }
    }
}
