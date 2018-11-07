using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Data.Entities;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;

namespace App.Web.Controllers
{
    public class RegisterConsultativeController : Controller
    {
        private readonly IRegisterConsultativeService _registerConsultativeService;
        public RegisterConsultativeController(IRegisterConsultativeService registerConsultativeService)
        {
            this._registerConsultativeService = registerConsultativeService;
        }
        [Route("dang-ky-tu-van.html")]
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost, Route("dang-ky-tu-van.html")]
        public async Task<IActionResult> Register(RegisterConsultative registerConsultative)
        {
            if (ModelState.IsValid)
            {
                var model = await _registerConsultativeService.AddAsync(registerConsultative);
                return RedirectToAction("RegisterSuccess");
            }
            return View(registerConsultative);
        }
        [HttpGet, Route("dang-ky-thanh-cong.html")]
        public IActionResult RegisterSuccess()
        {
            return View();
        }
        [HttpGet, Route("dang-ky-xay-ra-loi.html")]
        public IActionResult RegisterFail()
        {
            return View();
        }

    }
}