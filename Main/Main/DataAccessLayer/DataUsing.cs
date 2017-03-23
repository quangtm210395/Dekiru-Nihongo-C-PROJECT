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

        public static int[] GetRandomArray()
        {
            int[] ret = new int[4];
            ret[0] = random.Next(4);
            for (ret[1] = ret[0]; ret[1] == ret[0]; ret[1] = random.Next(4)) ;
            for (ret[2] = ret[0]; ret[2] == ret[0] | ret[2] == ret[1]; ret[2] = random.Next(4)) ;
            ret[3] = 6 - ret[0] - ret[1] - ret[2];
            return ret;
        }

    }
}
