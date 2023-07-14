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
public class MBarangKeluar {
    
       public void showTable(JTable tblBrg ){
    
        
            try{
              String call = "{CALL get_transaksi_brgk()}";
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 ResultSet rs = cstmt.executeQuery();    
   
                 
                 DefaultTableModel model = (DefaultTableModel) tblBrg.getModel();
                 model.setRowCount(0);
                 while(rs.next()){
                     model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)});
                    
                 
                 }
                 
                 

            }catch(SQLException e){
               JOptionPane.showMessageDialog(null,e);
            }
    
    
    }
       
       
    public void insertTjual(String kode,String tgl,int idUser){
 
            try{
             
                 String call = "{CALL insert_tjual(?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setString(1, kode);
                 cstmt.setString(2, tgl);
                 cstmt.setInt(3, idUser);
                 cstmt.executeUpdate();

            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
    
    
    } 
    
    public void update(String kodeJual,String tgl,int id){
         
            try{
             
                 String call = "{CALL update_tjual(?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 
                 cstmt.setString(1, kodeJual);
                 cstmt.setString(2, tgl);
                 cstmt.setInt(3, id);
                 cstmt.executeUpdate();
                 
            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
            
    }
    
      public void deleteTjual(String kodeJual){
            try{
             
                 String call = "{CALL delete_tjual(?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setString(1,kodeJual);
                 cstmt.executeUpdate();
            }catch(SQLException e){
          
                JOptionPane.showMessageDialog(null,e);
            }
            
    }
    
}