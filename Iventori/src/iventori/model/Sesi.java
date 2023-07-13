/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model;

/**
 *
 * @author Lenovo
 */
public class Sesi {
   public static String username;
   public static String level;
   public static boolean access;
   public static int  id;
    
    
    public Sesi(String user,String level,int id){
         this.username = user;
         this.level = level;
         this.id = id;

         if(level.equals("administrator")){
             this.access = true;
         }else{
             this.access = false;
         }
    }
    
    public Sesi(){
    }
    
}
