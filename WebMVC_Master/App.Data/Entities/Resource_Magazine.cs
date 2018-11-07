using App.Data.Implement;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace App.Data.Entities
{
    public class Resource_Magazine : SystemHistory
    {
        public int LineId { get; set; }
        [Key]
        public Guid MagazineId { get; set; }

        [StringLength(200)]
        public string MagazineName { get; set; }

        [StringLength(300)]
        public string Description { get; set; }

        [StringLength(300)]
        public string MagazineUrl { get; set; }

        [StringLength(300)]
        public string MagazineImageUrl { get; set; }

        public int? Order { get; set; }

        public virtual IList<Resource_Audio> Audios { get; set; }

    }
}
