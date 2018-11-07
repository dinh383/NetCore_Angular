
using App.Infrastructure.SharedKernel;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace App.Data.Entities
{
    [Table("AppUser")]
    public class AppUser : IdentityUser//, IDateTracking, ISwitchable
    {
        [StringLength(200)]
        public string FullName { get; set; }

        public DateTime? BirthDay { set; get; }

        //public decimal Balance { get; set; }
        [StringLength(300)]
        public string Avatar { get; set; }

        public bool Stop { get; set; }

        public DateTime CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
