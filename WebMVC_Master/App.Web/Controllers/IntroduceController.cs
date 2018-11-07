using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Data.Entities;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;

namespace App.Web.Controllers
{
    public class IntroduceController : Controller
    {
        private readonly IRegisterConsultativeService _registerConsultativeService;
        public IntroduceController(IRegisterConsultativeService registerConsultativeService)
        {
            this._registerConsultativeService = registerConsultativeService;
        }
        [Route("gioi-thieu.html")]
        public IActionResult Home()
        {

            return View();
        }
        [HttpPost, Route("gioi-thieu.html")]
        public async Task<IActionResult> Home(RegisterConsultative registerConsultative)
        {
            if (ModelState.IsValid)
            {
                var model = await _registerConsultativeService.AddAsync(registerConsultative);
                return RedirectToAction("RegisterSuccess", "RegisterConsultative");
            }
            return View(registerConsultative);
        }
    }
}