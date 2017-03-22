/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.fpt.dn.dao.DBContext;
import com.fpt.dn.dao.DataProvider;
import com.fpt.dn.dao.LessonData;
import com.fpt.dn.entity.DNObject;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rin's
 */
public class Main {

    public static DataProvider dp = new DataProvider();

    public static void main(String[] args) {
//        dp.getLocalData();
        insertQuiz();
    }
    
    public static void insertQuiz() {
        try {
            for (int i = 1; i < 16; i++) {
                LessonData ld = new LessonData("1", "" + i);
                if (ld.getListQuiz() != null ) {
                    for (DNObject object : ld.getListQuiz()) {
                        DBContext.insertQuiz(i, object);
                    }
                }
            }
        } catch (SQLException e) {
        }
    }

    public static void insertData() {
        try {
            for (int i = 1; i < 16; i++) {
                LessonData ld = new LessonData("1", "" + i);
                if (ld.getListVocab() != null) {
                    for (DNObject vocab : ld.getListVocab()) {
                        DBContext.insertByLesson(i, vocab, "Vocabulary");
                    }
                }
                if (ld.getListGram() != null) {
                    for (DNObject vocab : ld.getListGram()) {
                        DBContext.insertByLesson(i, vocab, "Grammar");
                    }
                }
                if (ld.getListKanji() != null) {
                    for (DNObject vocab : ld.getListKanji()) {
                        DBContext.insertByLesson(i, vocab, "Kanji");
                    }
                }
                if (ld.getListQuiz() != null) {
                    for (DNObject vocab : ld.getListQuiz()) {
                        DBContext.insertByLesson(i, vocab, "Quiz");
                    }
                }
                    
            }
        } catch (SQLException e) {
        }

    }

    public static void insertLessonName() {
        List<String> lessonNamesB1 = dp.getListOfLessonName("vocab", "1");
        List<String> lessonNamesB2 = dp.getListOfLessonName("vocab", "2");
        List<String> lessonNamesB3 = dp.getListOfLessonName("vocab", "3");

        for (int i = 0; i < lessonNamesB1.size(); i++) {
            try {
                DBContext.insertLesson(lessonNamesB2.get(i), 1, i + 1);
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("a");
        }
        for (int i = 0; i < lessonNamesB2.size(); i++) {
            try {
                DBContext.insertLesson(lessonNamesB2.get(i), 2, i + 1);
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("a");
        }
        for (int i = 0; i < lessonNamesB3.size(); i++) {
            try {
                DBContext.insertLesson(lessonNamesB3.get(i), 3, i + 1);
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("a");
        }
    }
}
