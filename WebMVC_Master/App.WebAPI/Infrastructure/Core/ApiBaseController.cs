using App.Service;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;

namespace App.WebAPI.Infrastructure.Core
{
    public class ApiBaseController : Microsoft.AspNetCore.Mvc.Controller
    {
        private IErrorService _errorService;

        public ApiBaseController(IErrorService errorService)
        {
            _errorService = errorService;
        }

        //Code removed from brevity

        //protected ApplicationRoleManager AppRoleManager
        //{
        //    get
        //    {
        //        return Request.GetOwinContext().GetUserManager<ApplicationRoleManager>();
        //    }
        //}

        //protected ApplicationUserManager AppUserManager
        //{
        //    get
        //    {
        //        return Request.GetOwinContext().GetUserManager<ApplicationUserManager>();
        //    }
        //}

        protected HttpResponseMessage CreateHttpResponse(HttpRequestMessage requestMessage, Func<HttpResponseMessage> function)
        {
            HttpResponseMessage response = null;
            try
            {
                response = function.Invoke();
            }
            //catch (DbEntityValidationException ex)
            //{
            //    foreach (var eve in ex.EntityValidationErrors)
            //    {
            //        Trace.WriteLine($"Entity of type \"{eve.Entry.Entity.GetType().Name}\" in state \"{eve.Entry.State}\" has the following validation error.");
            //        foreach (var ve in eve.ValidationErrors)
            //        {
            //            Trace.WriteLine($"- Property: \"{ve.PropertyName}\", Error: \"{ve.ErrorMessage}\"");
            //        }
            //    }
            //    LogError(ex);
            //    response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.InnerException.Message);
            //}
            catch (DbUpdateException dbEx)
            {
                LogError(dbEx);
                //response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, dbEx.InnerException.Message);
                //response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, dbEx.InnerException.Message);
            }
            catch (Exception ex)
            {
                LogError(ex);
                //response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
            return response;
        }

        private void LogError(Exception ex)
        {
            //try
            //{
            //    SYS_Error error = new SYS_Error();
            //    error.CreateDate = DateTime.Now;
            //    error.Message = ex.Message;
            //    error.StackTrace = ex.StackTrace;
            //    _errorService.Create(error);
            //    _errorService.Save();
            //}
            //catch
            //{
            //}
        }

        /// <summary>
        /// Returns an individual HTTP Header value
        /// </summary>
        /// <param name="request"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetHeader(HttpRequestMessage request, string key)
        {
            IEnumerable<string> keys = null;
            if (!request.Headers.TryGetValues(key, out keys))
                return null;

            return keys.First();
        }
        //public void GetInfoClaims()
        //{
        //    ClaimsPrincipal principal = Request.GetRequestContext().Principal as ClaimsPrincipal;
        //    var claims = principal.Claims;
        //    foreach (var item in claims)
        //    {
        //        if (item.Type == "username")
        //        {
        //            var useName = item.Value;
        //        }
        //    }
        //}
    }
}
