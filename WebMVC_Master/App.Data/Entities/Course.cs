using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace App.Data.Entities
{
    [Table("Course")]
    public class Course
    {
        public int CourseId { get; set; }

        [StringLength(200)]
        public string CourseName { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? Tuition { get; set; }

        public bool Stop { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(30)]
        public string CreateByUser { get; set; }

        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }
    }
}
