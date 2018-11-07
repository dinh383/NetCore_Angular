using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Common.Constants;
using App.CommonExtensions.Extensions;
using App.Data.Entities;
using App.Model.ViewModel;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;

namespace App.Web.Controllers
{
    public class ResourceVideoController : Controller
    {
        private readonly IResource_VideoService _videoService;
        public ResourceVideoController(IResource_VideoService videoService)
        {
            this._videoService = videoService;
        }
        [Route("video.html")]
        public IActionResult Home()
        {
            return View();
        }

        [HttpGet, Route("video-detail.html")]
        public async Task<IActionResult> VideoDetail(int id)
        {
            ViewBag.AppFacebookId = ConstantVariable.APP_FACEBOOK_ID;
            var video = await _videoService.GetSingleByIdAsync(id);
            ViewBag.IsPostVideoDetal = TempData["IsPostVideoDetal"];
            ViewBag.VideoLineId = id;
            if (video != null)
            {
                return View(video);
            }
            return RedirectToAction("Index", "Error");
        }
        [HttpPost, Route("video-detail.html")]
        public async Task<IActionResult> VideoDetail(QuestionVideoModel questionVideo)
        {
            TempData.Put("questionVideoModel", questionVideo);
            TempData["IsPostVideoDetal"] = true;
            return RedirectToAction("VideoDetail", new { id = questionVideo.ExamStructure.VideoLineId });
        }
        [HttpGet]
        public async Task<IActionResult> SearchVideo(string keySearch)
        {
            var videos = await _videoService.SearchVideo(keySearch);
            ViewBag.TotalVideo = videos.Count();
            return View(videos);
        }
        [HttpGet]
        public async Task<IActionResult> VideosCategory(int categoryId)
        {
            var videos = await _videoService.VideosCategory(categoryId);
            ViewBag.TotalVideo = videos.Count();
            return View(videos);
        }
    }
}