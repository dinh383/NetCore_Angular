using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace App.Web.Controllers
{
    public class CoursesController : Controller
    {
        public IActionResult Detail()
        {
            return View();
        }
    }
}