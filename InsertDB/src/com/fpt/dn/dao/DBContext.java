/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpt.dn.dao;

import com.fpt.dn.entity.DNObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rin's
 */
public class DBContext {

    private static final String IP = "localhost";
    private static final String url = "jdbc:sqlserver://" + IP + ":1433;databaseName=DekiruNihongo";
    private static final String user = "sa";
    private static final String passwd = "123456";
    private static Connection conn = null;

    public DBContext() {
        
    }

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //2. Get connection by url (connection string)
            conn = DriverManager.getConnection(url, user, passwd);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (conn != null) {
            return conn;
        }
        return null;
    }
    
    public static void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static int insertLesson(String lessonName, int bookID, int lessonNum) throws SQLException {
        PreparedStatement ps = null;
        String sql = "INSERT INTO LESSON(Name, BookID, LessonNumber) VALUES(?,?,?)";
        int ret;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, lessonName);
            ps.setInt(2, bookID);
            ps.setInt(3, lessonNum);
            ret = ps.executeUpdate();
            if (ret == 1) {
                System.out.println("success");
                return ret;
            }
        } catch (Exception e) {
        } finally {
            if (ps!=null) ps.close();
            close();
        }
        return 0;
    }
    
    public static int insertByLesson(int lessonID, DNObject obj, String table) throws SQLException {
        PreparedStatement ps = null;
        String sql = "INSERT INTO " + table + " VALUES(?,?,?)";
        int ret;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, lessonID);
            ps.setString(2, obj.getKey());
            ps.setString(3, obj.getValue());
            ret = ps.executeUpdate();
            if (ret == 1) {
                System.out.println("success");
                return ret;
            }
        } catch (Exception e) {
        } finally {
            if (ps!=null) ps.close();
            close();
        }
        return 0;
    }
    
    public static int insertQuiz(int lessonID, DNObject obj) throws SQLException {
        PreparedStatement ps = null;
        String sql = "INSERT INTO Quiz VALUES(?,?,?,?,?,?)";
        int ret;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, lessonID);
            ps.setString(2, obj.getKey());
            ps.setString(3, obj.getQuizAnswer()[0]);
            ps.setString(4, obj.getQuizAnswer()[1]);
            ps.setString(5, obj.getQuizAnswer()[2]);
            ps.setString(6, obj.getQuizAnswer()[3]);
            ret = ps.executeUpdate();
            if (ret == 1) {
                System.out.println("success");
                return ret;
            }
        } catch (Exception e) {
        } finally {
            if (ps!=null) ps.close();
            close();
        }
        return 0;
    }

}
