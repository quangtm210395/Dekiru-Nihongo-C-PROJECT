using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Main.WinForm
{
    public partial class MainForm : Form
    {
        private Stack<Panel> stackPanelLearn = new Stack<Panel>();
        private Stack<String> stackLabelLearn = new Stack<String>();
        private TransparentLabel labelHiraBackground;

        public MainForm()
        {
            InitializeComponent();
            InitializeSetting();

            InitializeLabels();
        }

        private void InitializeSetting()
        {
            panelMenu.BringToFront();

            dataGridViewVocabulary.AutoGenerateColumns = false;
            dataGridViewVocabulary.Columns.Add("col_Term", "Term");
            dataGridViewVocabulary.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewVocabulary.Columns["col_Term"].Width = 152;
            dataGridViewVocabulary.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewVocabulary.Columns.Add("col_Def", "Definition");
            dataGridViewVocabulary.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewVocabulary.Columns["col_Def"].Width = 400;

            dataGridViewGrammar.AutoGenerateColumns = false;
            dataGridViewGrammar.Columns.Add("col_Term", "Term");
            dataGridViewGrammar.Columns["col_Term"].DataPropertyName = "Term1";
            dataGridViewGrammar.Columns["col_Term"].Width = 569;

            dataGridViewKanji.AutoGenerateColumns = false;
            dataGridViewKanji.Columns.Add("col_Term", "Term");
            dataGridViewKanji.Columns["col_Term"].DataPropertyName = "Term1";
            dataGridViewKanji.Columns["col_Term"].Width = 152;
            dataGridViewKanji.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewKanji.Columns["col_Term"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewKanji.Columns.Add("col_Def", "Definition");
            dataGridViewKanji.Columns["col_Def"].DataPropertyName = "Term2";
            dataGridViewKanji.Columns["col_Def"].Width = 417;
        }

        // Login

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            panelUser.Visible = true;
            buttonLearn.BringToFront();
        }

        private void buttonLogoutUser_Click(object sender, EventArgs e)
        {
            panelUser.Visible = false;
            buttonLogin.BringToFront();
        }

        // Learn

        private void buttonLearn_Click(object sender, EventArgs e)
        {
            panelLearn.BringToFront();

            stackPanelLearn.Push(panelLearnChooser);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Learning");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonLearnBack_Click(object sender, EventArgs e)
        {
            stackPanelLearn.Pop();
            stackLabelLearn.Pop();
            if (stackPanelLearn.Count == 0) panelLearn.SendToBack();
            else
            {
                stackPanelLearn.Peek().BringToFront();
                labelLearn.Text = stackLabelLearn.Peek();
            }
        }

        // Learn Basic

        private void buttonLearnBasic_Click(object sender, EventArgs e)
        {
            stackPanelLearn.Push(panelLearnBasic);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Learning Basic Alphabet");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonHiragana_Click(object sender, EventArgs e)
        {
            labelHiraChar.Image = null;
            panelHiraTable.BringToFront();

            stackPanelLearn.Push(panelLearnHira);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Hiragana");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonKatakana_Click(object sender, EventArgs e)
        {
            stackPanelLearn.Push(panelLearnKata);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Katakana");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        // Basic Deeper

        private Bitmap[,] HiraBitmap;

        private void InitializeLabels()
        {
            labelHiraBackground = new TransparentLabel();
            panelHiraAnime.Controls.Add(labelHiraBackground);
            labelHiraAnime.BringToFront();
            labelHiraBackground.BringToFront();
            labelHiraChar.BringToFront();

            labelHiraBackground.Dock = DockStyle.Fill;
            labelHiraBackground.Location = new Point(0, 0);
            labelHiraBackground.Size = new Size(600, 360);
            labelHiraBackground.MouseClick += LabelHiraBackground_MouseClick;

            HiraBitmap = new Bitmap[5, 11];
            HiraBitmap[0, 0] = Properties.Resources.X_Hira_N;
            HiraBitmap[0, 1] = Properties.Resources.X_Hira_Wa;
            HiraBitmap[0, 2] = Properties.Resources.X_Hira_Ra;
            HiraBitmap[0, 3] = Properties.Resources.X_Hira_Ya;
            HiraBitmap[0, 4] = Properties.Resources.X_Hira_Ma;
            HiraBitmap[0, 5] = Properties.Resources.X_Hira_Ha;
            HiraBitmap[0, 6] = Properties.Resources.X_Hira_Na;
            HiraBitmap[0, 7] = Properties.Resources.X_Hira_Ta;
            HiraBitmap[0, 8] = Properties.Resources.X_Hira_Sa;
            HiraBitmap[0, 9] = Properties.Resources.X_Hira_Ka;
            HiraBitmap[0, 10] = Properties.Resources.X_Hira_A;
            HiraBitmap[1, 2] = Properties.Resources.X_Hira_Ri;
            HiraBitmap[1, 4] = Properties.Resources.X_Hira_Mi;
            HiraBitmap[1, 5] = Properties.Resources.X_Hira_Hi;
            HiraBitmap[1, 6] = Properties.Resources.X_Hira_Ni;
            HiraBitmap[1, 7] = Properties.Resources.X_Hira_Chi;
            HiraBitmap[1, 8] = Properties.Resources.X_Hira_Shi;
            HiraBitmap[1, 9] = Properties.Resources.X_Hira_Ki;
            HiraBitmap[1, 10] = Properties.Resources.X_Hira_I;
            HiraBitmap[2, 2] = Properties.Resources.X_Hira_Ru;
            HiraBitmap[2, 3] = Properties.Resources.X_Hira_Yu;
            HiraBitmap[2, 4] = Properties.Resources.X_Hira_Mu;
            HiraBitmap[2, 5] = Properties.Resources.X_Hira_Fu;
            HiraBitmap[2, 6] = Properties.Resources.X_Hira_Nu;
            HiraBitmap[2, 7] = Properties.Resources.X_Hira_Tsu;
            HiraBitmap[2, 8] = Properties.Resources.X_Hira_Su;
            HiraBitmap[2, 9] = Properties.Resources.X_Hira_Ku;
            HiraBitmap[2, 10] = Properties.Resources.X_Hira_U;
            HiraBitmap[3, 2] = Properties.Resources.X_Hira_Re;
            HiraBitmap[3, 4] = Properties.Resources.X_Hira_Me;
            HiraBitmap[3, 5] = Properties.Resources.X_Hira_He;
            HiraBitmap[3, 6] = Properties.Resources.X_Hira_Ne;
            HiraBitmap[3, 7] = Properties.Resources.X_Hira_Te;
            HiraBitmap[3, 8] = Properties.Resources.X_Hira_Se;
            HiraBitmap[3, 9] = Properties.Resources.X_Hira_Ke;
            HiraBitmap[3, 10] = Properties.Resources.X_Hira_E;
            HiraBitmap[4, 1] = Properties.Resources.X_Hira_Wo;
            HiraBitmap[4, 2] = Properties.Resources.X_Hira_Ro;
            HiraBitmap[4, 3] = Properties.Resources.X_Hira_Yo;
            HiraBitmap[4, 4] = Properties.Resources.X_Hira_Mo;
            HiraBitmap[4, 5] = Properties.Resources.X_Hira_Ho;
            HiraBitmap[4, 6] = Properties.Resources.X_Hira_No;
            HiraBitmap[4, 7] = Properties.Resources.X_Hira_To;
            HiraBitmap[4, 8] = Properties.Resources.X_Hira_So;
            HiraBitmap[4, 9] = Properties.Resources.X_Hira_Ko;
            HiraBitmap[4, 10] = Properties.Resources.X_Hira_O;
        }

        private void labelLearnHira_MouseClick(object sender, MouseEventArgs e)
        {
            Bitmap hiragana = HiraBitmap[e.Location.Y / 58, e.Location.X / 49];
            if (hiragana == null) return;
            labelHiraChar.Image = hiragana;
            panelHiraAnime.BringToFront();
        }

        private void LabelHiraBackground_MouseClick(object sender, MouseEventArgs e)
        {
            labelHiraChar.Image = null;
            panelHiraTable.BringToFront();
        }

        // Learn Lesson

        private void buttonLearnLesson_Click(object sender, EventArgs e)
        {
            listBoxLesson.DataSource = DataUsing.GetListLessonName(1);
            listBoxLesson.SelectedIndex = -1;

            stackPanelLearn.Push(panelLearnLessonChooser);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Learning By Lesson");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        // Lesson Chooser

        private void listBoxLesson_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            int index = listBoxLesson.IndexFromPoint(e.Location);
            Lesson lesson = DataContext.GetListLessonByBookID(1)[index];
            listBoxLesson_Chosen(lesson);
        }

        private void listBoxLesson_KeyDown(object sender, KeyEventArgs e)
        {
            int index = listBoxLesson.SelectedIndex;
            Lesson lesson = DataContext.GetListLessonByBookID(1)[index];
            if (e.KeyCode == Keys.Enter) listBoxLesson_Chosen(lesson);
        }

        private void listBoxLesson_Chosen(Lesson lesson)
        {
            tabControlLearning.SelectedIndex = 3;
            tabControlLearning.SelectedIndex = 2;
            tabControlLearning.SelectedIndex = 1;
            tabControlLearning.SelectedIndex = 0;

            dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyByLessonID(lesson.ID);
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonID(lesson.ID);
            dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonID(lesson.ID);

            if (dataGridViewVocabulary.SelectedRows.Count > 0) dataGridViewVocabulary.SelectedRows[0].Selected = false;
            if (dataGridViewGrammar.SelectedRows.Count > 0) dataGridViewGrammar.SelectedRows[0].Selected = false;
            if (dataGridViewKanji.SelectedRows.Count > 0) dataGridViewKanji.SelectedRows[0].Selected = false;

            stackPanelLearn.Push(panelLearnLesson);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("- Lesson " + lesson.LessonNumber + " -");
            labelLearn.Text = stackLabelLearn.Peek();

            lessonID = lesson.ID;
        }

        // Tab Control Setting

        private void tabControlLearning_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabControlLearning.SelectedIndex == 0) panelVocabChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 1) panelGrammarChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 2) panelKanjiChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 3) panelQuizChooser.BringToFront();
        }

        private void dataGridViewGrammar_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int index = e.RowIndex;
            if (index == -1) return;

            Grammar grammar = ((List<Grammar>)dataGridViewGrammar.DataSource)[index];
            labelGrammarTerm.Text = grammar.Term1;
            textBoxGrammarDef.Text = DataUsing.GetDefinitionText(grammar.Definition);

            panelGrammarDetail.BringToFront();
        }

        private void dataGridViewKanji_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int index = e.RowIndex;
            if (index == -1) return;

            Kanji kanji = ((List<Kanji>)dataGridViewKanji.DataSource)[index];
            labelKanjiTerm.Text = kanji.Term.Substring(5);
            textBoxKanjiDef.Text = DataUsing.GetDefinitionText(kanji.Definition);

            panelKanjiDetail.BringToFront();
        }

        // Get back while Learning

        private void buttonVocabBack_Click(object sender, EventArgs e)
        {
            panelVocabChooser.BringToFront();
        }

        private void buttonGrammarBack_Click(object sender, EventArgs e)
        {
            panelGrammarChooser.BringToFront();
        }

        private void buttonKanjiBack_Click(object sender, EventArgs e)
        {
            panelKanjiChooser.BringToFront();
        }

        private void buttonQuizBack_Click(object sender, EventArgs e)
        {
            panelQuizChooser.BringToFront();
        }

        // Learn Vocabulary

        private int lessonID;
        private int remain, correct, wrong;
        List<Vocabulary> listVocab;
        Vocabulary quizVocab;

        private void startLearnVocab()
        {
            buttonVocabNext.Enabled = true;
            listVocab = DataContext.GetListVocabularyRandomByLessonID(lessonID);
            correct = 0;
            wrong = 0;

            remain = listVocab.Count;
            labelVocabRemainText.Text = "" + remain;
            labelVocabCorrectText.Text = "" + correct;
            labelVocabWrongText.Text = "" + wrong;

            nextQuizLearnVocab();
        }

        private void nextQuizLearnVocab()
        {
            quizVocab = listVocab[new Random().Next(listVocab.Count)];
            listVocab.Remove(quizVocab);

            remain = listVocab.Count;
            labelVocabRemainText.Text = "" + remain;

            labelVocabQuestion.Text = quizVocab.Definition;
            textBoxVocabAnswer.Text = "";
            textBoxVocabAnswer.ReadOnly = false;
            labelVocabHint.Visible = false;

            textBoxVocabAnswer.Focus();
        }

        private void showAnswerLearnVocab()
        {
            textBoxVocabAnswer.ReadOnly = true;
            labelVocabHint.Text = quizVocab.Term;
            labelVocabHint.Visible = true;
            if (textBoxVocabAnswer.Text == labelVocabHint.Text)
            {
                labelVocabHint.ForeColor = Color.Green;
                correct++;
            }
            else
            {
                labelVocabHint.ForeColor = Color.Red;
                wrong++;
            }
            labelVocabCorrectText.Text = "" + correct;
            labelVocabWrongText.Text = "" + wrong;

            buttonVocabNext.Focus();
            if (listVocab.Count == 0) buttonVocabNext.Enabled = false;
        }

        private void buttonVocabLearn_Click(object sender, EventArgs e)
        {
            startLearnVocab();

            panelVocabDetail.BringToFront();
        }

        private void textBoxVocabAnswer_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                showAnswerLearnVocab();
        }

        private void buttonVocabAgain_Click(object sender, EventArgs e)
        {
            startLearnVocab();
        }

        private void buttonVocabNext_Click(object sender, EventArgs e)
        {
            if (labelVocabHint.Visible)
                nextQuizLearnVocab();
            else showAnswerLearnVocab();
        }






        // Quiz

        private void buttonQuizStart_Click(object sender, EventArgs e)
        {


            panelQuizDetail.BringToFront();
        }







        // Other

        private void buttonSetting_Click(object sender, EventArgs e)
        {
            panelSetting.BringToFront();
        }

        private void buttonSettingBack_Click(object sender, EventArgs e)
        {
            panelSetting.SendToBack();
        }

        private void buttonAbout_Click(object sender, EventArgs e)
        {
            panelAbout.BringToFront();
        }

        private void buttonAboutBack_Click(object sender, EventArgs e)
        {
            panelAbout.SendToBack();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        protected override bool ProcessTabKey(bool forward)
        {
            return false;
        }
    }
}
