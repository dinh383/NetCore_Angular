namespace App.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("[Test.ExamStructure]")]
    public partial class Test_ExamStructure
    {
        [Key]
        public int StructureId { get; set; }

        [StringLength(300)]
        public string StructureName { get; set; }

        [StringLength(500)]
        public string QuestionLineId { get; set; }

        public int? VideoLineId { get; set; }

        public virtual Resource_Video Video { get; set; }

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
