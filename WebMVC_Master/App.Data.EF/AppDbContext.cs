using App.Data.EF.Configuration;
using App.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App.Data.EF
{
   public class AppDbContext : DbContext //: IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<IdentityUser>().ToTable("AppUser").HasKey(x => x.Id);
            //modelBuilder.Entity<IdentityRole>().ToTable("AppRoles").HasKey(x => x.Id);

            //modelBuilder.Entity<IdentityUserClaim<string>>().ToTable("AppUserClaims").HasKey(x => x.Id);

            //modelBuilder.Entity<IdentityRoleClaim<string>>().ToTable("AppRoleClaims")
            //    .HasKey(x => x.Id);

            //modelBuilder.Entity<IdentityUserLogin<string>>().ToTable("AppUserLogins").HasKey(x => x.UserId);

            //modelBuilder.Entity<IdentityUserRole<string>>().ToTable("AppUserRoles")
            //    .HasKey(x => new { x.RoleId, x.UserId });

            //modelBuilder.Entity<IdentityUserToken<string>>().ToTable("AppUserTokens")
            //   .HasKey(x => new { x.UserId });

            //Config
            new AppUserConfig(modelBuilder.Entity<AppUser>());
            new CategoryConfig(modelBuilder.Entity<Category>());
            new RegisterConsultativeConfig(modelBuilder.Entity<RegisterConsultative>());
            new CourseConfig(modelBuilder.Entity<Course>());

            new Resource_CategoryConfig(modelBuilder.Entity<Resource_Category>());
            new Resource_ChannelConfig(modelBuilder.Entity<Resource_Channel>());
            new Resource_TagConfig(modelBuilder.Entity<Resource_Tag>());
            new Resource_VideoConfig(modelBuilder.Entity<Resource_Video>());
            new Resource_VideoTagDetailConfig(modelBuilder.Entity<Resource_VideoTagDetail>());
            new Resource_MagazineConfig(modelBuilder.Entity<Resource_Magazine>());
            new Resource_AudioConfig(modelBuilder.Entity<Resource_Audio>());

            new Test_ExamConfig(modelBuilder.Entity<Test_Exam>());
            new Test_ExamQuestionDetailConfig(modelBuilder.Entity<Test_ExamQuestionDetail>());
            new Test_ExamStructureConfig(modelBuilder.Entity<Test_ExamStructure>());
            new Test_QuestionConfig(modelBuilder.Entity<Test_Question>());
            new Test_QuestionDetailConfig(modelBuilder.Entity<Test_QuestionDetail>());
           
        }

        public override int SaveChanges()
        {
            try
            {
                var modified = ChangeTracker.Entries().Where(e => e.State == EntityState.Modified || e.State == EntityState.Added);
                //foreach (EntityEntry item in modified)
                //{
                //    var changedOrAddedItem = item.Entity as IDateTracking;
                //    if (changedOrAddedItem != null)
                //    {
                //        if (item.State == EntityState.Added)
                //        {
                //            changedOrAddedItem.DateCreated = DateTime.Now;
                //        }
                //        changedOrAddedItem.DateModified = DateTime.Now;
                //    }
                //}
                return base.SaveChanges();
            }
            catch (DbUpdateException entityException)
            {
                var errors = entityException.Message;
                //throw new ModelValidationException(entityException.Message);
                return 0;
            }
        }

        public DbSet<Category> Categories { get; set; }
    }
}
