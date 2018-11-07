using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace App.BaseWebAPI.Providers
{
    public class AuthorizationFilter
    {
    }

    public class ClaimRequirementAttribute : TypeFilterAttribute
    {
        public ClaimRequirementAttribute(string claimType, string claimValue) : base(typeof(ClaimRequirementFilter))
        {
            Arguments = new object[] { new Claim(claimType, claimValue) };
        }
    }

    public class ClaimRequirementFilter : IAuthorizationFilter
    {
        private readonly Claim _claim;
        private readonly string _functionId;
        private readonly string _actionId;

        public ClaimRequirementFilter(Claim claim)
        {
            _claim = claim;
            _functionId = _claim.Type;
            _actionId = _claim.Value;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var hasClaims = context.HttpContext.User.Claims.ToList();
            //var hasClaim = context.HttpContext.User.Claims.Any(c => c.Type == _claim.Type && c.Value == _claim.Value);
            //var expiryDate = context.HttpContext.User.Claims.FirstOrDefault(c => c.Type == "exp");
            //var expiryDateValue = expiryDate != null ? expiryDate.Value : "";
            var isAuthenticated = context.HttpContext.User.Identity.IsAuthenticated;
            var userName = context.HttpContext.User.Identity.Name;
            if (!isAuthenticated || !IsHasPermission())
            {
                context.Result = new ForbidResult();
            }
            //if (!hasClaim)
            //{
            //    context.Result = new ForbidResult();
            //}
        }
        private bool IsHasPermission()
        {
            return true;
        }
    }
}
