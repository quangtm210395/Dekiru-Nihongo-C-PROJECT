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
            try
            {
                new SqlDataAdapter(new SqlCommand(sql, getSqlConnection())).Fill(dataSet);
                return dataSet.Tables[0].Rows.Cast<DataRow>().AsEnumerable().ToList();
            } catch (Exception)
            {
                return new List<DataRow>();
            }
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

        public static List<Vocabulary> GetListFavoriteByLessonID(int UserID, int LessonID)
        {
            List<Vocabulary> listFavorite = new List<Vocabulary>();

            string sql = "SELECT VocabularyID FROM FavoriteWord JOIN Vocabulary ON VocabularyID = Vocabulary.ID WHERE UserID = " + UserID + " AND LessonID = " + LessonID + " ORDER BY VocabularyID";
            ListDataRow(sql).ForEach((data) =>
            {
                Vocabulary favorite = GetVocabularyByID(Convert.ToInt16(data["VocabularyID"]));
                listFavorite.Add(favorite);
            });
            return listFavorite;
        }

        public static List<Vocabulary> GetListFavoriteRandomByLessonID(int UserID, int LessonID)
        {
            List<Vocabulary> listFavorite = new List<Vocabulary>();

            string sql = "SELECT VocabularyID FROM FavoriteWord JOIN Vocabulary ON VocabularyID = Vocabulary.ID WHERE UserID = " + UserID + " AND LessonID = " + LessonID + " ORDER BY NEWID()";
            ListDataRow(sql).ForEach((data) =>
            {
                Vocabulary favorite = GetVocabularyByID(Convert.ToInt16(data["VocabularyID"]));
                listFavorite.Add(favorite);
            });
            return listFavorite;
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

        public static List<Quiz> GetListQuizRandomByLessonID(int LessonID, int size)
        {
            List<Quiz> listQuiz = new List<Quiz>();

            string sql = "SELECT TOP " + size + " * FROM Quiz WHERE LessonID = " + LessonID + " ORDER BY NEWID()";
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

        public static User Login(string username, string password)
        {
            username = username.ToLower();
            string sql = "SELECT * FROM [dbo].[User] WHERE Username = '" + username + "' AND Password = '" + password + "'";
            User user = new User(0, "Null", "");
            ListDataRow(sql).ForEach((data) =>
            {
                user = new User(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToString(data["Name"]),
                    Convert.ToString(data["ImageLink"]));
            });
            return user;
        }

        public static User Login(int userID)
        {
            string sql = "SELECT * FROM [dbo].[User] WHERE ID = " + userID;
            User user = new User(0, "Null", "");
            ListDataRow(sql).ForEach((data) =>
            {
                user = new User(
                    Convert.ToInt16(data["ID"]),
                    Convert.ToString(data["Name"]),
                    Convert.ToString(data["ImageLink"]));
            });
            return user;
        }

        public static User Register(string username, string password, string nickname)
        {
            username = username.ToLower();
            bool validUser = true;
            username.ToList().ForEach(c => validUser &= Char.IsLetterOrDigit(c));
            validUser &= username.Length >= 6;
            validUser &= !username.Contains(' ');
            if (username.Length == 0) throw new Exception("Username is wrong format");
            validUser &= Char.IsLetter(username[0]);
            if (!validUser) throw new Exception("Username is wrong format");

            bool validPass = true;
            validPass &= password.Length >= 6;
            validPass &= !password.Contains(' ');
            if (!validPass) throw new Exception("Password is wrong format");

            bool validName = true;
            validName &= nickname.Length > 0;
            string ok = nickname.Trim();
            for (int i = 0; i < 50; i++) ok = ok.Replace("  ", " ");
            validName &= ok == nickname;
            if (!validName) throw new Exception("Nickname is wrong format");

            string sql = "INSERT INTO [dbo].[User] "
                + "(Username, Password, Name) OUTPUT Inserted.ID "
                + "VALUES (@Username, @Password, @Name)";
            SqlConnection connection = getSqlConnection();
            SqlCommand command = new SqlCommand(sql, connection);

            AddParameter(command, "@Username", username);
            AddParameter(command, "@Password", password);
            AddParameter(command, "@Name", nickname);

            try
            {
                int userID = Convert.ToInt16(ExecuteScalar(connection, command));
                return Login(userID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool ChangeFavourite(int userID, int vocabID)
        {
            string insert = "INSERT INTO FavoriteWord VALUES (" + userID + ", " + vocabID + ")";
            string delete = "DELETE FROM FavoriteWord WHERE UserID = " + userID + " AND VocabularyID = " + vocabID;
            string sql = CheckFavourite(userID, vocabID) ? insert : delete;
            SqlConnection connection = getSqlConnection();
            SqlCommand command = new SqlCommand(sql, connection);

            ExecuteNonQuery(connection, command);
            return CheckFavourite(userID, vocabID);
        }

        public static bool CheckFavourite(int userID, int vocabID)
        {
            string sql = "SELECT * FROM FavoriteWord WHERE UserID = " + userID + " AND VocabularyID = " + vocabID;
            return ListDataRow(sql).Count == 0;
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
            try
            {
                connection.Open();
                object ret = command.ExecuteScalar();
                connection.Close();
                return ret;
            }
            catch (Exception)
            {
                throw new Exception("Username is existed");
            }
        }

        public static void AddParameter(SqlCommand command, string name, object value)
        {
            command.Parameters.Add(new SqlParameter(name, value));
        }
    }
}
