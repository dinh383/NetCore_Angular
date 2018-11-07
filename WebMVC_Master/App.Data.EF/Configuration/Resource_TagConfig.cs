using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_TagConfig
    {
        public Resource_TagConfig(EntityTypeBuilder<Resource_Tag> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Tag");
            entityBuilder.Property(x => x.TagId).IsRequired();
        }
    }
}
