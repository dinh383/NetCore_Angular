using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components
{
    public class SidebarMenuViewComponent : ViewComponent
    {
        private readonly IResource_CategoryService _categoryService;
        public SidebarMenuViewComponent(IResource_CategoryService categoryService)
        {
            this._categoryService = categoryService;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = await _categoryService.ListAsync(n => n.Stop == false);
            return View("SidebarMenu", categories);
        }
    }
}
