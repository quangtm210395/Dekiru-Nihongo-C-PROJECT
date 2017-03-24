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
    public partial class FormAddQuiz : Form
    {
        public int LessonIndex { get; set; }
        public FormAddQuiz()
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
            string question = richTextBoxQuestion.Text;
            string answer1 = textBoxAnswer1.Text;
            string answer2 = textBoxAnswer2.Text;
            string answer3 = textBoxAnswer3.Text;
            string correct = textBoxCorrectAnswer.Text;
            if (question.Length == 0)
            {
                MessageBox.Show("Question must not be empty!");
                return;
            }
            if (answer1.Length == 0 || answer2.Length == 0 || answer3.Length == 0 || correct.Length == 0)
            {
                MessageBox.Show("Each answer must not be empty!");
                return;
            }
            Quiz quiz = new Quiz(lessonID, question, answer1, answer2, answer3, correct);
            int add = DataContext.AddQuiz(quiz);
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
