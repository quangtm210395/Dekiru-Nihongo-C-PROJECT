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
    public partial class FormEditKanji : Form
    {
        public int ID { get; set; }
        public int LessonID { get; set; }
        public FormEditKanji()
        {
            InitializeComponent();
        }

        public void Init()
        {
            cbbLesson.DataSource = DataContext.GetListLessonByBookID(1);
            cbbLesson.DisplayMember = "Name";
            cbbLesson.ValueMember = "ID";

            List<Lesson> lessons = DataContext.GetListLessonByBookID(1);
            int i = 0;
            for (i = 0; i < lessons.Count; i++)
            {
                if (lessons[i].ID == LessonID) break;
            }
            cbbLesson.SelectedIndex = i;

            Kanji kanji = DataContext.GetKanjiByID(ID);
            textBoxID.Text = ID + "";
            textBoxTerm.Text = kanji.Term;
            richTextBoxDef.Text = kanji.Definition;
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
            Kanji kanji = new Kanji(ID, lessonID, term, definition);
            int add = DataContext.EditKanji(kanji);
            if (add == 1)
            {
                DialogResult dr = MessageBox.Show("Editing success!", "OK", MessageBoxButtons.OK);
                if (dr == DialogResult.OK)
                {
                    this.Close();
                }
            }
        }
    }
}
