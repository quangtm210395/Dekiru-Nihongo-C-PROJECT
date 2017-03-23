using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Main
{
    class User
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ImageLink { get; set; }

        public User(int ID, string Name, string ImageLink)
        {
            this.ID = ID;
            this.Name = Name;
            this.ImageLink = ImageLink;
        }
    }
}
