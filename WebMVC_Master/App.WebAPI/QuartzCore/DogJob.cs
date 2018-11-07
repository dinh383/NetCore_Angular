using Quartz;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace App.WebAPI.QuartzCore
{
    [DisallowConcurrentExecution]
    class DogJob : IJob
    {
        private readonly IDog _dog;

        public DogJob(IDog dog)
        {
            _dog = dog;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            Console.WriteLine("RUN------------------------{0}------------------------", DateTime.Now.ToString());
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //var json = $"{{ \"command\": \"{command}\", \"payload\": {{ }}}}";
            //await httpClient.PostAsync(urlGateway, new StringContent(json, Encoding.UTF8, "application/json"));
            var result = await httpClient.PostAsync("http://localhost:3333/api/TestExam/bulkInsertAsync", null);
            //return result;
        }
    }
}