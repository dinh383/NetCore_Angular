namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
   
    [Table("[Test.ExamQuestionDetail]")]
    public partial class Test_ExamQuestionDetail
    {
        [Key]
        public int LineId { get; set; }

        public Guid ExamId { get; set; }

        public Guid QuestionId { get; set; }

        [StringLength(200)]
        public string Answer { get; set; }

        [StringLength(200)]
        public string Result { get; set; }

        public bool? IsCorrect { get; set; }

        //[ForeignKey("QuestionId")]
        //public virtual Test_Question Question { get; set; }

        //[ForeignKey("ExamId")]
        //public virtual Test_Exam Exam { get; set; }

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
