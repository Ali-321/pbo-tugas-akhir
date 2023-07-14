/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model;

import java.util.Scanner;

/**
 *
 * @author Lenovo
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Conn {
 public static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
 public static final String DB_URL = "jdbc:mysql://127.0.0.1/iventori_11162";
 public static final String USER ="root";
 public static final String PASS = "";
    
    static Connection conn;
    
    
   public Conn(){
   
   }
   
     public static Connection connect(){
            try{
                Class.forName(JDBC_DRIVER);
                conn = DriverManager.getConnection(DB_URL,USER,PASS);
            }catch(Exception e){
                System.out.println("tidak melakukan koneksi");
                e.printStackTrace();
            }
            
            return conn;
    }


   
}
