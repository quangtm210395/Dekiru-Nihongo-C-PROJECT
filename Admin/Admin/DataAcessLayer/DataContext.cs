using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Admin
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

        public static SqlCommand getSqlCommand(string sql, SqlConnection connection)
        {
            return new SqlCommand(sql, connection);
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

        public static Vocabulary GetVocabularyByID(int ID)
        {
            Vocabulary vocabulary = null;

            string sql = "SELECT * FROM Vocabulary WHERE ID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                vocabulary = new Vocabulary(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
            });
            return vocabulary;
        }

        public static List<Vocabulary> GetListVocabulary()
        {
            List<Vocabulary> listVocabulary = new List<Vocabulary>();

            string sql = "SELECT * FROM Vocabulary";
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

        public static List<Vocabulary> GetListVocabularyByLessonIDAndSearchText(int LessonID, string text)
        {
            string sql;
            List<Vocabulary> listVocabulary = new List<Vocabulary>();
            if (text.Length != 0)
                sql = "SELECT * FROM Vocabulary WHERE LessonID = " + LessonID + " OR (Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%')";
            else sql = "SELECT * FROM Vocabulary WHERE LessonID = " + LessonID;
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
        
        public static List<Vocabulary> GetListVocabularyBySearchText(int LessonID, string text)
        {
            string sql;
            List<Vocabulary> listVocabulary = new List<Vocabulary>();
            if (text.Length != 0)
                sql = "SELECT * FROM Vocabulary WHERE Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%'";
            else sql = "SELECT * FROM Vocabulary WHERE LessonID = " + LessonID;
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

        public static Grammar GetGrammarByID(int ID)
        {
            Grammar grammar = null;

            string sql = "SELECT * FROM Grammar WHERE ID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                grammar = new Grammar(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
            });
            return grammar;
        }

        public static List<Grammar> GetListGrammar()
        {
            List<Grammar> listGrammar = new List<Grammar>();

            string sql = "SELECT * FROM Grammar";
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

        public static List<Grammar> GetListGrammarByLessonIDAndSearchText(int LessonID, string text)
        {
            string sql;
            List<Grammar> listGrammar = new List<Grammar>();
            if (text.Length != 0)
                sql = "SELECT * FROM Grammar WHERE LessonID = " + LessonID + " OR (Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%')";
            else sql = "SELECT * FROM Grammar WHERE LessonID = " + LessonID; ;
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

        public static List<Grammar> GetListGrammarBySearchText(int LessonID, string text)
        {
            string sql;
            List<Grammar> listGrammar = new List<Grammar>();
            if (text.Length != 0)
                sql = "SELECT * FROM Grammar WHERE Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%'";
            else sql = "SELECT * FROM Grammar WHERE LessonID = " + LessonID; ;
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

        public static Kanji GetKanjiByID(int ID)
        {
            Kanji kanji = null;
            string sql = "SELECT * FROM Kanji WHERE ID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                kanji = new Kanji(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Term"]),
                    Convert.ToString(data["Definition"]));
            });
            return kanji;
        }

        public static List<Kanji> GetListKanji()
        {
            List<Kanji> listKanji = new List<Kanji>();

            string sql = "SELECT * FROM Kanji";
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

        public static List<Kanji> GetListKanjiByLessonIDAndSearchText(int LessonID, string text)
        {
            string sql;
            List<Kanji> listKanji = new List<Kanji>();
            if(text.Length != 0)
                sql = "SELECT * FROM Kanji WHERE LessonID = " + LessonID + " OR (Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%')";
            else sql = "SELECT * FROM Kanji WHERE LessonID = " + LessonID;
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

        public static List<Kanji> GetListKanjiBySearchText(int LessonID, string text)
        {
            string sql;
            List<Kanji> listKanji = new List<Kanji>();
            if (text.Length != 0)
                sql = "SELECT * FROM Kanji WHERE Term LIKE N'%" + text + "%' or Definition LIKE N'%" + text + "%'";
            else sql = "SELECT * FROM Kanji WHERE LessonID = " + LessonID;
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

        public static Quiz GetQuizByID(int ID)
        {
            Quiz quiz = null;

            string sql = "SELECT * FROM Quiz WHERE ID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                quiz = new Quiz(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Question"]),
                    Convert.ToString(data["CorrectAnswer"]),
                    Convert.ToString(data["Answer1"]),
                    Convert.ToString(data["Answer2"]),
                    Convert.ToString(data["Answer3"]));
            });
            return quiz;
        }

        public static List<Quiz> GetListQuiz()
        {
            List<Quiz> listQuiz = new List<Quiz>();

            string sql = "SELECT * FROM Quiz";
            ListDataRow(sql).ForEach((data) =>
            {
                Quiz quiz = new Quiz(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Question"]),
                    Convert.ToString(data["CorrectAnswer"]),
                    Convert.ToString(data["Answer1"]),
                    Convert.ToString(data["Answer2"]),
                    Convert.ToString(data["Answer3"]));
                listQuiz.Add(quiz);
            });
            return listQuiz;
        }

        public static List<Quiz> GetListQuizByLessonID(int ID)
        {
            List<Quiz> listQuiz = new List<Quiz>();

            string sql = "SELECT * FROM Quiz WHERE LessonID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                Quiz quiz = new Quiz(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Question"]),
                    Convert.ToString(data["CorrectAnswer"]),
                    Convert.ToString(data["Answer1"]),
                    Convert.ToString(data["Answer2"]),
                    Convert.ToString(data["Answer3"]));
                listQuiz.Add(quiz);
            });
            return listQuiz;
        }

        public static List<Quiz> GetListQuizByLessonIDAndSearchText(int ID, string text)
        {
            string sql;
            List<Quiz> listQuiz = new List<Quiz>();
            if (text.Length != 0)
                sql = "SELECT * FROM Quiz WHERE LessonID = " + ID + " OR Question LIKE N'%" + text + "%'";
            else sql = "SELECT * FROM Quiz WHERE LessonID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                Quiz quiz = new Quiz(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Question"]),
                    Convert.ToString(data["CorrectAnswer"]),
                    Convert.ToString(data["Answer1"]),
                    Convert.ToString(data["Answer2"]),
                    Convert.ToString(data["Answer3"]));
                listQuiz.Add(quiz);
            });
            return listQuiz;
        }

        public static List<Quiz> GetListQuizBySearchText(int ID, string text)
        {
            string sql;
            List<Quiz> listQuiz = new List<Quiz>();
            if (text.Length != 0)
                sql = "SELECT * FROM Quiz WHERE Question LIKE N'%" + text + "%'";
            else sql = "SELECT * FROM Quiz WHERE LessonID = " + ID;
            ListDataRow(sql).ForEach((data) =>
            {
                Quiz quiz = new Quiz(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToInt16(data["LessonID"]),
                    Convert.ToString(data["Question"]),
                    Convert.ToString(data["CorrectAnswer"]),
                    Convert.ToString(data["Answer1"]),
                    Convert.ToString(data["Answer2"]),
                    Convert.ToString(data["Answer3"]));
                listQuiz.Add(quiz);
            });
            return listQuiz;
        }

        public static int Login(string username, string password)
        {
            Admin admin = null;
            string sql = "SELECT * FROM Admin where Username = '" + username + "'";
            ListDataRow(sql).ForEach((data) =>
            {
                admin = new Admin(data["Username"].ToString(), data["Password"].ToString());
            });
            if (admin == null)
            {
                return -1;
            } else
            {
                if (admin.Password == password) return 1;
                else return 0;
            }
        }

        public static int AddGrammar(Grammar grammar)
        {
            string sql = "INSERT INTO GRAMMAR VALUES(@lessonID, @term, @definition)";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@lessonID", grammar.LessonID);
            AddParameter(command, "@term", grammar.Term);
            AddParameter(command, "@definition", grammar.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int AddVocabulary(Vocabulary vocab)
        {
            string sql = "INSERT INTO Vocabulary VALUES(@lessonID, @term, @definition)";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@lessonID", vocab.LessonID);
            AddParameter(command, "@term", vocab.Term);
            AddParameter(command, "@definition", vocab.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int AddKanji(Kanji kanji)
        {
            string sql = "INSERT INTO Kanji VALUES(@lessonID, @term, @definition)";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@lessonID", kanji.LessonID);
            AddParameter(command, "@term", kanji.Term);
            AddParameter(command, "@definition", kanji.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int AddQuiz(Quiz quiz)
        {
            string sql = "INSERT INTO Quiz VALUES(@lessonID, @question, @answer1, @answer2, @answer3, @correct)";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@lessonID", quiz.LessonID);
            AddParameter(command, "@question", quiz.Question);
            AddParameter(command, "@answer1", quiz.Answer1);
            AddParameter(command, "@answer2", quiz.Answer2);
            AddParameter(command, "@answer3", quiz.Answer3);
            AddParameter(command, "@correct", quiz.Correct);
            return ExecuteNonQuery(connection, command);
        }

        public static int EditGrammar(Grammar grammar)
        {
            string sql = "UPDATE Grammar set LessonID = @lessonID, Term = @term, Definition = @definition WHERE ID = @id";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@id", grammar.ID);
            AddParameter(command, "@lessonID", grammar.LessonID);
            AddParameter(command, "@term", grammar.Term);
            AddParameter(command, "@definition", grammar.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int EditVocabulary(Vocabulary vocab)
        {
            string sql = "UPDATE Vocabulary set LessonID = @lessonID, Term = @term, Definition = @definition WHERE ID = @id";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@id", vocab.ID);
            AddParameter(command, "@lessonID", vocab.LessonID);
            AddParameter(command, "@term", vocab.Term);
            AddParameter(command, "@definition", vocab.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int EditKanji(Kanji kanji)
        {
            string sql = "UPDATE Kanji set LessonID = @lessonID, Term = @term, Definition = @definition WHERE ID = @id";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@id", kanji.ID);
            AddParameter(command, "@lessonID", kanji.LessonID);
            AddParameter(command, "@term", kanji.Term);
            AddParameter(command, "@definition", kanji.Definition);
            return ExecuteNonQuery(connection, command);
        }

        public static int EditQuiz(Quiz quiz)
        {
            string sql = "UPDATE Quiz set LessonID = @lessonID, Question = @question, Answer1 = @answer1, Answer2 = @answer2, Answer3 = @answer3, CorrectAnswer = @correct WHERE ID = @id";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            AddParameter(command, "@id", quiz.ID);
            AddParameter(command, "@lessonID", quiz.LessonID);
            AddParameter(command, "@question", quiz.Question);
            AddParameter(command, "@answer1", quiz.Answer1);
            AddParameter(command, "@answer2", quiz.Answer2);
            AddParameter(command, "@answer3", quiz.Answer2);
            AddParameter(command, "@correct", quiz.Correct);
            return ExecuteNonQuery(connection, command);
        }

        public static int DeleteGrammar(int ID)
        {
            string sql = "DELETE FROM Grammar WHERE ID = " + ID;
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            return ExecuteNonQuery(connection, command);
        }

        public static int DeleteVocabulary(int ID)
        {
            string sql = "DELETE FROM Vocabulary WHERE ID = " + ID;
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            return ExecuteNonQuery(connection, command);
        }

        public static int DeleteKanji(int ID)
        {
            string sql = "DELETE FROM Kanji WHERE ID = " + ID;
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            return ExecuteNonQuery(connection, command);
        }

        public static int DeleteQuiz(int ID)
        {
            string sql = "DELETE FROM Quiz WHERE ID = " + ID;
            SqlConnection connection = getSqlConnection();
            SqlCommand command = getSqlCommand(sql, connection);
            return ExecuteNonQuery(connection, command);
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
