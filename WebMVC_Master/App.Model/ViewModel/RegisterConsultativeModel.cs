using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace App.Model.ViewModel
{
    class RegisterConsultativeModel
    {
        public int RegisterId { get; set; }

        [StringLength(100)]
        public string FullName { get; set; }

        [StringLength(15)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(200)]
        public string Address { get; set; }

        public int? ShiftStudyId { get; set; }

        public int? OccupationId { get; set; }

        public int? ReasonId { get; set; }

        public int? AgeId { get; set; }

        public int? FinancialResourceId { get; set; }

        public bool? IsLearnTrial { get; set; }

        public DateTime? DateLearnTrial { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public bool Stop { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
