using App.Data.Entities;
using App.Service.Implement;
using App.Service.Interface;
using Microsoft.Extensions.DependencyInjection;
using Quartz;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace App.Service.JobScheduling
{
    [DisallowConcurrentExecution]
    public class JobModel : IJob
    {
        public JobModel()
        {

        }

        public async Task Execute(IJobExecutionContext context)
        {
            Console.WriteLine("RUN-----JobModel------{0}------JobModel--------", DateTime.Now.ToString());
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //var json = $"{{ \"command\": \"{command}\", \"payload\": {{ }}}}";
            //await httpClient.PostAsync(urlGateway, new StringContent(json, Encoding.UTF8, "application/json"));
            var result = await httpClient.PostAsync("http://localhost:3333/api/TestExam/bulkInsertAsync", null);
        }

    }


    [DisallowConcurrentExecution]
    public class JobInsertData : IJob
    {
        public JobInsertData()
        {

        }

        public async Task Execute(IJobExecutionContext context)
        {
            Console.WriteLine("RUN-----JobInsertData------{0}------JobInsertData--------", DateTime.Now.ToString());
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //var json = $"{{ \"command\": \"{command}\", \"payload\": {{ }}}}";
            //await httpClient.PostAsync(urlGateway, new StringContent(json, Encoding.UTF8, "application/json"));
            var result = await httpClient.PostAsync("http://localhost:3333/api/TestExam/bulkInsertAsync", null);
        }

    }
}
