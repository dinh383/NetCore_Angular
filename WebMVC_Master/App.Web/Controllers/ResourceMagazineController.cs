using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.CommonExtensions.Extensions;
using App.Data.Entities;
using App.Model.ViewModel;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace App.Web.Controllers
{
    public class ResourceMagazineController : Controller
    {
        private readonly IResource_MagazineService _magazineService;
        private readonly IResource_AudioService _audioService;
        public ResourceMagazineController(IResource_MagazineService magazineService, IResource_AudioService audioService)
        {
            this._magazineService = magazineService;
            this._audioService = audioService;
        }
        public async Task<IActionResult> ListMagazine()
        {
            var magazines = await _magazineService.ListAsync();
            return View(magazines);
        }
        public async Task<IActionResult> MagazineDetail(Guid magazineId)
        {
            var magazine = await _magazineService.GetSingleByConditionAsync(n => n.MagazineId.Equals(magazineId), y => y.Include(z => z.Audios));
            ViewBag.AudioFirst = magazine.Audios.Any() ? magazine.Audios.FirstOrDefault().AudioName : "";
            return View(magazine);
        }
        public IActionResult DisplayPDF(string pdfUrl)
        {
            ViewBag.PdfUrl = pdfUrl;
            return View();
        }
    }
}