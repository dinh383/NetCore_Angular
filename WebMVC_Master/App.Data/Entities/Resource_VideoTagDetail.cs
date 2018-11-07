namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Resource.VideoTagDetail]")]
    public partial class Resource_VideoTagDetail
    {
        [Key]
        public int LineId { get; set; }

        [Required]
        [StringLength(50)]
        public string VideoID { get; set; }

        public int TagId { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        public bool Stop { get; set; }

        public DateTime CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
