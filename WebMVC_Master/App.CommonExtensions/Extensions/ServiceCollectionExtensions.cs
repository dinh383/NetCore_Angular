using System;
using System.Collections.Generic;
using System.Text;
using App.Data.EF;
using App.Data.EF.Repositories;
using App.Data.Entities;
using App.Data.IRepositories;
using App.Infrastructure.Interface;
using App.Service.Implement;
using App.Service.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
namespace App.CommonExtensions.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddDependencyInjection(this IServiceCollection services)
        {
            services.AddTransient(typeof(IUnitOfWork), typeof(EfUnitOfWork));
            services.AddScoped(typeof(IRepository<>), typeof(GenericRepository<>));

            services.AddTransient(typeof(ICategoryRepository), typeof(CategoryRepository));
            services.AddTransient(typeof(ICategoryService), typeof(CategoryService));

            services.AddTransient(typeof(IRegisterConsultativeRepository), typeof(RegisterConsultativeRepository));
            services.AddTransient(typeof(IRegisterConsultativeService), typeof(RegisterConsultativeService));

            services.AddTransient(typeof(IUserRepository), typeof(UserRepository));
            services.AddTransient(typeof(IUserService), typeof(UserService));

            //Resource
            services.AddTransient(typeof(IResource_CategoryRepository), typeof(Resource_CategoryRepository));
            services.AddTransient(typeof(IResource_CategoryService), typeof(Resource_CategoryService));

            services.AddTransient(typeof(IResource_VideoRepository), typeof(Resource_VideoRepository));
            services.AddTransient(typeof(IResource_VideoService), typeof(Resource_VideoService));

            services.AddTransient(typeof(IResource_ChannelRepository), typeof(Resource_ChannelRepository));
            services.AddTransient(typeof(IResource_ChannelService), typeof(Resource_ChannelService));

            services.AddTransient(typeof(IResource_MagazineRepository), typeof(Resource_MagazineRepository));
            services.AddTransient(typeof(IResource_MagazineService), typeof(Resource_MagazineService));

            services.AddTransient(typeof(IResource_AudioRepository), typeof(Resource_AudioRepository));
            services.AddTransient(typeof(IResource_AudioService), typeof(Resource_AudioService));

            //Test
            services.AddTransient(typeof(ITest_QuestionRepository), typeof(Test_QuestionRepository));
            services.AddTransient(typeof(ITest_QuestionService), typeof(Test_QuestionService));

            services.AddTransient(typeof(ITest_ExamQuestionDetailRepository), typeof(Test_ExamQuestionDetailRepository));
            services.AddTransient(typeof(ITest_ExamQuestionDetailService), typeof(Test_ExamQuestionDetailService));

            services.AddTransient(typeof(ITest_ExamRepository), typeof(Test_ExamRepository));
            services.AddTransient(typeof(ITest_ExamService), typeof(Test_ExamService));

            services.AddTransient(typeof(ITest_ExamStructureRepository), typeof(Test_ExamStructureRepository));
            services.AddTransient(typeof(ITest_ExamStructureService), typeof(Test_ExamStructureService));

            services.AddTransient(typeof(ITest_QuestionDetailRepository), typeof(Test_QuestionDetailRepository));
            services.AddTransient(typeof(ITest_QuestionDetailService), typeof(Test_QuestionDetailService));

            //Dowload Service
            services.AddTransient(typeof(IDownloadService), typeof(DownloadService));

            return services;
        }
        public static IServiceCollection AddDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<AppDbContext>(options =>
                options
                //.UseLazyLoadingProxies()
                .UseSqlServer(configuration.GetConnectionString("AppDbConnection"),
                b => b.MigrationsAssembly("App.Data.EF")));
            return services;
        }
        public static IServiceCollection AddIdentity(this IServiceCollection services)
        {
            services.AddIdentity<AppUser, IdentityRole>()
               .AddEntityFrameworkStores<AppDbContext>()
               .AddDefaultTokenProviders();
            return services;
        }
    }
}
