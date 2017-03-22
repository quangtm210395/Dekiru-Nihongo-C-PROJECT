using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Main
{
    class DataUsing
    {

        public static Random random = new Random();

        public static List<String> GetListLessonName(int BookID)
        {
            List<String> listName = new List<String>();
            DataContext.GetListLessonByBookID(BookID)
                .ForEach(lesson => listName.Add("Lesson " + lesson.LessonNumber + ": " + lesson.Name));
            return listName;
        }

        public static String GetDefinitionText(String definition)
        {
            String ret = definition.Replace("\n", Environment.NewLine);
            ret = ret.Substring(0, ret.Length - 1);
            return ret;
        }

    }
}
