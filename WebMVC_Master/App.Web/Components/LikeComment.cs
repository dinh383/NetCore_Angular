using App.Common.Constants;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components
{
    public class LikeCommentViewComponent : ViewComponent
    {
        public LikeCommentViewComponent()
        {

        }
        public IViewComponentResult Invoke()
        {
            ViewBag.AppFacebookId = ConstantVariable.APP_FACEBOOK_ID;
            return View();
        }
    }
}
