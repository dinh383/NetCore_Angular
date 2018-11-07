using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Test_ExamConfig
    {
        public Test_ExamConfig(EntityTypeBuilder<Test_Exam> entityBuilder)
        {
            entityBuilder.ToTable("Test.Exam");
        }
    }
}
