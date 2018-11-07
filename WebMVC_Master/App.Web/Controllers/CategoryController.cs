using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;

namespace App.Web.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            this._categoryService = categoryService;
        }
    }
}