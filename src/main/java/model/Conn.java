/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author coc
 */
public class Conn {
    public static Connection conn(){
        try {
            String url = "jdbc:sqlserver://localhost;databaseName=ql_thuvien;user=sa;password=Abc123!@#;trustServerCertificate=true";
            return DriverManager.getConnection(url);
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static ResultSet getData(String query) throws SQLException{
        Statement stm = conn().createStatement();
        return stm.executeQuery(query);
        
    }
    public static int update(String query) throws SQLException{
        Statement stm = conn().createStatement();
        return stm.executeUpdate(query);
    }
}
