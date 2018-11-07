using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_MagazineConfig
    {
        public Resource_MagazineConfig(EntityTypeBuilder<Resource_Magazine> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Magazine");
            entityBuilder.Property(x => x.MagazineId).IsRequired();
        }
    }
}
