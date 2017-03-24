namespace Admin.Forms
{
    partial class FormAddVocabulary
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
            this.buttonSave = new System.Windows.Forms.Button();
            this.richTextBoxDef = new System.Windows.Forms.RichTextBox();
            this.textBoxTerm = new System.Windows.Forms.TextBox();
            this.cbbLesson = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // buttonSave
            // 
            this.buttonSave.Location = new System.Drawing.Point(111, 210);
            this.buttonSave.Name = "buttonSave";
            this.buttonSave.Size = new System.Drawing.Size(87, 23);
            this.buttonSave.TabIndex = 13;
            this.buttonSave.Text = "Save";
            this.buttonSave.UseVisualStyleBackColor = true;
            this.buttonSave.Click += new System.EventHandler(this.buttonSave_Click);
            // 
            // richTextBoxDef
            // 
            this.richTextBoxDef.Location = new System.Drawing.Point(111, 79);
            this.richTextBoxDef.Name = "richTextBoxDef";
            this.richTextBoxDef.Size = new System.Drawing.Size(333, 127);
            this.richTextBoxDef.TabIndex = 12;
            this.richTextBoxDef.Text = "";
            // 
            // textBoxTerm
            // 
            this.textBoxTerm.Location = new System.Drawing.Point(111, 42);
            this.textBoxTerm.Name = "textBoxTerm";
            this.textBoxTerm.Size = new System.Drawing.Size(333, 20);
            this.textBoxTerm.TabIndex = 11;
            // 
            // cbbLesson
            // 
            this.cbbLesson.FormattingEnabled = true;
            this.cbbLesson.Location = new System.Drawing.Point(111, 8);
            this.cbbLesson.Name = "cbbLesson";
            this.cbbLesson.Size = new System.Drawing.Size(129, 21);
            this.cbbLesson.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 82);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Definition";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Term";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "LessonID";
            // 
            // FormAddVocabulary
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(484, 244);
            this.Controls.Add(this.buttonSave);
            this.Controls.Add(this.richTextBoxDef);
            this.Controls.Add(this.textBoxTerm);
            this.Controls.Add(this.cbbLesson);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FormAddVocabulary";
            this.Text = "Add Vocabulary";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonSave;
        private System.Windows.Forms.RichTextBox richTextBoxDef;
        private System.Windows.Forms.TextBox textBoxTerm;
        private System.Windows.Forms.ComboBox cbbLesson;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}