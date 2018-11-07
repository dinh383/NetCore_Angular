using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace App.Infrastructure.SharedKernel
{
    public abstract class BaseEntityHistory
    {
        public BaseEntityHistory()
        {
            Stop = false;
            CreateDate = DateTime.Now;
        }
        public bool Stop { get; set; }
        public DateTime CreateDate { get; set; }
        [StringLength(30)]
        public string CreateByUser { get; set; }
        public DateTime UpdtDate { get; set; }
        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
