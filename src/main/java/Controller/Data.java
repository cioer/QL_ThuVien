/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;
import model.*;

/**
 *
 * @author Admin
 */
public class Data {
   

    public Data() {
       
        
    }
    
    public List<String> dsBang(){//load ds Bảng lên combox
        List<String> ds = new ArrayList<>();
        try {
            String query = "Select table_name from information_schema.tables where table_type = 'base table'";
            
            ResultSet rs = Conn.getData(query);
            while (rs.next()){
                ds.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ds;
    }
    
    public boolean showTable(JTable tb,String tbName){
        String query ="select * from "+tbName;
        try {
            ResultSet rs =  Conn.getData(query);
            ResultSetMetaData rsmeta = rs.getMetaData();
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
