using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Poultry.Models
{
    public class Chicken
    {
        public int Id { get; set; }
        public String ChickenType { get; set; }
        public char ChickenGender { get; set; }
        public int ChickenBirthWeight { get; set; }
        public int ChickenBirthday { get; set; }
        public String ProductType { get; set; }

        public Chicken()
        {

        }
    }
}