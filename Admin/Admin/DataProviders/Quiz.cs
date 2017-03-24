using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Admin

{
    class Quiz
    {
        public int ID { get; set; }
        public int LessonID { get; set; }
        public string Question { get; set; }
        public string Correct { get; set; }
        public string Answer1 { get; set; }
        public string Answer2 { get; set; }
        public string Answer3 { get; set; }

        public Quiz(int ID, int LessonID, string Question, string Correct, string Answer1, string Answer2, string Answer3)
        {
            this.ID = ID;
            this.LessonID = LessonID;
            this.Question = Question;
            this.Correct = Correct;
            this.Answer1 = Answer1;
            this.Answer2 = Answer2;
            this.Answer3 = Answer3;
        }

        public Quiz(int LessonID, string Question, string Correct, string Answer1, string Answer2, string Answer3)
        {
            this.LessonID = LessonID;
            this.Question = Question;
            this.Correct = Correct;
            this.Answer1 = Answer1;
            this.Answer2 = Answer2;
            this.Answer3 = Answer3;
        }
    }
}
