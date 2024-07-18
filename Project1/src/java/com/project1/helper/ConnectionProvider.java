package com.project1.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
    try{
       if(con == null){
        Class.forName("com.mysql.cj.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/project1_database","root","1808");
       }
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return con;
    }
}
