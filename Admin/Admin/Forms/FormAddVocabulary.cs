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
    public partial class FormAddVocabulary : Form
    {
        public int LessonIndex { get; set; }
        public FormAddVocabulary()
        {
            InitializeComponent();
        }

        public void Init()
        {
            cbbLesson.DataSource = DataContext.GetListLessonByBookID(1);
            cbbLesson.DisplayMember = "Name";
            cbbLesson.ValueMember = "ID";
            cbbLesson.SelectedIndex = LessonIndex;
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            int lessonID = Convert.ToInt32(cbbLesson.SelectedValue);
            string term = textBoxTerm.Text;
            string definition = richTextBoxDef.Text;
            if (term.Length == 0)
            {
                MessageBox.Show("Term must not be empty!");
                return;
            }
            if (definition.Length == 0)
            {
                MessageBox.Show("Definition must not be empty!");
                return;
            }
            Vocabulary vocab = new Vocabulary(lessonID, term, definition);
            int add = DataContext.AddVocabulary(vocab);
            if (add == 1)
            {
                DialogResult dr = MessageBox.Show("Adding success!", "OK", MessageBoxButtons.OK);
                if (dr == DialogResult.OK)
                {
                    this.Close();
                }
            }
        }
    }
}
