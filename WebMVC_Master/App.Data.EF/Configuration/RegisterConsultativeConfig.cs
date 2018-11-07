using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace App.Data.EF.Configuration
{
    public class RegisterConsultativeConfig
    {
        public RegisterConsultativeConfig(EntityTypeBuilder<RegisterConsultative> entityBuilder)
        {
            entityBuilder.ToTable("RegisterConsultative");
            entityBuilder.Property(x => x.RegisterId).IsRequired();
        }
    }
}
