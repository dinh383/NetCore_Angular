using App.Data.Implement;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace App.Data.Entities
{
    public class Resource_Audio : SystemHistory
    {
        public int LineId { get; set; }
        [Key]
        public Guid AudioId { get; set; }

        [StringLength(200)]
        public string AudioName { get; set; }

        [StringLength(300)]
        public string Description { get; set; }

        [StringLength(200)]
        public string AudioUrl { get; set; }

        public int? Order { get; set; }

        public Guid MagazineId { get; set; }

    }
}
