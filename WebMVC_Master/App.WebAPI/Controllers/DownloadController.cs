using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using App.Service.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DownloadController : Controller
    {
        private readonly IDownloadService _downloadService;
        public DownloadController(IDownloadService downloadService)
        {
            this._downloadService = downloadService;
        }

        [HttpGet]
        [Route("file")]
        public async Task<IActionResult> Download(string filename)
        {
            if (filename == null)
                return Content("filename not present");

            var file = await _downloadService.DownloadFileAsync(filename);
            return File(file.File, file.MimeType, file.Name);
        }

        
    }
}