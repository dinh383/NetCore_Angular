using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components
{
    public class VideosConcernViewComponent : ViewComponent
    {
        private readonly IResource_VideoService _videoService;
        public VideosConcernViewComponent(IResource_VideoService videoService)
        {
            this._videoService = videoService;
        }
        public async Task<IViewComponentResult> InvokeAsync(int id)
        {
            var videos = await _videoService.GetVideosConcern(id);
            return View("VideosConcern", videos);
        }
    }
}
