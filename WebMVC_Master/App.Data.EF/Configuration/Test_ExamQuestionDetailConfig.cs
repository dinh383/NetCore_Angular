using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Test_ExamQuestionDetailConfig
    {
        public Test_ExamQuestionDetailConfig(EntityTypeBuilder<Test_ExamQuestionDetail> entityBuilder)
        {
            entityBuilder.ToTable("Test.ExamQuestionDetail");
        }
    }
}
