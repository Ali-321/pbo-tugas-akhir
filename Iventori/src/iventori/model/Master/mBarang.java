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
public class mBarang {
    
    
     public void showTable(JTable tblBrg ){
    
        
            try{
              String call = "{CALL get_barang()}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 ResultSet rs = cstmt.executeQuery();     
                 
                 DefaultTableModel model = (DefaultTableModel) tblBrg.getModel();
                 model.setRowCount(0);
                 while(rs.next()){
                     model.addRow(new String[]{rs.getString(2),rs.getString(1),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(7),rs.getString(6)});
                 }
                 
                 

            }catch(Exception e){
               JOptionPane.showMessageDialog(null,e);
            }
    
    
    }
     
    public void insert(String kode,String nama,String satuan,int hrgBeli,int hrgJual ,int stok,int stokMin){
   

            try{
             
                 String call = "{CALL insert_barang(?,?,?,?,?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setString(1, kode);
                 cstmt.setString(2, nama);
                 cstmt.setString(3, satuan);
                 cstmt.setInt(4, hrgBeli);
                 cstmt.setInt(5, hrgJual);
                 cstmt.setInt(6, stok);
                 cstmt.setInt(7, stokMin);
                 cstmt.executeUpdate();

            }catch(Exception e){
          
                JOptionPane.showMessageDialog(null,e);
            }
    
    
    } 
     
    public void delete(String kode){
        
            try{
             
                 String call = "{CALL delete_barang(?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
           
                 cstmt.setString(1, kode);
                 cstmt.executeUpdate();
            }catch(Exception e){
          
                JOptionPane.showMessageDialog(null,e);
            }
            
    }
    
    public void update(String kode,String nama,String satuan,int hrgBeli,int hrgJual ,int stok,int stokMin){
        
            try{
             
                 String call = "{CALL update_barang(?,?,?,?,?,?,?)}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 
                 cstmt.setString(1, kode);
                 cstmt.setString(2, nama);
                 cstmt.setString(3, satuan);
                 cstmt.setInt(4, hrgBeli);
                 cstmt.setInt(5, hrgJual);
                 cstmt.setInt(6, stok);
                 cstmt.setInt(7, stokMin);
                 cstmt.setString(1, kode);
                 cstmt.executeUpdate();
                 
            }catch(Exception e){
          
                JOptionPane.showMessageDialog(null,e);
            }
            
    }
    
    
    
    
     
}



