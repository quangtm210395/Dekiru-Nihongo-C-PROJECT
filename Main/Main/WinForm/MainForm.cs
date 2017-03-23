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

        public MainForm()
        {
            InitializeComponent();
            InitializeLearnLessonDataGridViews();
            InitializeLearnBasicLabelBackground();
            InitializeVariables();
        }

        private User user;
        private Lesson lesson;

        private void InitializeVariables()
        {
            radioChoices = new List<RadioButton> { radioButtonA, radioButtonB, radioButtonC, radioButtonD };
            labelChoices = new List<Label> { labelChoiceA, labelChoiceB, labelChoiceC, labelChoiceD };
        }

        private void InitializeLearnLessonDataGridViews()
        {
            panelMenu.BringToFront();

            dataGridViewVocabulary.AutoGenerateColumns = false;
            dataGridViewVocabulary.Columns.Add("col_Term", "Term");
            dataGridViewVocabulary.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewVocabulary.Columns["col_Term"].Width = 152;
            dataGridViewVocabulary.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewVocabulary.Columns.Add("col_Def", "Definition");
            dataGridViewVocabulary.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewVocabulary.Columns["col_Def"].Width = 380;
            DataGridViewImageColumn imageColumn = new DataGridViewImageColumn();
            imageColumn.Width = 20;
            dataGridViewVocabulary.Columns.Add(imageColumn);
            dataGridViewVocabulary.CellMouseEnter += DataGridViewVocabulary_CellMouseEnter;
            dataGridViewVocabulary.CellClick += DataGridViewVocabulary_CellClick;
            dataGridViewVocabulary.MouseLeave += DataGridViewVocabulary_MouseLeave;

            dataGridViewGrammar.AutoGenerateColumns = false;
            dataGridViewGrammar.Columns.Add("col_Term", "Term");
            dataGridViewGrammar.Columns["col_Term"].DataPropertyName = "Term";
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

            dataGridViewFavorite.AutoGenerateColumns = false;
            dataGridViewFavorite.Columns.Add("col_Term", "Term");
            dataGridViewFavorite.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewFavorite.Columns["col_Term"].Width = 152;
            dataGridViewFavorite.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewFavorite.Columns.Add("col_Def", "Definition");
            dataGridViewFavorite.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewFavorite.Columns["col_Def"].Width = 380;
            DataGridViewImageColumn imageColumn2 = new DataGridViewImageColumn();
            imageColumn2.Width = 20;
            dataGridViewFavorite.Columns.Add(imageColumn2);
            dataGridViewFavorite.CellMouseEnter += DataGridViewFavorite_CellMouseEnter;
            dataGridViewFavorite.CellClick += DataGridViewFavorite_CellClick;
            dataGridViewFavorite.MouseLeave += DataGridViewFavorite_MouseLeave;
        }

        private void DataGridViewVocabulary_MouseLeave(object sender, EventArgs e)
        {
            Cursor = Cursors.Arrow;
        }

        private void DataGridViewVocabulary_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2 & e.RowIndex != -1)
            {
                int vocabID = ((List<Vocabulary>)dataGridViewVocabulary.DataSource)[e.RowIndex].ID;
                dataGridViewVocabulary.Rows[e.RowIndex].Cells[2].Value = DataContext.ChangeFavourite(user.ID, vocabID) ?
                    Properties.Resources.Empty : Properties.Resources.Like;
                dataGridViewVocabulary.SelectedCells[0].Selected = false;
            }
        }

        private void DataGridViewVocabulary_CellMouseEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2 & e.RowIndex != -1)
                Cursor = Cursors.Hand;
            else Cursor = Cursors.Arrow;
        }

        private void DataGridViewFavorite_MouseLeave(object sender, EventArgs e)
        {
            Cursor = Cursors.Arrow;
        }

        private void DataGridViewFavorite_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2 & e.RowIndex != -1)
            {
                int favorID = ((List<Vocabulary>)dataGridViewFavorite.DataSource)[e.RowIndex].ID;
                dataGridViewFavorite.Rows[e.RowIndex].Cells[2].Value = DataContext.ChangeFavourite(user.ID, favorID) ?
                    Properties.Resources.Empty : Properties.Resources.Like;
                dataGridViewFavorite.SelectedCells[0].Selected = false;
            }
        }

        private void DataGridViewFavorite_CellMouseEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2 & e.RowIndex != -1)
                Cursor = Cursors.Hand;
            else Cursor = Cursors.Arrow;
        }

        // Login

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            textBoxLoginUsername.Text = "";
            textBoxLoginPassword.Text = "";
            labelLoginFailed.Visible = false;
            groupBoxLogin.Visible = true;
            groupBoxLogin.BringToFront();
            textBoxLoginUsername.Focus();
        }

        private void buttonLogout_Click(object sender, EventArgs e)
        {
            panelUser.Visible = false;
            buttonRegister.Enabled = true;
            buttonLogin.BringToFront();
            buttonLogin.Focus();
        }

        private void textBoxLoginUsername_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) textBoxLoginPassword.Focus();
        }

        private void textBoxLoginPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) buttonLoginGo_Click(null, null);
        }

        private void buttonLoginGo_Click(object sender, EventArgs e)
        {
            user = DataContext.Login(textBoxLoginUsername.Text, textBoxLoginPassword.Text);
            if (user.ID == 0)
            {
                labelLoginFailed.Visible = true;
                textBoxLoginUsername.Focus();
            }
            else
            {
                groupBoxLogin.Visible = false;
                buttonRegister.Enabled = false;

                labelUsername.Text = user.Name;
                panelUser.Visible = true;

                buttonLearn.BringToFront();
                buttonLearn.Focus();
            }
        }

        private void buttonLoginCancel_Click(object sender, EventArgs e)
        {
            groupBoxLogin.Visible = false;
            textBoxLoginUsername.Text = "";
            textBoxLoginPassword.Text = "";
            buttonLogin.Focus();
        }

        // Register

        private void buttonRegister_Click(object sender, EventArgs e)
        {
            textBoxRegisUsername.Text = "";
            textBoxRegisPassword.Text = "";
            textBoxRegisNickname.Text = "";
            labelRegisterFailed.Visible = false;
            groupBoxRegister.Visible = true;
            groupBoxRegister.BringToFront();
            textBoxRegisUsername.Focus();
        }

        private void textBoxRegisUsername_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) textBoxRegisPassword.Focus();
        }

        private void textBoxRegisPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) textBoxRegisNickname.Focus();
        }

        private void textBoxRegisNickname_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) buttonRegisterGo.Focus();
        }

        private void buttonRegisterGo_Click(object sender, EventArgs e)
        {
            try
            {
                user = DataContext.Register(textBoxRegisUsername.Text, textBoxRegisPassword.Text, textBoxRegisNickname.Text);
            }
            catch (Exception ex)
            {
                labelRegisterFailed.Text = ex.Message;
                labelRegisterFailed.Visible = true;
                labelLoginFailed.Visible = true;
                textBoxRegisUsername.Focus();
                return;
            }
            groupBoxRegister.Visible = false;
            buttonRegister.Enabled = false;

            labelUsername.Text = user.Name;
            panelUser.Visible = true;

            buttonLearn.BringToFront();
            buttonLearn.Focus();
        }

        private void buttonRegisterCancel_Click(object sender, EventArgs e)
        {
            groupBoxRegister.Visible = false;
            textBoxRegisUsername.Text = "";
            textBoxRegisPassword.Text = "";
            buttonLogin.Focus();
        }

        // Learn

        private void buttonLearn_Click(object sender, EventArgs e)
        {
            panelLearn.BringToFront();
            buttonBackLearn.Focus();

            stackPanelLearn.Push(panelLearnChooser);
            stackPanelLearn.Peek().BringToFront();

            stackLabelLearn.Push("Learning");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonLearnBack_Click(object sender, EventArgs e)
        {
            stackPanelLearn.Pop();
            stackLabelLearn.Pop();

            if (stackPanelLearn.Count == 0)
            {
                panelMenu.BringToFront();
                buttonLearn.Focus();
            }
            else
            {
                stackPanelLearn.Peek().BringToFront();
                labelLearn.Text = stackLabelLearn.Peek();
                buttonBackLearn.Focus();
            }
        }

        // Learn Basic

        private void buttonLearnBasic_Click(object sender, EventArgs e)
        {
            stackPanelLearn.Push(panelLearnBasic);
            stackPanelLearn.Peek().BringToFront();
            buttonBackLearn.Focus();

            stackLabelLearn.Push("Learning Basic Alphabet");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonHiragana_Click(object sender, EventArgs e)
        {
            labelHiraChar.Image = null;
            panelHiraTable.BringToFront();

            stackPanelLearn.Push(panelLearnHira);
            stackPanelLearn.Peek().BringToFront();
            buttonBackLearn.Focus();

            stackLabelLearn.Push("Hiragana");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        private void buttonKatakana_Click(object sender, EventArgs e)
        {
            labelKataChar.Image = null;
            panelKataTable.BringToFront();

            stackPanelLearn.Push(panelLearnKata);
            stackPanelLearn.Peek().BringToFront();
            buttonBackLearn.Focus();

            stackLabelLearn.Push("Katakana");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        // Basic Deeper

        private TransparentLabel labelHiraBackground;
        private Bitmap[,] HiraBitmap;
        private TransparentLabel labelKataBackground;
        private Bitmap[,] KataBitmap;

        private void InitializeLearnBasicLabelBackground()
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

            labelKataBackground = new TransparentLabel();
            panelKataAnime.Controls.Add(labelKataBackground);
            labelKataAnime.BringToFront();
            labelKataBackground.BringToFront();
            labelKataChar.BringToFront();

            labelKataBackground.Dock = DockStyle.Fill;
            labelKataBackground.Location = new Point(0, 0);
            labelKataBackground.Size = new Size(600, 360);
            labelKataBackground.MouseClick += labelKataBackground_MouseClick;

            KataBitmap = new Bitmap[5, 11];
            KataBitmap[0, 0] = Properties.Resources.X_Kata_N;
            KataBitmap[0, 1] = Properties.Resources.X_Kata_Wa;
            KataBitmap[0, 2] = Properties.Resources.X_Kata_Ra;
            KataBitmap[0, 3] = Properties.Resources.X_Kata_Ya;
            KataBitmap[0, 4] = Properties.Resources.X_Kata_Ma;
            KataBitmap[0, 5] = Properties.Resources.X_Kata_Ha;
            KataBitmap[0, 6] = Properties.Resources.X_Kata_Na;
            KataBitmap[0, 7] = Properties.Resources.X_Kata_Ta;
            KataBitmap[0, 8] = Properties.Resources.X_Kata_Sa;
            KataBitmap[0, 9] = Properties.Resources.X_Kata_Ka;
            KataBitmap[0, 10] = Properties.Resources.X_Kata_A;
            KataBitmap[1, 2] = Properties.Resources.X_Kata_Ri;
            KataBitmap[1, 4] = Properties.Resources.X_Kata_Mi;
            KataBitmap[1, 5] = Properties.Resources.X_Kata_Hi;
            KataBitmap[1, 6] = Properties.Resources.X_Kata_Ni;
            KataBitmap[1, 7] = Properties.Resources.X_Kata_Chi;
            KataBitmap[1, 8] = Properties.Resources.X_Kata_Shi;
            KataBitmap[1, 9] = Properties.Resources.X_Kata_Ki;
            KataBitmap[1, 10] = Properties.Resources.X_Kata_I;
            KataBitmap[2, 2] = Properties.Resources.X_Kata_Ru;
            KataBitmap[2, 3] = Properties.Resources.X_Kata_Yu;
            KataBitmap[2, 4] = Properties.Resources.X_Kata_Mu;
            KataBitmap[2, 5] = Properties.Resources.X_Kata_Fu;
            KataBitmap[2, 6] = Properties.Resources.X_Kata_Nu;
            KataBitmap[2, 7] = Properties.Resources.X_Kata_Tsu;
            KataBitmap[2, 8] = Properties.Resources.X_Kata_Su;
            KataBitmap[2, 9] = Properties.Resources.X_Kata_Ku;
            KataBitmap[2, 10] = Properties.Resources.X_Kata_U;
            KataBitmap[3, 2] = Properties.Resources.X_Kata_Re;
            KataBitmap[3, 4] = Properties.Resources.X_Kata_Me;
            KataBitmap[3, 5] = Properties.Resources.X_Kata_He;
            KataBitmap[3, 6] = Properties.Resources.X_Kata_Ne;
            KataBitmap[3, 7] = Properties.Resources.X_Kata_Te;
            KataBitmap[3, 8] = Properties.Resources.X_Kata_Se;
            KataBitmap[3, 9] = Properties.Resources.X_Kata_Ke;
            KataBitmap[3, 10] = Properties.Resources.X_Kata_E;
            KataBitmap[4, 1] = Properties.Resources.X_Kata_Wo;
            KataBitmap[4, 2] = Properties.Resources.X_Kata_Ro;
            KataBitmap[4, 3] = Properties.Resources.X_Kata_Yo;
            KataBitmap[4, 4] = Properties.Resources.X_Kata_Mo;
            KataBitmap[4, 5] = Properties.Resources.X_Kata_Ho;
            KataBitmap[4, 6] = Properties.Resources.X_Kata_No;
            KataBitmap[4, 7] = Properties.Resources.X_Kata_To;
            KataBitmap[4, 8] = Properties.Resources.X_Kata_So;
            KataBitmap[4, 9] = Properties.Resources.X_Kata_Ko;
            KataBitmap[4, 10] = Properties.Resources.X_Kata_O;
        }

        private void labelHiraTable_MouseClick(object sender, MouseEventArgs e)
        {
            int x = e.Location.X + 2;
            int y = e.Location.Y + 2;
            Bitmap hiragana = HiraBitmap[y / 61, x / 49];
            Console.WriteLine(e.Location);
            if (hiragana == null) return;
            labelHiraChar.Image = hiragana;
            panelHiraAnime.BringToFront();
            buttonBackLearn.Focus();
        }

        private void LabelHiraBackground_MouseClick(object sender, MouseEventArgs e)
        {
            labelHiraChar.Image = null;
            panelHiraTable.BringToFront();
            buttonBackLearn.Focus();
        }

        private void labelKataTable_MouseClick(object sender, MouseEventArgs e)
        {
            int x = e.Location.X + 2;
            int y = e.Location.Y + 2;
            Bitmap katakana = KataBitmap[y / 61, x / 49];
            if (katakana == null) return;
            labelKataChar.Image = katakana;
            panelKataAnime.BringToFront();
            buttonBackLearn.Focus();

        }

        private void labelKataBackground_MouseClick(object sender, MouseEventArgs e)
        {
            labelKataChar.Image = null;
            panelKataTable.BringToFront();
            buttonBackLearn.Focus();
        }

        // Learn Lesson

        private void buttonLearnLesson_Click(object sender, EventArgs e)
        {
            listBoxLesson.DataSource = DataUsing.GetListLessonName(1);
            listBoxLesson.SelectedIndex = -1;

            stackPanelLearn.Push(panelLearnLessonChooser);
            stackPanelLearn.Peek().BringToFront();
            buttonBackLearn.Focus();

            stackLabelLearn.Push("Learning By Lesson");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        // Lesson Chooser

        private void listBoxLesson_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            int index = listBoxLesson.IndexFromPoint(e.Location);
            lesson = DataContext.GetListLessonByBookID(1)[index];
            listBoxLesson_Chosen();
        }

        private void listBoxLesson_KeyDown(object sender, KeyEventArgs e)
        {
            int index = listBoxLesson.SelectedIndex;
            Lesson lesson = DataContext.GetListLessonByBookID(1)[index];
            if (e.KeyCode == Keys.Enter) listBoxLesson_Chosen();
        }

        private void listBoxLesson_Chosen()
        {
            tabControlLearning.SelectedIndex = 3;
            tabControlLearning.SelectedIndex = 2;
            tabControlLearning.SelectedIndex = 1;
            tabControlLearning.SelectedIndex = 0;

            dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonID(lesson.ID);
            dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonID(lesson.ID);

            if (dataGridViewVocabulary.SelectedRows.Count > 0) dataGridViewVocabulary.SelectedRows[0].Selected = false;
            if (dataGridViewGrammar.SelectedRows.Count > 0) dataGridViewGrammar.SelectedRows[0].Selected = false;
            if (dataGridViewKanji.SelectedRows.Count > 0) dataGridViewKanji.SelectedRows[0].Selected = false;

            stackPanelLearn.Push(panelLearnLesson);
            stackPanelLearn.Peek().BringToFront();
            buttonBackLearn.Focus();

            stackLabelLearn.Push("- Lesson " + lesson.LessonNumber + " -");
            labelLearn.Text = stackLabelLearn.Peek();
        }

        // Tab Control Setting

        private void tabControlLearning_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabControlLearning.SelectedIndex == 0)
            {
                List<Vocabulary> listVocab = DataContext.GetListVocabularyByLessonID(lesson.ID);
                dataGridViewVocabulary.DataSource = listVocab;
                for (int i = 0; i < listVocab.Count; i++)
                    dataGridViewVocabulary.Rows[i].Cells[2].Value = DataContext.CheckFavourite(user.ID, listVocab[i].ID) ?
                        Properties.Resources.Empty : Properties.Resources.Like;

                panelVocabChooser.BringToFront();
            }
            if (tabControlLearning.SelectedIndex == 1) panelGrammarChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 2) panelKanjiChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 3) panelQuizChooser.BringToFront();
            if (tabControlLearning.SelectedIndex == 3) radioButtonQuick.Checked = true;

            if (tabControlLearning.SelectedIndex == 4)
            {
                List<Vocabulary> listFavor = DataContext.GetListFavoriteByLessonID(user.ID, lesson.ID);
                dataGridViewFavorite.DataSource = listFavor;
                for (int i = 0; i < listFavor.Count; i++)
                    dataGridViewFavorite.Rows[i].Cells[2].Value = DataContext.CheckFavourite(user.ID, listFavor[i].ID) ?
                        Properties.Resources.Empty : Properties.Resources.Like;

                panelFovuriteChooser.BringToFront();
            }
            buttonBackLearn.Focus();
        }

        private void dataGridViewGrammar_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int index = e.RowIndex;
            if (index == -1) return;

            Grammar grammar = ((List<Grammar>)dataGridViewGrammar.DataSource)[index];
            labelGrammarTerm.Text = grammar.Term;
            textBoxGrammarDef.Text = DataUsing.GetDefinitionText(grammar.Definition);

            panelGrammarDetail.BringToFront();
            buttonGrammarBack.Focus();
        }

        private void dataGridViewKanji_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int index = e.RowIndex;
            if (index == -1) return;

            Kanji kanji = ((List<Kanji>)dataGridViewKanji.DataSource)[index];
            labelKanjiTerm.Text = kanji.Term;
            textBoxKanjiDef.Text = DataUsing.GetDefinitionText(kanji.Definition);

            panelKanjiDetail.BringToFront();
            buttonKanjiBack.Focus();
        }

        // Get back while Learning

        private void buttonVocabBack_Click(object sender, EventArgs e)
        {
            panelVocabChooser.BringToFront();
            dataGridViewVocabulary.Focus();
        }

        private void buttonGrammarBack_Click(object sender, EventArgs e)
        {
            panelGrammarChooser.BringToFront();
            dataGridViewGrammar.Focus();
        }

        private void buttonKanjiBack_Click(object sender, EventArgs e)
        {
            panelKanjiChooser.BringToFront();
            dataGridViewKanji.Focus();
        }

        private void buttonQuizBack_Click(object sender, EventArgs e)
        {
            panelQuizChooser.BringToFront();
            buttonQuizStart.Focus();
        }

        private void buttonFavorBack_Click(object sender, EventArgs e)
        {
            panelFovuriteChooser.BringToFront();
            dataGridViewFavorite.Focus();
        }

        // Learn Favorite

        private void buttonFavorLearn_Click(object sender, EventArgs e)
        {
            if (DataContext.GetListFavoriteByLessonID(user.ID, lesson.ID).Count == 0) return;
            startLearnFavor();

            panelFovoriteDetail.BringToFront();
        }

        private void startLearnFavor()
        {
            buttonFavorNext.Enabled = true;
            listFavor = DataContext.GetListFavoriteRandomByLessonID(user.ID, lesson.ID);
            correct = 0;
            wrong = 0;

            remain = listFavor.Count;
            labelFavorRemainText.Text = "" + remain;
            labelFavorCorrectText.Text = "" + correct;
            labelFavorWrongText.Text = "" + wrong;

            nextQuizLearnFavor();
        }

        private void nextQuizLearnFavor()
        {
            favor = listFavor[new Random().Next(listFavor.Count)];
            listFavor.Remove(favor);

            remain = listFavor.Count;
            labelFavorRemainText.Text = "" + remain;

            labelFavorQuestion.Text = favor.Definition;
            textBoxFavorAnswer.Text = "";
            textBoxFavorAnswer.ReadOnly = false;
            labelFavorHint.Visible = false;

            textBoxFavorAnswer.Focus();
        }

        private void showAnswerLearnFavor()
        {
            textBoxFavorAnswer.ReadOnly = true;
            labelFavorHint.Text = favor.Term;
            labelFavorHint.Visible = true;
            if (textBoxFavorAnswer.Text == labelFavorHint.Text)
            {
                labelFavorHint.ForeColor = Color.Green;
                correct++;
            }
            else
            {
                labelFavorHint.ForeColor = Color.Red;
                wrong++;
            }
            labelFavorCorrectText.Text = "" + correct;
            labelFavorWrongText.Text = "" + wrong;

            buttonFavorNext.Focus();
            if (listFavor.Count == 0)
            {
                buttonFavorNext.Enabled = false;
                buttonFavorAgain.Focus();
            }
        }

        private void textBoxFavorAnswer_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                if (!textBoxFavorAnswer.ReadOnly)
                    showAnswerLearnFavor();
        }

        private void buttonFavorAgain_Click(object sender, EventArgs e)
        {
            startLearnFavor();
        }

        private void buttonFavorNext_Click(object sender, EventArgs e)
        {
            if (labelFavorHint.Visible)
                nextQuizLearnFavor();
            else showAnswerLearnFavor();
        }

        // Learn Vocabulary

        private int remain, correct, wrong;
        private List<Vocabulary> listVocab;
        private Vocabulary vocab;
        private List<Quiz> listQuiz;
        private Quiz quiz;
        private List<Vocabulary> listFavor;
        private Vocabulary favor;

        private void buttonVocabLearn_Click(object sender, EventArgs e)
        {
            startLearnVocab();

            panelVocabDetail.BringToFront();
        }

        private void startLearnVocab()
        {
            buttonVocabNext.Enabled = true;
            listVocab = DataContext.GetListVocabularyRandomByLessonID(lesson.ID);
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
            vocab = listVocab[new Random().Next(listVocab.Count)];
            listVocab.Remove(vocab);

            remain = listVocab.Count;
            labelVocabRemainText.Text = "" + remain;

            labelVocabQuestion.Text = vocab.Definition;
            textBoxVocabAnswer.Text = "";
            textBoxVocabAnswer.ReadOnly = false;
            labelVocabHint.Visible = false;

            textBoxVocabAnswer.Focus();
        }

        private void showAnswerLearnVocab()
        {
            textBoxVocabAnswer.ReadOnly = true;
            labelVocabHint.Text = vocab.Term;
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
            if (listVocab.Count == 0)
            {
                buttonVocabNext.Enabled = false;
                buttonVocabAgain.Focus();
            }
        }

        private void textBoxVocabAnswer_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                if (!textBoxVocabAnswer.ReadOnly)
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

        // Quiz Before

        private void numericUpDownSize_Enter(object sender, EventArgs e)
        {
            radioButtonCustom.Checked = true;
        }

        // Quiz

        private int quizSize;
        private List<Quiz> listAgain = new List<Quiz>();

        private void buttonQuizStart_Click(object sender, EventArgs e)
        {
            if (radioButtonQuick.Checked) quizSize = 10;
            if (radioButtonNormal.Checked) quizSize = 20;
            if (radioButtonFull.Checked) quizSize = 30;
            if (radioButtonCustom.Checked) quizSize = Convert.ToInt16(numericUpDownSize.Value);
            startDoQuiz();

            panelQuizDetail.BringToFront();
            buttonQuizBack.Focus();
        }

        private void startDoQuiz()
        {
            buttonQuizNext.Enabled = true;
            listQuiz = DataContext.GetListQuizRandomByLessonID(lesson.ID, quizSize);
            listAgain.Clear();
            listQuiz.ForEach(quiz => listAgain.Add(quiz));
            correct = 0;
            wrong = 0;

            remain = listQuiz.Count;
            labelQuizRemainText.Text = "" + remain;
            labelQuizCorrectText.Text = "" + correct;
            labelQuizWrongText.Text = "" + wrong;

            nextQuizDoQuiz();
        }

        private void restartDoQuiz()
        {
            buttonQuizNext.Enabled = true;
            listQuiz.Clear();
            listAgain.ForEach(quiz => listQuiz.Add(quiz));
            correct = 0;
            wrong = 0;

            remain = listQuiz.Count;
            labelQuizRemainText.Text = "" + remain;
            labelQuizCorrectText.Text = "" + correct;
            labelQuizWrongText.Text = "" + wrong;

            nextQuizDoQuiz();
        }

        List<RadioButton> radioChoices;
        List<Label> labelChoices;
        int[] arrayChoices;

        private void nextQuizDoQuiz()
        {
            quiz = listQuiz[new Random().Next(listQuiz.Count)];
            listQuiz.Remove(quiz);

            remain = listQuiz.Count;
            labelQuizRemainText.Text = "" + remain;

            labelQuizQuestion.Text = quiz.Question;

            arrayChoices = DataUsing.GetRandomArray();

            radioChoices[arrayChoices[0]].Text = quiz.Correct;
            radioChoices[arrayChoices[1]].Text = quiz.Answer1;
            radioChoices[arrayChoices[2]].Text = quiz.Answer3;
            radioChoices[arrayChoices[3]].Text = quiz.Answer2;

            radioButtonA.Checked = false;
            radioButtonB.Checked = false;
            radioButtonC.Checked = false;
            radioButtonD.Checked = false;

            radioButtonA.Enabled = true;
            radioButtonB.Enabled = true;
            radioButtonC.Enabled = true;
            radioButtonD.Enabled = true;

            labelChoiceA.Visible = false;
            labelChoiceB.Visible = false;
            labelChoiceC.Visible = false;
            labelChoiceD.Visible = false;
        }

        private void showAnswerDoQuiz()
        {
            radioButtonA.Enabled = false;
            radioButtonB.Enabled = false;
            radioButtonC.Enabled = false;
            radioButtonD.Enabled = false;

            if (radioButtonA.Checked)
            {
                labelChoiceA.Image = Properties.Resources.WrongSmaller;
                labelChoiceA.Visible = true;
            }
            if (radioButtonB.Checked)
            {
                labelChoiceB.Image = Properties.Resources.WrongSmaller;
                labelChoiceB.Visible = true;
            }
            if (radioButtonC.Checked)
            {
                labelChoiceC.Image = Properties.Resources.WrongSmaller;
                labelChoiceC.Visible = true;
            }
            if (radioButtonD.Checked)
            {
                labelChoiceD.Image = Properties.Resources.WrongSmaller;
                labelChoiceD.Visible = true;
            }
            labelChoices[arrayChoices[0]].Image = Properties.Resources.CorrectSmaller;
            labelChoices[arrayChoices[0]].Visible = true;

            if (radioChoices[arrayChoices[0]].Checked)
                correct++;
            else wrong++;

            labelQuizCorrectText.Text = "" + correct;
            labelQuizWrongText.Text = "" + wrong;

            if (listQuiz.Count == 0)
            {
                buttonQuizNext.Enabled = false;
                buttonQuizAgain.Focus();
            }
        }

        private void buttonQuizAgain_Click(object sender, EventArgs e)
        {
            restartDoQuiz();
        }

        private void buttonQuizNext_Click(object sender, EventArgs e)
        {
            if (!radioButtonA.Checked & !radioButtonB.Checked & !radioButtonC.Checked & !radioButtonD.Checked) return;
            if (labelChoiceA.Visible | labelChoiceB.Visible | labelChoiceC.Visible | labelChoiceD.Visible)
                nextQuizDoQuiz();
            else showAnswerDoQuiz();
        }

        // Other

        private void buttonAbout_Click(object sender, EventArgs e)
        {
            panelAbout.BringToFront();
            buttonBackAbout.Focus();
        }

        private void buttonAboutBack_Click(object sender, EventArgs e)
        {
            panelAbout.SendToBack();
            buttonAbout.Focus();
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
