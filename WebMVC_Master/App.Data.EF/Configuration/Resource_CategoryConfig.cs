using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_CategoryConfig
    {
        public Resource_CategoryConfig(EntityTypeBuilder<Resource_Category> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Category");
            entityBuilder.Property(x => x.CategoryId).IsRequired();
        }
    }
}
