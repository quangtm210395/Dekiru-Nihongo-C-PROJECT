using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Main
{
    class DataContext
    {
        public static string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DekiruNihongoConnectionString"].ToString();
        }

        public static SqlConnection getSqlConnection()
        {
            return new SqlConnection(getConnectionString());
        }

        public static SqlCommand getSqlCommand(string sql)
        {
            return new SqlCommand(sql, getSqlConnection());
        }

        public static List<DataRow> ListDataRow(string sql)
        {
            DataSet dataSet = new DataSet();
            new SqlDataAdapter(new SqlCommand(sql, getSqlConnection())).Fill(dataSet);
            return dataSet.Tables[0].Rows.Cast<DataRow>().AsEnumerable().ToList();
        }

        public static List<Book> GetListBook()
        {
            List<Book> listBook = new List<Book>();

            string sql = "SELECT * FROM Book";
            ListDataRow(sql).ForEach((data) =>
            {
                Book book = new Book(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToString(data["Name"]),
                    Convert.ToString(data["Description"]));
                listBook.Add(book);
            });
            return listBook;
        }

        public static List<Lesson> GetListLessonByBookID(int BookID)
        {
            List<Lesson> listLesson = new List<Lesson>();

            string sql = "SELECT * FROM Lesson WHERE BookID = " + BookID;
            ListDataRow(sql).ForEach((data) =>
            {
                Lesson lesson = new Lesson(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToString(data["Name"]),
                    Convert.ToInt16(data["BookID"]),
                    Convert.ToInt16(data["LessonNumber"]));
                listLesson.Add(lesson);
            });
            return listLesson;
        }

        public static List<Vocabulary> GetListVocabularyByLessonID(int LessonID)
        {
            List<Vocabulary> listVocabulary = new List<Vocabulary>();

            string sql = "SELECT * FROM Vocabulary WHERE LessonID = " + LessonID;
            ListDataRow(sql).ForEach((data) =>
            {
                Vocabulary vocabulary = new Vocabulary(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
                listVocabulary.Add(vocabulary);
            });
            return listVocabulary;
        }

        public static List<Vocabulary> GetListVocabularyRandomByLessonID(int LessonID)
        {
            List<Vocabulary> listVocabulary = new List<Vocabulary>();

            string sql = "SELECT * FROM Vocabulary WHERE LessonID = " + LessonID + " ORDER BY NEWID()";
            ListDataRow(sql).ForEach((data) =>
            {
                Vocabulary vocabulary = new Vocabulary(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
                listVocabulary.Add(vocabulary);
            });
            return listVocabulary;
        }

        public static List<Grammar> GetListGrammarByLessonID(int LessonID)
        {
            List<Grammar> listGrammar = new List<Grammar>();

            string sql = "SELECT * FROM Grammar WHERE LessonID = " + LessonID;
            ListDataRow(sql).ForEach((data) =>
            {
                Grammar grammar = new Grammar(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
                listGrammar.Add(grammar);
            });
            return listGrammar;
        }

        public static List<Kanji> GetListKanjiByLessonID(int LessonID)
        {
            List<Kanji> listKanji = new List<Kanji>();

            string sql = "SELECT * FROM Kanji WHERE LessonID = " + LessonID;
            ListDataRow(sql).ForEach((data) =>
            {
                Kanji kanji = new Kanji(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
                listKanji.Add(kanji);
            });
            return listKanji;
        }



        public static int ExecuteNonQuery(SqlConnection connection, SqlCommand command)
        {
            connection.Open();
            int ret = command.ExecuteNonQuery();
            connection.Close();
            return ret;
        }

        public static object ExecuteScalar(SqlConnection connection, SqlCommand command)
        {
            connection.Open();
            object ret = command.ExecuteScalar();
            connection.Close();
            return ret;
        }

        public static void AddParameter(SqlCommand command, string name, object value)
        {
            command.Parameters.Add(new SqlParameter(name, value));
        }
    }
}
