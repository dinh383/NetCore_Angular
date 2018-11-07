﻿// <auto-generated />
using System;
using App.Data.EF;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace App.Data.EF.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20180710145125_UserIdentify")]
    partial class UserIdentify
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.0-rtm-30799")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("App.Data.Entities.AppUser", b =>
                {
                    b.Property<string>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("AccessFailedCount");

                    b.Property<string>("Avatar")
                        .HasMaxLength(300);

                    b.Property<DateTime?>("BirthDay");

                    b.Property<string>("ConcurrencyStamp");

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Email");

                    b.Property<bool>("EmailConfirmed");

                    b.Property<string>("FullName")
                        .HasMaxLength(200);

                    b.Property<bool>("LockoutEnabled");

                    b.Property<DateTimeOffset?>("LockoutEnd");

                    b.Property<string>("NormalizedEmail");

                    b.Property<string>("NormalizedUserName");

                    b.Property<string>("PasswordHash");

                    b.Property<string>("PhoneNumber");

                    b.Property<bool>("PhoneNumberConfirmed");

                    b.Property<string>("SecurityStamp");

                    b.Property<bool>("Stop");

                    b.Property<bool>("TwoFactorEnabled");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.Property<string>("UserName")
                        .IsRequired();

                    b.HasKey("Id");

                    b.ToTable("AppUser");
                });

            modelBuilder.Entity("App.Data.Entities.Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CategoryName")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<int>("Id");

                    b.Property<bool>("Stop");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("CategoryId");

                    b.ToTable("Category");
                });

            modelBuilder.Entity("App.Data.Entities.Course", b =>
                {
                    b.Property<int>("CourseId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CourseName")
                        .HasMaxLength(200);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("CreateDate");

                    b.Property<bool>("Stop");

                    b.Property<decimal?>("Tuition")
                        .HasColumnType("numeric");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("CourseId");

                    b.ToTable("Course");
                });

            modelBuilder.Entity("App.Data.Entities.RegisterConsultative", b =>
                {
                    b.Property<int>("RegisterId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasMaxLength(200);

                    b.Property<int?>("AgeId");

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<DateTime?>("DateLearnTrial")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .HasMaxLength(50);

                    b.Property<int?>("FinancialResourceId");

                    b.Property<string>("FullName")
                        .IsRequired()
                        .HasMaxLength(100);

                    b.Property<bool?>("IsLearnTrial");

                    b.Property<string>("Note")
                        .HasMaxLength(500);

                    b.Property<int?>("OccupationId");

                    b.Property<string>("Phone")
                        .IsRequired()
                        .HasMaxLength(15);

                    b.Property<int?>("ReasonId");

                    b.Property<int?>("ShiftStudyId");

                    b.Property<bool>("Stop");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("RegisterId");

                    b.ToTable("RegisterConsultative");
                });

            modelBuilder.Entity("App.Data.Entities.Resource_Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CategoryName")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<bool>("Stop");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("CategoryId");

                    b.ToTable("Resource.Category");
                });

            modelBuilder.Entity("App.Data.Entities.Resource_Channel", b =>
                {
                    b.Property<int>("ChannelId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("ChannelName")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<string>("ChannelYouTubeId")
                        .HasMaxLength(200);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<bool>("Stop");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("ChannelId");

                    b.ToTable("Resource.Channel");
                });

            modelBuilder.Entity("App.Data.Entities.Resource_Tag", b =>
                {
                    b.Property<int>("TagId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<bool>("Stop");

                    b.Property<string>("TagName")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.HasKey("TagId");

                    b.ToTable("Resource.Tag");
                });

            modelBuilder.Entity("App.Data.Entities.Resource_Video", b =>
                {
                    b.Property<int>("LineId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("CategoryId");

                    b.Property<int>("ChannelId");

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<int?>("Likes");

                    b.Property<bool>("Stop");

                    b.Property<string>("Title")
                        .HasMaxLength(200);

                    b.Property<int?>("UnLikes");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.Property<string>("UrlImage")
                        .HasMaxLength(300);

                    b.Property<string>("UrlUseIframe")
                        .HasMaxLength(200);

                    b.Property<string>("UrlYoutube")
                        .HasMaxLength(200);

                    b.Property<string>("VideoID")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<string>("VideoName")
                        .IsRequired()
                        .HasMaxLength(200);

                    b.Property<int?>("Views");

                    b.HasKey("LineId");

                    b.ToTable("Resource.Video");
                });

            modelBuilder.Entity("App.Data.Entities.Resource_VideoTagDetail", b =>
                {
                    b.Property<int>("LineId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CreateByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime>("CreateDate");

                    b.Property<string>("Description")
                        .HasMaxLength(500);

                    b.Property<bool>("Stop");

                    b.Property<int>("TagId");

                    b.Property<string>("UpdtByUser")
                        .HasMaxLength(30);

                    b.Property<DateTime?>("UpdtDate");

                    b.Property<string>("VideoID")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.HasKey("LineId");

                    b.ToTable("Resource.VideoTagDetail");
                });
#pragma warning restore 612, 618
        }
    }
}
