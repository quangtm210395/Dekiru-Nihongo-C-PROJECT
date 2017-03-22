using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Main
{
    class Lesson
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int BookID { get; set; }
        public int LessonNumber { get; set; }

        public Lesson(int ID, string Name, int BookID, int LessonNumber)
        {
            this.ID = ID;
            this.Name = Name;
            this.BookID = BookID;
            this.LessonNumber = LessonNumber;
        }

    }
}
