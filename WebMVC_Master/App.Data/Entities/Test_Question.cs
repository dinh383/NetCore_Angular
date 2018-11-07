namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Test.Question]")]
    public partial class Test_Question
    {
        public Test_Question()
        {
            QuestionDetails = new List<Test_QuestionDetail>();
            ExamQuestionDetails = new List<Test_ExamQuestionDetail>();
            //AnswerExplain = "Chọn đáp án này vì .....";
        }
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int LineId { get; set; }

        public Guid QuestionId { get; set; }

        [StringLength(300)]
        public string QuestionName { get; set; }

        [StringLength(200)]
        public string Answer { get; set; }

        [NotMapped]
        [StringLength(200)]
        public string AnswerChoosed { get; set; }

        [StringLength(300)]
        public string AnswerExplain { get; set; }

        [StringLength(100)]
        public string VideoId { get; set; }

        public int? Order { get; set; }

        [NotMapped]
        public bool? IsCorrect { get; set; }

        //[ForeignKey("CreateByUser")]
        //public virtual AppUser AppUser { get; set; }

        public virtual IList<Test_QuestionDetail> QuestionDetails { get; set; }

        public virtual IList<Test_ExamQuestionDetail> ExamQuestionDetails { get; set; }

        public bool Stop { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }

        [StringLength(30)]
        [ForeignKey("UserName")]
        public string CreateByUser { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdtDate { get; set; }

        [StringLength(30)]
        public string UpdtByUser { get; set; }


    }
}
