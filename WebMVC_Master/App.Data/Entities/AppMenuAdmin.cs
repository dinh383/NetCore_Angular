using App.Data.Implement;
using App.Infrastructure.SharedKernel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace App.Data.Entities
{
    public class AppMenuAdmin : SystemHistory
    {
        public List<AppMenuAdmin> Init()
        {
            var data = new List<AppMenuAdmin>()
            {
                new AppMenuAdmin()
                {
                    Id = 1,
                    Text = "QUẢN LÝ HỌC VIÊN",
                    RouterLink = "/",
                    Expanded = false,
                    ParentId = null,
                    DisplayOrder = null,
                    Level = null,
                },
                new AppMenuAdmin()
                {
                    Id = 2,
                    Text = "Đăng ký tư vấn",
                    RouterLink = "/main/home-study/register-list",
                    Expanded = false,
                    ParentId = 1,
                    DisplayOrder = null,
                    Level = null,
                },
                new AppMenuAdmin()
                {
                    Id = 3,
                    Text = "QUẢN LÝ TÀI NGUYÊN",
                    RouterLink = "/",
                    Expanded = false,
                    ParentId = null,
                    DisplayOrder = null,
                    Level = null,
                },
                new AppMenuAdmin()
                {
                    Id = 4,
                    Text = "Danh sách video",
                    RouterLink = "/main/resoure-management/video-list",
                    Expanded = false,
                    ParentId = 3,
                    DisplayOrder = null,
                    Level = null,
                }
            };
            return data;
        }
        [Key]
        public int Id { get; set; }
        public string Text { get; set; }
        public string RouterLink { get; set; }
        public Nullable<bool> Expanded { get; set; }
        public int? ParentId { get; set; }
        public int? DisplayOrder { get; set; }
        public Nullable<int> Level { get; set; }
        public string Icon { get; set; }
    }
}
