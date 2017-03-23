using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Admin
{
    class Book
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public Book (int ID, string Name, string Description)
        {
            this.ID = ID;
            this.Name = Name;
            this.Description = Description;
        }

    }
}
