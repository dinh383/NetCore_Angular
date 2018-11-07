using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App.Infrastructure.SharedKernel
{
    public static class QueryableExtensions
    {
        public static IQueryable<T> Paginate<T>(
            this IQueryable<T> source,
            int page, int pageSize)
        {
            return source
                .Skip((page) * pageSize)
                .Take(pageSize);
        }
    }
}
