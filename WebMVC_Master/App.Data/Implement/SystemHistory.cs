using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace App.Data.Implement
{
    public class SystemHistory
    {
        public bool Stop { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
