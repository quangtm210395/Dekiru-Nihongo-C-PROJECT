using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Admin.Forms;

namespace Admin
{
    public partial class FormMain : Form
    {
        public string SearchText { get; set; }
        public FormMain()
        {
            InitializeComponent();
            SearchText = "";

            dataGridViewVocabulary.AutoGenerateColumns = false;
            dataGridViewGrammar.AutoGenerateColumns = false;
            dataGridViewKanji.AutoGenerateColumns = false;
            dataGridViewQuiz.AutoGenerateColumns = false;
            InitializeComboboxes();
            InitializeDataGridViews();

        }

        private void InitializeComboboxes()
        {
            cbbLesson.DataSource = DataContext.GetListLessonByBookID(1);
            cbbLesson.DisplayMember = "Name";
            cbbLesson.ValueMember = "ID";
            cbbLesson.SelectedIndex = 0;
        }

        private void InitializeDataGridViews()
        {

            DataGridViewButtonColumn btEditVocabulary = new DataGridViewButtonColumn();
            btEditVocabulary.HeaderText = "Edit";
            btEditVocabulary.Text = "Edit";
            btEditVocabulary.Name = "btn";
            btEditVocabulary.Width = 50;
            btEditVocabulary.UseColumnTextForButtonValue = true;

            DataGridViewLinkColumn lkDeleteVocabulary = new DataGridViewLinkColumn();
            lkDeleteVocabulary.HeaderText = "Delete";
            lkDeleteVocabulary.Text = "Delete";
            lkDeleteVocabulary.Name = "link";
            lkDeleteVocabulary.Width = 50;
            lkDeleteVocabulary.UseColumnTextForLinkValue = true;

            DataGridViewButtonColumn btEditGrammar = new DataGridViewButtonColumn();
            btEditGrammar.HeaderText = "Edit";
            btEditGrammar.Text = "Edit";
            btEditGrammar.Name = "btn";
            btEditGrammar.Width = 50;
            btEditGrammar.UseColumnTextForButtonValue = true;

            DataGridViewLinkColumn lkDeleteGrammar = new DataGridViewLinkColumn();
            lkDeleteGrammar.HeaderText = "Delete";
            lkDeleteGrammar.Text = "Delete";
            lkDeleteGrammar.Name = "link";
            lkDeleteGrammar.Width = 50;
            lkDeleteGrammar.UseColumnTextForLinkValue = true;

            DataGridViewButtonColumn btEditKanji = new DataGridViewButtonColumn();
            btEditKanji.HeaderText = "Edit";
            btEditKanji.Text = "Edit";
            btEditKanji.Name = "btn";
            btEditKanji.Width = 50;
            btEditKanji.UseColumnTextForButtonValue = true;

            DataGridViewLinkColumn lkDeleteKanji = new DataGridViewLinkColumn();
            lkDeleteKanji.HeaderText = "Delete";
            lkDeleteKanji.Text = "Delete";
            lkDeleteKanji.Name = "link";
            lkDeleteKanji.Width = 50;
            lkDeleteKanji.UseColumnTextForLinkValue = true;

            DataGridViewButtonColumn btEditQuiz = new DataGridViewButtonColumn();
            btEditQuiz.HeaderText = "Edit";
            btEditQuiz.Text = "Edit";
            btEditQuiz.Name = "btn";
            btEditQuiz.Width = 50;
            btEditQuiz.UseColumnTextForButtonValue = true;

            DataGridViewLinkColumn lkDeleteQuiz = new DataGridViewLinkColumn();
            lkDeleteQuiz.HeaderText = "Delete";
            lkDeleteQuiz.Text = "Delete";
            lkDeleteQuiz.Name = "link";
            lkDeleteQuiz.Width = 50;
            lkDeleteQuiz.UseColumnTextForLinkValue = true;

            // Vocabulary
            dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyByLessonIDAndSearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewVocabulary.Columns.Add("col_ID", "ID");
            dataGridViewVocabulary.Columns["col_ID"].DataPropertyName = "ID";
            dataGridViewVocabulary.Columns["col_ID"].Width = 25;
            dataGridViewVocabulary.Columns["col_ID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewVocabulary.Columns.Add("col_LessonID", "LessonID");
            dataGridViewVocabulary.Columns["col_LessonID"].DataPropertyName = "LessonID";
            dataGridViewVocabulary.Columns["col_LessonID"].Width = 50;
            dataGridViewVocabulary.Columns["col_LessonID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewVocabulary.Columns.Add("col_Term", "Term");
            dataGridViewVocabulary.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewVocabulary.Columns["col_Term"].Width = 120;
            dataGridViewVocabulary.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewVocabulary.Columns.Add("col_Def", "Definition");
            dataGridViewVocabulary.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewVocabulary.Columns["col_Def"].Width = 300;
            dataGridViewVocabulary.Columns["col_Def"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

            dataGridViewVocabulary.Columns.Insert(4, btEditVocabulary);
            dataGridViewVocabulary.Columns.Insert(5, lkDeleteVocabulary);

            // Grammar
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonIDAndSearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewGrammar.Columns.Add("col_ID", "ID");
            dataGridViewGrammar.Columns["col_ID"].DataPropertyName = "ID";
            dataGridViewGrammar.Columns["col_ID"].Width = 25;
            dataGridViewGrammar.Columns["col_ID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewGrammar.Columns.Add("col_LessonID", "LessonID");
            dataGridViewGrammar.Columns["col_LessonID"].DataPropertyName = "LessonID";
            dataGridViewGrammar.Columns["col_LessonID"].Width = 50;
            dataGridViewGrammar.Columns["col_LessonID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewGrammar.Columns.Add("col_Term", "Term");
            dataGridViewGrammar.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewGrammar.Columns["col_Term"].Width = 120;
            dataGridViewGrammar.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewGrammar.Columns.Add("col_Def", "Definition");
            dataGridViewGrammar.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewGrammar.Columns["col_Def"].Width = 300;
            dataGridViewGrammar.Columns["col_Def"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

            dataGridViewGrammar.Columns.Insert(4, btEditGrammar);
            dataGridViewGrammar.Columns.Insert(5, lkDeleteGrammar);

            // Kanji, 
            dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonIDAndSearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewKanji.Columns.Add("col_ID", "ID");
            dataGridViewKanji.Columns["col_ID"].DataPropertyName = "ID";
            dataGridViewKanji.Columns["col_ID"].Width = 25;
            dataGridViewKanji.Columns["col_ID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewKanji.Columns.Add("col_LessonID", "LessonID");
            dataGridViewKanji.Columns["col_LessonID"].DataPropertyName = "LessonID";
            dataGridViewKanji.Columns["col_LessonID"].Width = 50;
            dataGridViewKanji.Columns["col_LessonID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewKanji.Columns.Add("col_Term", "Term");
            dataGridViewKanji.Columns["col_Term"].DataPropertyName = "Term";
            dataGridViewKanji.Columns["col_Term"].Width = 120;
            dataGridViewKanji.Columns["col_Term"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewKanji.Columns.Add("col_Def", "Definition");
            dataGridViewKanji.Columns["col_Def"].DataPropertyName = "Definition";
            dataGridViewKanji.Columns["col_Def"].Width = 300;
            dataGridViewKanji.Columns["col_Def"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

            dataGridViewKanji.Columns.Insert(4, btEditKanji);
            dataGridViewKanji.Columns.Insert(5, lkDeleteKanji);

            //Quiz
            dataGridViewQuiz.DataSource = DataContext.GetListQuizByLessonIDAndSearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewQuiz.Columns.Add("col_ID", "ID");
            dataGridViewQuiz.Columns["col_ID"].DataPropertyName = "ID";
            dataGridViewQuiz.Columns["col_ID"].Width = 25;
            dataGridViewQuiz.Columns["col_ID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_LessonID", "LessonID");
            dataGridViewQuiz.Columns["col_LessonID"].DataPropertyName = "LessonID";
            dataGridViewQuiz.Columns["col_LessonID"].Width = 50;
            dataGridViewQuiz.Columns["col_LessonID"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_Question", "Question");
            dataGridViewQuiz.Columns["col_Question"].DataPropertyName = "Question";
            dataGridViewQuiz.Columns["col_Question"].Width = 120;
            dataGridViewQuiz.Columns["col_Question"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_Correct", "Correct");
            dataGridViewQuiz.Columns["col_Correct"].DataPropertyName = "Correct";
            dataGridViewQuiz.Columns["col_Correct"].Width = 75;
            dataGridViewQuiz.Columns["col_Correct"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_Answer1", "Answer1");
            dataGridViewQuiz.Columns["col_Answer1"].DataPropertyName = "Answer1";
            dataGridViewQuiz.Columns["col_Answer1"].Width = 75;
            dataGridViewQuiz.Columns["col_Answer1"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_Answer2", "Answer2");
            dataGridViewQuiz.Columns["col_Answer2"].DataPropertyName = "Answer2";
            dataGridViewQuiz.Columns["col_Answer2"].Width = 75;
            dataGridViewQuiz.Columns["col_Answer2"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewQuiz.Columns.Add("col_Answer3", "Answer3");
            dataGridViewQuiz.Columns["col_Answer3"].DataPropertyName = "Answer3";
            dataGridViewQuiz.Columns["col_Answer3"].Width = 75;
            dataGridViewQuiz.Columns["col_Answer3"].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

            dataGridViewQuiz.Columns.Insert(7, btEditQuiz);
            dataGridViewQuiz.Columns.Insert(8, lkDeleteQuiz);
        }

        private void cbbLesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
            dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyByLessonIDAndSearchText(lessonID, SearchText);
            dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonIDAndSearchText(lessonID, SearchText);
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonIDAndSearchText(lessonID, SearchText);
            dataGridViewQuiz.DataSource = DataContext.GetListQuizByLessonIDAndSearchText(lessonID, SearchText);
        }

        private void dataGridViewVocabulary_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                FormEditVocabulary formEditVocab = new FormEditVocabulary();
                List<Vocabulary> lessons = (List<Vocabulary>)this.dataGridViewVocabulary.DataSource;
                formEditVocab.LessonID = lessons[e.RowIndex].LessonID;
                formEditVocab.ID = lessons[e.RowIndex].ID;
                formEditVocab.Init();
                formEditVocab.FormClosed += FormVocab_Closed;
                formEditVocab.Show();
            }
            if (e.ColumnIndex == 5)
            {
                List<Vocabulary> vocabs = (List<Vocabulary>)this.dataGridViewVocabulary.DataSource;
                DialogResult result = MessageBox.Show("Are you sure you want to delete Vocabulary's ID: " + vocabs[e.RowIndex].ID, "Confirm Delete", MessageBoxButtons.OKCancel);
                if (result == DialogResult.OK)
                {
                    DataContext.DeleteVocabulary(vocabs[e.RowIndex].ID);
                    int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
                    dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyByLessonIDAndSearchText(lessonID, SearchText);
                    MessageBox.Show("Delete Successful!");
                }
            }
        }

        private void FormVocab_Closed(object sender, FormClosedEventArgs e)
        {
            int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
            dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyByLessonIDAndSearchText(lessonID, SearchText);
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            FormAddVocabulary formAddVocab = new FormAddVocabulary();
            formAddVocab.LessonIndex = cbbLesson.SelectedIndex;
            formAddVocab.Init();
            formAddVocab.FormClosed += FormVocab_Closed;
            formAddVocab.Show();
        }

        private void dataGridViewGrammar_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                FormEditGrammar formEditGrammar = new FormEditGrammar();
                List<Grammar> grammars = (List<Grammar>)this.dataGridViewGrammar.DataSource;
                formEditGrammar.LessonID = grammars[e.RowIndex].LessonID;
                formEditGrammar.ID = grammars[e.RowIndex].ID;
                formEditGrammar.Init();
                formEditGrammar.FormClosed += FormGrammar_Closed;
                formEditGrammar.Show();
            }
            if (e.ColumnIndex == 5)
            {
                List<Grammar> grammars = (List<Grammar>)this.dataGridViewGrammar.DataSource;
                DialogResult result = MessageBox.Show("Are you sure you want to delete Grammar's ID: " + grammars[e.RowIndex].ID, "Confirm Delete", MessageBoxButtons.OKCancel);
                if (result == DialogResult.OK)
                {
                    DataContext.DeleteGrammar(grammars[e.RowIndex].ID);
                    int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
                    dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonIDAndSearchText(lessonID, SearchText);
                    MessageBox.Show("Delete Successful!");
                }
            }
        }

        private void buttonAddGrammar_Click(object sender, EventArgs e)
        {
            FormAddGrammar formAddGrammar = new FormAddGrammar();
            formAddGrammar.LessonIndex = cbbLesson.SelectedIndex;
            formAddGrammar.Init();
            formAddGrammar.FormClosed += FormGrammar_Closed;
            formAddGrammar.Show();
        }

        private void FormGrammar_Closed(object sender, FormClosedEventArgs e)
        {
            int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarByLessonIDAndSearchText(lessonID, SearchText);
        }

        private void dataGridViewKanji_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                FormEditKanji formEditKanji = new FormEditKanji();
                List<Kanji> kanjis = (List<Kanji>)this.dataGridViewKanji.DataSource;
                formEditKanji.LessonID = kanjis[e.RowIndex].LessonID;
                formEditKanji.ID = kanjis[e.RowIndex].ID;
                formEditKanji.Init();
                formEditKanji.FormClosed += FormKanji_Closed;
                formEditKanji.Show();
            }
            if (e.ColumnIndex == 5)
            {
                List<Kanji> kanjis = (List<Kanji>)this.dataGridViewKanji.DataSource;
                DialogResult result = MessageBox.Show("Are you sure you want to delete Kanji's ID: " + kanjis[e.RowIndex].ID, "Confirm Delete", MessageBoxButtons.OKCancel);
                if (result == DialogResult.OK)
                {
                    DataContext.DeleteKanji(kanjis[e.RowIndex].ID);
                    int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
                    dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonIDAndSearchText(lessonID, SearchText);
                    MessageBox.Show("Delete Successful!");
                }
            }
        }

        private void buttonAddKanji_Click(object sender, EventArgs e)
        {
            FormAddKanji formAddKanji = new FormAddKanji();
            formAddKanji.LessonIndex = cbbLesson.SelectedIndex;
            formAddKanji.Init();
            formAddKanji.FormClosed += FormKanji_Closed;
            formAddKanji.Show();
        }

        private void FormKanji_Closed(object sender, FormClosedEventArgs e)
        {
            int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
            dataGridViewKanji.DataSource = DataContext.GetListKanjiByLessonIDAndSearchText(lessonID, SearchText);
        }

        private void dataGridViewQuiz_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 7)
            {
                FormEditQuiz formEditQuiz = new FormEditQuiz();
                List<Quiz> quizes = (List<Quiz>)this.dataGridViewQuiz.DataSource;
                formEditQuiz.LessonID = quizes[e.RowIndex].LessonID;
                formEditQuiz.ID = quizes[e.RowIndex].ID;
                formEditQuiz.Init();
                formEditQuiz.FormClosed += FormQuiz_Closed;
                formEditQuiz.Show();
            }
            if (e.ColumnIndex == 8)
            {
                List<Quiz> quizes = (List<Quiz>)this.dataGridViewQuiz.DataSource;
                DialogResult result = MessageBox.Show("Are you sure you want to delete Quiz's ID: " + quizes[e.RowIndex].ID, "Confirm Delete", MessageBoxButtons.OKCancel);
                if (result == DialogResult.OK)
                {
                    DataContext.DeleteQuiz(quizes[e.RowIndex].ID);
                    int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
                    dataGridViewQuiz.DataSource = DataContext.GetListQuizByLessonIDAndSearchText(lessonID, SearchText);
                    MessageBox.Show("Delete Successful!");
                }
            }
        }

        private void FormQuiz_Closed(object sender, FormClosedEventArgs e)
        {
            int lessonID = ((Lesson)cbbLesson.SelectedItem).ID;
            dataGridViewQuiz.DataSource = DataContext.GetListQuizByLessonIDAndSearchText(lessonID, SearchText);
        }

        private void buttonAddQuiz_Click(object sender, EventArgs e)
        {
            FormAddQuiz formAddQuiz = new FormAddQuiz();
            formAddQuiz.LessonIndex = cbbLesson.SelectedIndex;
            formAddQuiz.Init();
            formAddQuiz.FormClosed += FormQuiz_Closed;
            formAddQuiz.Show();
        }

        private void textBoxSearch_TextChanged(object sender, EventArgs e)
        {
            SearchText = textBoxSearch.Text;
            dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewGrammar.DataSource = DataContext.GetListGrammarBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            dataGridViewQuiz.DataSource = DataContext.GetListQuizBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);

        }

        private void textBoxSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                SearchText = textBoxSearch.Text;
                dataGridViewVocabulary.DataSource = DataContext.GetListVocabularyBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
                dataGridViewGrammar.DataSource = DataContext.GetListGrammarBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
                dataGridViewGrammar.DataSource = DataContext.GetListGrammarBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
                dataGridViewQuiz.DataSource = DataContext.GetListQuizBySearchText(Convert.ToInt32(cbbLesson.SelectedValue), SearchText);
            }
        }
    }
}
