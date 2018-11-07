namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Resource.Video]")]
    public partial class Resource_Video
    {
        private string _urlImage;
        private string _urlImageDefaut = "http://homestudy.edu.vn/images/main-page/no-image.jpg";
        public Resource_Video()
        {
        }
        [Key]
        public int LineId { get; set; }

        [Required(ErrorMessage = "VideoId không được để trống")]
        [StringLength(200)]
        public string VideoID { get; set; }

        [Required(ErrorMessage = "VideoName không được để trống")]
        [StringLength(200)]
        public string VideoName { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        [StringLength(200)]
        public string Title { get; set; }

        public int ChannelId { get; set; }

        public int? CategoryId { get; set; }

        public int? Views { get; set; }

        public int? Likes { get; set; }

        public int? UnLikes { get; set; }

        [StringLength(200)]
        public string UrlYoutube { get; set; }

        [StringLength(200)]
        public string UrlUseIframe { get; set; }

        [StringLength(300)]
        public string UrlImage
        {
            get
            {
                return string.IsNullOrEmpty(_urlImage) ? _urlImageDefaut : _urlImage;
            }
            set { _urlImage = value; }
        }

        public bool Stop { get; set; }

        public DateTime CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
