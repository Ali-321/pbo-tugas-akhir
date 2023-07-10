/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model;

import com.mysql.cj.jdbc.CallableStatement;
import java.sql.ResultSet;

/**
 *
 * @author Lenovo
 */
public class mLogin {
 
static String user;
static String level;
   
   
   public static boolean login(String username,String pswd){
    
       boolean temp = false;
      
         try{
                  
                 String call = "{CALL get_user(?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 cstmt.setString(1,username);
                 cstmt.setString(2,pswd);
                 ResultSet rs = cstmt.executeQuery();     
                  // searching of data 
                  int i = 0  ;
                  while(rs.next()){
                      user = rs.getString("name");
                      level = rs.getString("level");
                      new Sesi(user,level);
                      i++;  
                  }
                  
                  if(i == 1){
                      temp = true;
                  }
                  
                  
            }catch(Exception e){
                e.printStackTrace();
            }
            
         return temp;
   }
    
}
