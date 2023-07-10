/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model.Laporan;

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
public class mPpBarang {
    
    
      public void showTable(JTable tblBrg ){
    
        
            try{
              String call = "{CALL get_view_laporan_ppbarang()}"; 
                 CallableStatement cstmt = (CallableStatement)Conn.connect().prepareCall(call);
                 ResultSet rs = cstmt.executeQuery();     
                 
                 DefaultTableModel model = (DefaultTableModel) tblBrg.getModel();
                 model.setRowCount(0);
                 while(rs.next()){
                     model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9)});
                 }
                 
                 

            }catch(Exception e){
               JOptionPane.showMessageDialog(null,e);
            }
    
    
    }
}
