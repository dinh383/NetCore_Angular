using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App.Data.EF
{
    public class DbInitializer
    {
        public static void Initialize(AppDbContext context)
        {
            context.Database.EnsureCreated();

            if (context.Categories.Any())
            {
                return;
            }

            var categories = new Category[]
            {
               new Category {CategoryName = "Coffee", Description="Coffee" },
               new Category {CategoryName = "Tea", Description="Tea" },
               new Category {CategoryName = "Pastry", Description="Pastry" },
               new Category {CategoryName = "Food", Description = "Food"}
            };

            foreach (var c in categories)
            {
                context.Categories.Add(c);

            }
            context.SaveChanges();
        }
    }
}
