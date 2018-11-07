using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_VideoConfig
    {
        public Resource_VideoConfig(EntityTypeBuilder<Resource_Video> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Video");
            entityBuilder.Property(x => x.VideoID).IsRequired();
        }
    }
}
