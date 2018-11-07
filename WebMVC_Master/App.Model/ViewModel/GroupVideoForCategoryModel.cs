using App.Data.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class GroupVideoForCategoryModel
    {
        public GroupVideoForCategoryModel()
        {
            Videos = new List<Resource_Video>();
        }
        public int GroupID { get; set; }
        public string GroupName { get; set; }
        public string Status { get; set; }
        public IList<Resource_Video> Videos { get; set; }
    }
}
