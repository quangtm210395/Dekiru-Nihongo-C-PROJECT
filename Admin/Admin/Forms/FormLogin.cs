using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Admin.Forms
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            string username = textBoxUsername.Text;
            string password = textBoxPassword.Text;
            if (username.Length == 0)
            {
                MessageBox.Show("Please enter username!");
                return;
            }
            if (password.Length == 0)
            {
                MessageBox.Show("Please enter password!");
                return;
            }
            int result = DataContext.Login(username, password);
            if (result == 1)
            {
                FormMain main = new FormMain();
                this.Hide();
                main.Show();
            } else if (result == 0)
            {
                MessageBox.Show("Incorect Password!");
                return;
            } else
            {
                MessageBox.Show("Username does not exists!");
                return;
            }
        }
    }
}
