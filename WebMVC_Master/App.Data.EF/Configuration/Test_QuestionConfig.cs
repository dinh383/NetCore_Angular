using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Metadata;

namespace App.Data.EF.Configuration
{
    public class Test_QuestionConfig
    {
        public Test_QuestionConfig(EntityTypeBuilder<Test_Question> entityBuilder)
        {
            entityBuilder.ToTable("Test.Question");
            entityBuilder.Property(p => p.LineId).UseSqlServerIdentityColumn();
            entityBuilder.Property(e => e.LineId).Metadata.AfterSaveBehavior = PropertySaveBehavior.Ignore;
            entityBuilder.HasKey(q => q.QuestionId);
            //entityBuilder.HasMany(q => q.QuestionDetails);
            //entityBuilder.HasMany(e => e.ExamQuestionDetails);
        }
    }
}
