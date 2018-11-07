namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Test.Exam]")]
    public partial class Test_Exam
    {
        [Key]
        public Guid ExamId { get; set; }

        [StringLength(200)]
        public string ExamName { get; set; }

        [StringLength(300)]
        public string UserTest { get; set; }

        public int? QtyCorrect { get; set; }

        public int? QtyIncorrect { get; set; }

        public int? TotalScore { get; set; }

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
