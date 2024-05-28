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
import javax.swing.table.DefaultTableModel;
import model.*;

/**
 *
 * @author Admin
 */
public class Data {

    public Data() {

    }

    public List<String> dsBang() {//load ds Bảng lên combox
        List<String> ds = new ArrayList<>();
        try {
            String query = "Select table_name from information_schema.tables where table_type = 'base table'";

            ResultSet rs = Conn.getData(query);
            while (rs.next()) {
                ds.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ds;
    }

    public boolean showTable(JTable tb, String query) {

        try {
            ResultSet rs = Conn.getData(query);
            ResultSetMetaData rsmeta = rs.getMetaData();
            
            int colCount = rsmeta.getColumnCount();
            String[] colName = new String[colCount];
            for (int i = 1; i <= colCount; i++) {
                colName[i - 1] = rsmeta.getColumnName(i);
            }
            DefaultTableModel tbModel = new DefaultTableModel(colName,0);
            while (rs.next()) {
                String[] item = new String[colCount];
                for (int i = 1; i <= colCount; i++) {
                    item[i - 1] = rs.getString(i);
                }
                tbModel.addRow(item);
            }
            tb.setModel(tbModel);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
}
