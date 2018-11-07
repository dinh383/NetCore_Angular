using App.Data.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class VideoForCategoryModel
    {
        public VideoForCategoryModel()
        {
            Category = new Resource_Category();
            GroupVideoForCategories = new List<GroupVideoForCategoryModel>();
        }
        public Resource_Category Category { get; set; }
        public IList<GroupVideoForCategoryModel> GroupVideoForCategories { get; set; }
    }
}
