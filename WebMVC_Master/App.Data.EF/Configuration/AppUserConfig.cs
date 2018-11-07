using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class AppUserConfig
    {
        public AppUserConfig(EntityTypeBuilder<AppUser> entityBuilder)
        {
            entityBuilder.ToTable("AppUser");
            entityBuilder.Property(x => x.UserName).IsRequired();

        }
    }
}
