using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Test_ExamStructureConfig
    {
        public Test_ExamStructureConfig(EntityTypeBuilder<Test_ExamStructure> entityBuilder)
        {
            entityBuilder.ToTable("Test.ExamStructure");
        }
    }
}
