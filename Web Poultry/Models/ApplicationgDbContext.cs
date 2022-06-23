using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Web_Poultry.Models
{
    public class ApplicationgDbContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public ApplicationgDbContext() : base("name=ApplicationgDbContext")
        {
        }

        public System.Data.Entity.DbSet<Web_Poultry.Models.Chicken> Chickens { get; set; }
    }
}
