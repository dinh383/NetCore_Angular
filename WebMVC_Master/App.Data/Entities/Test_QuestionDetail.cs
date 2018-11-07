namespace App.Data.Entities
{
    using App.Data.Implement;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Test.QuestionDetail]")]
    public partial class Test_QuestionDetail : SystemHistory
    {
        [Key]
        public int LineId { get; set; }

        public Guid QuestionId { get; set; }

        [StringLength(200)]
        public string AnswerPossobolity { get; set; }

        [NotMapped]
        public bool? IsCorrect { get; set; }

        public int? Order { get; set; }

        //[ForeignKey("QuestionId")]
        //public virtual Test_Question Question { get; set; }

        //public bool Stop { get; set; }

        //[Column(TypeName = "datetime2")]
        //public DateTime CreateDate { get; set; }

        //[StringLength(30)]
        //public string CreateByUser { get; set; }

        //[Column(TypeName = "datetime2")]
        //public DateTime? UpdtDate { get; set; }

        //[StringLength(30)]
        //public string UpdtByUser { get; set; }
    }
}
