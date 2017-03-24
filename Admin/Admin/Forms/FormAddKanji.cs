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
    public partial class FormAddKanji : Form
    {
        public int LessonIndex { get; set; }
        public FormAddKanji()
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
            Kanji kanji = new Kanji(lessonID, term, definition);
            int add = DataContext.AddKanji(kanji);
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
