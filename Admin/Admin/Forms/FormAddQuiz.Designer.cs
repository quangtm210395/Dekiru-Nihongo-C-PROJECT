namespace Admin.Forms
{
    partial class FormAddQuiz
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
            this.label1 = new System.Windows.Forms.Label();
            this.cbbLesson = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.richTextBoxQuestion = new System.Windows.Forms.RichTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxAnswer1 = new System.Windows.Forms.TextBox();
            this.textBoxAnswer2 = new System.Windows.Forms.TextBox();
            this.textBoxAnswer3 = new System.Windows.Forms.TextBox();
            this.textBoxCorrectAnswer = new System.Windows.Forms.TextBox();
            this.buttonSave = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "LessonID";
            // 
            // cbbLesson
            // 
            this.cbbLesson.FormattingEnabled = true;
            this.cbbLesson.Location = new System.Drawing.Point(120, 10);
            this.cbbLesson.Name = "cbbLesson";
            this.cbbLesson.Size = new System.Drawing.Size(140, 21);
            this.cbbLesson.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Question";
            // 
            // richTextBoxQuestion
            // 
            this.richTextBoxQuestion.Location = new System.Drawing.Point(120, 47);
            this.richTextBoxQuestion.Name = "richTextBoxQuestion";
            this.richTextBoxQuestion.Size = new System.Drawing.Size(378, 103);
            this.richTextBoxQuestion.TabIndex = 3;
            this.richTextBoxQuestion.Text = "";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 165);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Answer 1";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 237);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(51, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "Answer 3";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(16, 200);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(51, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "Answer 2";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(16, 272);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(79, 13);
            this.label6.TabIndex = 7;
            this.label6.Text = "Correct Answer";
            // 
            // textBoxAnswer1
            // 
            this.textBoxAnswer1.Location = new System.Drawing.Point(120, 162);
            this.textBoxAnswer1.Name = "textBoxAnswer1";
            this.textBoxAnswer1.Size = new System.Drawing.Size(265, 20);
            this.textBoxAnswer1.TabIndex = 8;
            // 
            // textBoxAnswer2
            // 
            this.textBoxAnswer2.Location = new System.Drawing.Point(120, 197);
            this.textBoxAnswer2.Name = "textBoxAnswer2";
            this.textBoxAnswer2.Size = new System.Drawing.Size(265, 20);
            this.textBoxAnswer2.TabIndex = 9;
            // 
            // textBoxAnswer3
            // 
            this.textBoxAnswer3.Location = new System.Drawing.Point(120, 234);
            this.textBoxAnswer3.Name = "textBoxAnswer3";
            this.textBoxAnswer3.Size = new System.Drawing.Size(265, 20);
            this.textBoxAnswer3.TabIndex = 10;
            // 
            // textBoxCorrectAnswer
            // 
            this.textBoxCorrectAnswer.Location = new System.Drawing.Point(120, 269);
            this.textBoxCorrectAnswer.Name = "textBoxCorrectAnswer";
            this.textBoxCorrectAnswer.Size = new System.Drawing.Size(265, 20);
            this.textBoxCorrectAnswer.TabIndex = 11;
            // 
            // buttonSave
            // 
            this.buttonSave.Location = new System.Drawing.Point(120, 300);
            this.buttonSave.Name = "buttonSave";
            this.buttonSave.Size = new System.Drawing.Size(75, 23);
            this.buttonSave.TabIndex = 12;
            this.buttonSave.Text = "Save";
            this.buttonSave.UseVisualStyleBackColor = true;
            this.buttonSave.Click += new System.EventHandler(this.buttonSave_Click);
            // 
            // FormAddQuiz
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(514, 335);
            this.Controls.Add(this.buttonSave);
            this.Controls.Add(this.textBoxCorrectAnswer);
            this.Controls.Add(this.textBoxAnswer3);
            this.Controls.Add(this.textBoxAnswer2);
            this.Controls.Add(this.textBoxAnswer1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.richTextBoxQuestion);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cbbLesson);
            this.Controls.Add(this.label1);
            this.Name = "FormAddQuiz";
            this.Text = "Add Quiz";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbbLesson;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RichTextBox richTextBoxQuestion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBoxAnswer1;
        private System.Windows.Forms.TextBox textBoxAnswer2;
        private System.Windows.Forms.TextBox textBoxAnswer3;
        private System.Windows.Forms.TextBox textBoxCorrectAnswer;
        private System.Windows.Forms.Button buttonSave;
    }
}