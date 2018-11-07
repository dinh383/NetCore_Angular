using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_VideoTagDetailConfig
    {
        public Resource_VideoTagDetailConfig(EntityTypeBuilder<Resource_VideoTagDetail> entityBuilder)
        {
            entityBuilder.ToTable("Resource.VideoTagDetail");
            entityBuilder.Property(x => x.LineId).IsRequired();
        }
    }
}
