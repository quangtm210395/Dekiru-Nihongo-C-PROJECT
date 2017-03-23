using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Admin
{
    public class Admin
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public Admin() { }

        public Admin(string Username, string Password)
        {
            this.Username = Username;
            this.Password = Password;
        }
    }
}
