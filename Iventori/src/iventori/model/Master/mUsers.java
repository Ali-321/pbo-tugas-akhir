/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model.Master;

import com.mysql.cj.jdbc.CallableStatement;
import iventori.model.Conn;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Lenovo
 */
public class mUsers {
   private int id;
    
    
       public void showTable(JTable tblBrg ){
    
        
            try{
              String call = "{CALL get_users()}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 ResultSet rs = cstmt.executeQuery();     
                 
                 DefaultTableModel model = (DefaultTableModel) tblBrg.getModel();
                 model.setRowCount(0);
                 int i=1;
                 while(rs.next()){
   
                     model.addRow(new String[]{rs.getString(1),rs.getString(3),rs.getString(2),rs.getString(4),rs.getString(5)});
                     i++;
                 }
                 this.id = i++;
                 
                 

            }catch(Exception e){
               JOptionPane.showMessageDialog(null,e);
            }
    
    
    }
       
     public void insert(String pswd,String name,String level,boolean status){
           

            try{
                   
                 String call = "{CALL insert_users(?,?,?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 
                 cstmt.setInt(1, id);
                 cstmt.setString(2, pswd);
                 cstmt.setString(3, name);
                 cstmt.setString(4,level );
                 cstmt.setBoolean(5,status);
                 cstmt.executeUpdate();

            }catch(Exception e){
          
                JOptionPane.showMessageDialog(null,e);
            }
    
    
    } 
}
