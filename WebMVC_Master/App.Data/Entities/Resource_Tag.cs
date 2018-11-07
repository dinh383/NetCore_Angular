namespace App.Data.Entities
{
    using App.Infrastructure.SharedKernel;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Resource.Tag]")]
    public partial class Resource_Tag : BaseEntityHistory
    {
        [Key]
        public int TagId { get; set; }
        [Required]
        [StringLength(200)]
        public string TagName { get; set; }
        [StringLength(500)]
        public string Description { get; set; }
        
    }
}
