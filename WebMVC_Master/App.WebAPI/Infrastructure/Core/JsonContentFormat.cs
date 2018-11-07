using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;

namespace App.WebAPI.Infrastructure.Core
{
    //public class JsonContentFormat
    //{
    //    internal class JsonContentNegotiator : IContentNegotiator
    //    {
    //        private readonly JsonMediaTypeFormatter _jsonFormatter;

    //        public JsonContentNegotiator(JsonMediaTypeFormatter formatter)
    //        {
    //            _jsonFormatter = formatter;
    //            _jsonFormatter.SerializerSettings.ContractResolver =
    //                new CamelCasePropertyNamesContractResolver();
    //        }

    //        public ContentNegotiationResult Negotiate(Type type, HttpRequestMessage request, IEnumerable<MediaTypeFormatter> formatters)
    //        {
    //            return new ContentNegotiationResult(_jsonFormatter, new MediaTypeHeaderValue("application/json"));
    //        }
    //    }
    //}
}