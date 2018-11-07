using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace App.BaseWebAPI.Quartz
{
    public class QuartzJob<T> where T : IJob
    {
        public static async Task RunJobQuartz(string jobKeyName, string jobTriggerName, int scheduleIntervalInTime)
        {
            IScheduler scheduler;
            var schedulerFactory = new StdSchedulerFactory();
            scheduler = schedulerFactory.GetScheduler().Result;
            scheduler.Start().Wait();
            JobKey jobKey = JobKey.Create(jobKeyName);

            IJobDetail job = JobBuilder.Create<T>().WithIdentity(jobKey).Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithIdentity(jobTriggerName)
                .StartNow()
                .WithSimpleSchedule(x => x.WithIntervalInSeconds(scheduleIntervalInTime).RepeatForever())
                .Build();

            await scheduler.ScheduleJob(job, trigger);
        }
    }
}
