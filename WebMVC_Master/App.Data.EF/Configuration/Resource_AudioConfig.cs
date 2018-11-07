using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_AudioConfig
    {
        public Resource_AudioConfig(EntityTypeBuilder<Resource_Audio> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Audio");
            entityBuilder.Property(x => x.AudioId).IsRequired();
        }
    }
}
