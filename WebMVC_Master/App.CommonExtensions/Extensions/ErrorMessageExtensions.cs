using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.CommonExtensions.Extensions
{
    public static class ErrorMessageExtensions
    {
        public static string GetFullErrorMessage(this ModelStateDictionary modelState)
        {
            var messages = new List<string>();
            foreach (var entry in modelState)
            {
                foreach (var error in entry.Value.Errors)
                    messages.Add(error.ErrorMessage);
            }
            return String.Join(" - ", messages);
        }
    }
}
