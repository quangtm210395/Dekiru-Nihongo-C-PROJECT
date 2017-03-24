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
    public partial class FormEditQuiz : Form
    {
        public int LessonID { get; set; }
        public int ID { get; set; }
        public FormEditQuiz()
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

            Quiz quiz = DataContext.GetQuizByID(ID);
            textBoxID.Text = ID + "";
            richTextBoxQuestion.Text = quiz.Question;
            textBoxAnswer1.Text = quiz.Answer1;
            textBoxAnswer2.Text = quiz.Answer2;
            textBoxAnswer3.Text = quiz.Answer3;
            textBoxCorrectAnswer.Text = quiz.Correct;
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
            Quiz quiz = new Quiz(ID, lessonID, question, answer1, answer2, answer3, correct);
            int add = DataContext.EditQuiz(quiz);
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
