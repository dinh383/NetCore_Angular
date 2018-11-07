namespace App.Data.Entities
{
    using App.Data.Implement;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Resource.Channel]")]
    public partial class Resource_Channel : SystemHistory
    {
        [Key]
        public int ChannelId { get; set; }
        [StringLength(200)]
        public string ChannelYouTubeId { get; set; }
        [Required]
        [StringLength(200)]
        public string ChannelName { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

    }
}
