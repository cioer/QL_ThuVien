/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Conn;
import model.Patron;

/**
 *
 * @author coc
 */
public class PatronCtrl {

    private Connection conn = null;

    public PatronCtrl() {
        this.conn = Conn.conn();
    }

    public Patron DangNhap(String email, String pass) {
        Patron p = new Patron();
        try {
            //dang nhap thanh cong thi tra ve khach(patron) ; neu khong thi tra ve null
            String passHash = encryptPassword(pass);
            
            String query = "select * from patron_account where (email = ?)";
            PreparedStatement pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                if (passHash.equals(rs.getString(5))) {
                    p.setPatronID(rs.getString(1));
                    p.setFirstName(rs.getString(2));
                    p.setLastName(rs.getString(3));
                    p.setEmail(rs.getString(4));
                    p.setPass(rs.getString(5));
                    p.setStatus(rs.getString(6));
                    return p;
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(PatronCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public boolean themKH(Patron p){
        String query = "insert into patron_account values (?,?,?,?,?,?)";
        try {
            conn.setAutoCommit(false);
            PreparedStatement ptm = conn.prepareStatement(query);
            ptm.setString(1, p.getPatronID());
            ptm.setString(2,p.getFirstName());
            ptm.setString(3,p.getLastName());
            ptm.setString(4, p.getEmail());
            ptm.setString(5,p.getPass());
            ptm.setString(6,"active");
             ptm.execute();
            conn.commit();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PatronCtrl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
       
    }
    public static String encryptPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }
}
