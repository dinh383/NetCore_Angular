using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class CourseConfig
    {
        public CourseConfig(EntityTypeBuilder<Course> entityBuilder)
        {
            entityBuilder.ToTable("Course");
            entityBuilder.Property(x => x.CourseId).IsRequired();
        }
    }
}
