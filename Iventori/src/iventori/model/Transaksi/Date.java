/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iventori.model.Transaksi;


import java.time.LocalDate;

/**
 *
 * @author Lenovo
 */
public class Date {
    
    public static String dateNow(){
        LocalDate localDate = LocalDate.now();
        String dateString = localDate.toString();
        return dateString;
    }
    
    
  }