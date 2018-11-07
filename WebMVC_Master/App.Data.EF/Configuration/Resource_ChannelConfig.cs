using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class Resource_ChannelConfig
    {
        public Resource_ChannelConfig(EntityTypeBuilder<Resource_Channel> entityBuilder)
        {
            entityBuilder.ToTable("Resource.Channel");
            entityBuilder.Property(x => x.ChannelId).IsRequired();
        }
    }
}
