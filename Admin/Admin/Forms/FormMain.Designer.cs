namespace Admin
{
    partial class FormMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControlMain = new System.Windows.Forms.TabControl();
            this.tabPageVocabulary = new System.Windows.Forms.TabPage();
            this.buttonAddVocab = new System.Windows.Forms.Button();
            this.dataGridViewVocabulary = new System.Windows.Forms.DataGridView();
            this.tabPageGrammar = new System.Windows.Forms.TabPage();
            this.buttonAddGrammar = new System.Windows.Forms.Button();
            this.dataGridViewGrammar = new System.Windows.Forms.DataGridView();
            this.tabPageKanji = new System.Windows.Forms.TabPage();
            this.buttonAddKanji = new System.Windows.Forms.Button();
            this.dataGridViewKanji = new System.Windows.Forms.DataGridView();
            this.tabPageQuiz = new System.Windows.Forms.TabPage();
            this.buttonAddQuiz = new System.Windows.Forms.Button();
            this.dataGridViewQuiz = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cbbLesson = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxSearch = new System.Windows.Forms.TextBox();
            this.tabControlMain.SuspendLayout();
            this.tabPageVocabulary.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewVocabulary)).BeginInit();
            this.tabPageGrammar.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGrammar)).BeginInit();
            this.tabPageKanji.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKanji)).BeginInit();
            this.tabPageQuiz.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewQuiz)).BeginInit();
            this.SuspendLayout();
            // 
            // tabControlMain
            // 
            this.tabControlMain.Controls.Add(this.tabPageVocabulary);
            this.tabControlMain.Controls.Add(this.tabPageGrammar);
            this.tabControlMain.Controls.Add(this.tabPageKanji);
            this.tabControlMain.Controls.Add(this.tabPageQuiz);
            this.tabControlMain.Location = new System.Drawing.Point(3, 31);
            this.tabControlMain.Name = "tabControlMain";
            this.tabControlMain.SelectedIndex = 0;
            this.tabControlMain.Size = new System.Drawing.Size(677, 445);
            this.tabControlMain.TabIndex = 0;
            // 
            // tabPageVocabulary
            // 
            this.tabPageVocabulary.Controls.Add(this.buttonAddVocab);
            this.tabPageVocabulary.Controls.Add(this.dataGridViewVocabulary);
            this.tabPageVocabulary.Location = new System.Drawing.Point(4, 22);
            this.tabPageVocabulary.Name = "tabPageVocabulary";
            this.tabPageVocabulary.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageVocabulary.Size = new System.Drawing.Size(669, 419);
            this.tabPageVocabulary.TabIndex = 0;
            this.tabPageVocabulary.Text = "Vocabulary";
            this.tabPageVocabulary.UseVisualStyleBackColor = true;
            // 
            // buttonAddVocab
            // 
            this.buttonAddVocab.Location = new System.Drawing.Point(7, 392);
            this.buttonAddVocab.Name = "buttonAddVocab";
            this.buttonAddVocab.Size = new System.Drawing.Size(123, 23);
            this.buttonAddVocab.TabIndex = 3;
            this.buttonAddVocab.Text = "Add new Vocabulary";
            this.buttonAddVocab.UseVisualStyleBackColor = true;
            this.buttonAddVocab.Click += new System.EventHandler(this.buttonAdd_Click);
            // 
            // dataGridViewVocabulary
            // 
            this.dataGridViewVocabulary.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewVocabulary.Location = new System.Drawing.Point(7, 6);
            this.dataGridViewVocabulary.Name = "dataGridViewVocabulary";
            this.dataGridViewVocabulary.Size = new System.Drawing.Size(656, 380);
            this.dataGridViewVocabulary.TabIndex = 0;
            this.dataGridViewVocabulary.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewVocabulary_CellContentClick);
            // 
            // tabPageGrammar
            // 
            this.tabPageGrammar.Controls.Add(this.buttonAddGrammar);
            this.tabPageGrammar.Controls.Add(this.dataGridViewGrammar);
            this.tabPageGrammar.Location = new System.Drawing.Point(4, 22);
            this.tabPageGrammar.Name = "tabPageGrammar";
            this.tabPageGrammar.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageGrammar.Size = new System.Drawing.Size(669, 419);
            this.tabPageGrammar.TabIndex = 1;
            this.tabPageGrammar.Text = "Grammar";
            this.tabPageGrammar.UseVisualStyleBackColor = true;
            // 
            // buttonAddGrammar
            // 
            this.buttonAddGrammar.Location = new System.Drawing.Point(7, 390);
            this.buttonAddGrammar.Name = "buttonAddGrammar";
            this.buttonAddGrammar.Size = new System.Drawing.Size(123, 23);
            this.buttonAddGrammar.TabIndex = 4;
            this.buttonAddGrammar.Text = "Add new Grammar";
            this.buttonAddGrammar.UseVisualStyleBackColor = true;
            this.buttonAddGrammar.Click += new System.EventHandler(this.buttonAddGrammar_Click);
            // 
            // dataGridViewGrammar
            // 
            this.dataGridViewGrammar.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewGrammar.Location = new System.Drawing.Point(7, 6);
            this.dataGridViewGrammar.Name = "dataGridViewGrammar";
            this.dataGridViewGrammar.Size = new System.Drawing.Size(656, 379);
            this.dataGridViewGrammar.TabIndex = 0;
            this.dataGridViewGrammar.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewGrammar_CellContentClick);
            // 
            // tabPageKanji
            // 
            this.tabPageKanji.Controls.Add(this.buttonAddKanji);
            this.tabPageKanji.Controls.Add(this.dataGridViewKanji);
            this.tabPageKanji.Location = new System.Drawing.Point(4, 22);
            this.tabPageKanji.Name = "tabPageKanji";
            this.tabPageKanji.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageKanji.Size = new System.Drawing.Size(669, 419);
            this.tabPageKanji.TabIndex = 2;
            this.tabPageKanji.Text = "Kanji";
            this.tabPageKanji.UseVisualStyleBackColor = true;
            // 
            // buttonAddKanji
            // 
            this.buttonAddKanji.Location = new System.Drawing.Point(6, 390);
            this.buttonAddKanji.Name = "buttonAddKanji";
            this.buttonAddKanji.Size = new System.Drawing.Size(123, 23);
            this.buttonAddKanji.TabIndex = 4;
            this.buttonAddKanji.Text = "Add new Kanji";
            this.buttonAddKanji.UseVisualStyleBackColor = true;
            this.buttonAddKanji.Click += new System.EventHandler(this.buttonAddKanji_Click);
            // 
            // dataGridViewKanji
            // 
            this.dataGridViewKanji.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewKanji.Location = new System.Drawing.Point(6, 6);
            this.dataGridViewKanji.Name = "dataGridViewKanji";
            this.dataGridViewKanji.Size = new System.Drawing.Size(657, 378);
            this.dataGridViewKanji.TabIndex = 0;
            this.dataGridViewKanji.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewKanji_CellContentClick);
            // 
            // tabPageQuiz
            // 
            this.tabPageQuiz.Controls.Add(this.buttonAddQuiz);
            this.tabPageQuiz.Controls.Add(this.dataGridViewQuiz);
            this.tabPageQuiz.Location = new System.Drawing.Point(4, 22);
            this.tabPageQuiz.Name = "tabPageQuiz";
            this.tabPageQuiz.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageQuiz.Size = new System.Drawing.Size(669, 419);
            this.tabPageQuiz.TabIndex = 3;
            this.tabPageQuiz.Text = "Quiz";
            this.tabPageQuiz.UseVisualStyleBackColor = true;
            // 
            // buttonAddQuiz
            // 
            this.buttonAddQuiz.Location = new System.Drawing.Point(7, 389);
            this.buttonAddQuiz.Name = "buttonAddQuiz";
            this.buttonAddQuiz.Size = new System.Drawing.Size(123, 23);
            this.buttonAddQuiz.TabIndex = 4;
            this.buttonAddQuiz.Text = "Add new Quiz";
            this.buttonAddQuiz.UseVisualStyleBackColor = true;
            this.buttonAddQuiz.Click += new System.EventHandler(this.buttonAddQuiz_Click);
            // 
            // dataGridViewQuiz
            // 
            this.dataGridViewQuiz.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewQuiz.Location = new System.Drawing.Point(7, 7);
            this.dataGridViewQuiz.Name = "dataGridViewQuiz";
            this.dataGridViewQuiz.Size = new System.Drawing.Size(656, 376);
            this.dataGridViewQuiz.TabIndex = 0;
            this.dataGridViewQuiz.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridViewQuiz_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Lessons";
            // 
            // cbbLesson
            // 
            this.cbbLesson.FormattingEnabled = true;
            this.cbbLesson.Location = new System.Drawing.Point(61, 4);
            this.cbbLesson.Name = "cbbLesson";
            this.cbbLesson.Size = new System.Drawing.Size(135, 21);
            this.cbbLesson.TabIndex = 2;
            this.cbbLesson.SelectedIndexChanged += new System.EventHandler(this.cbbLesson_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(321, 8);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Search";
            // 
            // textBoxSearch
            // 
            this.textBoxSearch.Location = new System.Drawing.Point(398, 5);
            this.textBoxSearch.Name = "textBoxSearch";
            this.textBoxSearch.Size = new System.Drawing.Size(153, 20);
            this.textBoxSearch.TabIndex = 4;
            this.textBoxSearch.TextChanged += new System.EventHandler(this.textBoxSearch_TextChanged);
            this.textBoxSearch.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxSearch_KeyDown);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(692, 479);
            this.Controls.Add(this.textBoxSearch);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tabControlMain);
            this.Controls.Add(this.cbbLesson);
            this.Controls.Add(this.label1);
            this.Name = "FormMain";
            this.Text = "Dekiru Nihongo Management Tool";
            this.tabControlMain.ResumeLayout(false);
            this.tabPageVocabulary.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewVocabulary)).EndInit();
            this.tabPageGrammar.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGrammar)).EndInit();
            this.tabPageKanji.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKanji)).EndInit();
            this.tabPageQuiz.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewQuiz)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TabControl tabControlMain;
        private System.Windows.Forms.TabPage tabPageVocabulary;
        private System.Windows.Forms.TabPage tabPageGrammar;
        private System.Windows.Forms.TabPage tabPageKanji;
        private System.Windows.Forms.TabPage tabPageQuiz;
        private System.Windows.Forms.DataGridView dataGridViewVocabulary;
        private System.Windows.Forms.DataGridView dataGridViewGrammar;
        private System.Windows.Forms.DataGridView dataGridViewKanji;
        private System.Windows.Forms.DataGridView dataGridViewQuiz;
        private System.Windows.Forms.Button buttonAddVocab;
        private System.Windows.Forms.ComboBox cbbLesson;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button buttonAddGrammar;
        private System.Windows.Forms.Button buttonAddKanji;
        private System.Windows.Forms.Button buttonAddQuiz;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxSearch;
    }
}

