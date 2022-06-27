using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Threading.Tasks;


namespace WebOnlinePoultry.Models
{
    public class Chicken_Profile
    {
        
        public int ChickenId { get; set; }

        public string ChickenType { get; set; }

        public DateTime ChickenBirthday { get; set; }

        public string ChickenBirthWeight { get; set; }

        public string ChickenBreed { get; set; }

        public string ProductType { get; set; }

    }
}