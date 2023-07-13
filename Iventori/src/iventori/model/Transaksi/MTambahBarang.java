/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model.Transaksi;

import com.mysql.cj.jdbc.CallableStatement;
import iventori.model.Conn;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Lenovo
 */

public class MTambahBarang {
    
    
static int id;
    
         public MTambahBarang(){
    
        
            try{
              String call = "{CALL get_transaksi_bm()}";
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 ResultSet rs = cstmt.executeQuery();    
   
                 int i =0;
                 while(rs.next()){

                     i++;
                 }
                 id = i++;
                 

            }catch(SQLException e){
               JOptionPane.showMessageDialog(null,e);
            }      

    }
         
         
         public void showTable(JTable tblBrg ,String kodeBeli){
    
        
            try{
              String call = "{CALL get_transaksi_bm2(?)}";
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 cstmt.setString(1,kodeBeli );
 
                 ResultSet rs = cstmt.executeQuery();    
   
                 
                 DefaultTableModel model = (DefaultTableModel) tblBrg.getModel();
                 model.setRowCount(0);
          
                 while(rs.next()){
                     model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)});
           
                 }

            }catch(SQLException e){
               JOptionPane.showMessageDialog(null,e);
            }      

    }
         
            public void insert(String kode,String kdBrg,int jml){
 
            id++;
            try{
             
                 String call = "{CALL insert_dbeli(?,?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setInt(1, id);
                 cstmt.setString(2, kode);
                 cstmt.setString(3, kdBrg);
                 cstmt.setInt(4, jml);
                 cstmt.executeUpdate();

            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
    
    
    }
            
      public void delete(int id){
            try{
           
                 String call = "{CALL delete_dbeli(?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setInt(1,id);
                 cstmt.executeUpdate();
            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
              id--;
            
    }
      
       public void update(int id,String kodeBeli,String kodeBrg,int jml){
         
            try{
             
                 String call = "{CALL update_dbeli(?,?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 
                 cstmt.setInt(1, id);
                 cstmt.setString(2, kodeBeli);
                 cstmt.setString(3, kodeBrg);
                 cstmt.setInt(4, jml);
                 
                 
                 cstmt.executeUpdate();
                 
            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
            
    }
}
