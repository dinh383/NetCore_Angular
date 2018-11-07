using App.BaseWebAPI.Providers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.BaseWebAPI.Controllers
{
    //[ClaimRequirement("", "")]
    public class AppBaseController : Controller
    {
        public AppBaseController()
        {
        }
    }
}