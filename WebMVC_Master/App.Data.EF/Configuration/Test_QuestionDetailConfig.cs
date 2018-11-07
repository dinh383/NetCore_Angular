using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Test_QuestionDetailConfig
    {
        public Test_QuestionDetailConfig(EntityTypeBuilder<Test_QuestionDetail> entityBuilder)
        {
            entityBuilder.ToTable("Test.QuestionDetail");
        }
    }
}
