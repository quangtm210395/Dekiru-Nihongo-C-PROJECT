﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Admin
{
    class Grammar
    {
        public int ID { get; set; }
        public int LessonID { get; set; }
        public string Term { get; set; }
        public string Term1 { get; set; }
        public string Definition { get; set; }

        public Grammar(int ID, int LessonID, string Term, string Definition)
        {
            this.ID = ID;
            this.LessonID = LessonID;
            this.Term = Term;
            this.Definition = Definition;

            Term1 = Term.Substring(5);
        }
    }
}
