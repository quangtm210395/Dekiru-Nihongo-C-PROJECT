﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Admin
{
    class Kanji
    {
        public int ID { get; set; }
        public int LessonID { get; set; }
        public string Term { get; set; }
        public string Term1 { get; set; }
        public string Term2 { get; set; }
        public string Definition { get; set; }

        public Kanji(int ID, int LessonID, string Term, string Definition)
        {
            this.ID = ID;
            this.LessonID = LessonID;
            this.Term = Term;
            this.Definition = Definition;

            Term1 = Term.Substring(0, 1);
            Term2 = Term.Substring(4);
        }

        public Kanji( int LessonID, string Term, string Definition)
        {
            this.LessonID = LessonID;
            this.Term = Term;
            this.Definition = Definition;
            
        }
    }
}
