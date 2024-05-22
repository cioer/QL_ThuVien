/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author coc
 */
public class BookCtrl {

    private Connection conn;

    public BookCtrl() {
        this.conn = Conn.conn();
    }

    
    
    //tim kiem sach
    
    public List<Book> timSach(String bookTitle,String categoryName,String authorName,String publisherName){
        List<Book> books = new ArrayList<>();
        
        String query = "SELECT " +
                "b.bookID, " +
                "b.title, " +
                "b.catetgoryID " +
                "FROM book b " +
                "LEFT JOIN book_author ba ON b.bookID = ba.bookID " +
                "LEFT JOIN author a ON ba.authorID = a.authorID " +
                "LEFT JOIN bookCopy bc ON b.bookID = bc.bookID " +
                "LEFT JOIN publisher p ON bc.publisherID = p.publisherID " +
                "LEFT JOIN category c ON b.catetgoryID = c.categoryID " +
                "WHERE " +
                "(? IS NULL OR b.title LIKE '%' + ? + '%') AND " +
                "(? IS NULL OR a.name LIKE '%' + ? + '%') AND " +
                "(? IS NULL OR p.name LIKE '%' + ? + '%') AND " +
                "(? IS NULL OR c.name LIKE '%' + ? + '%')";
        
        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, bookTitle);
            stmt.setString(2, bookTitle);
            stmt.setString(3, authorName);
            stmt.setString(4, authorName);
            stmt.setString(5, publisherName);
            stmt.setString(6, publisherName);
            stmt.setString(7, categoryName);
            stmt.setString(8, categoryName);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                    Book book = new Book();
                    book.setBookID(rs.getString(1));
                    book.setTitle(rs.getString(2));
                    book.setCategoryID(rs.getString(3));
                    books.add(book);
                }
        } catch (SQLException ex) {
            Logger.getLogger(BookCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }
    
    //load cac combox
    public List<String> CacTheLoai() {
        List<String> cacTheLoai = new ArrayList<>();
        String query = "select name from category";

        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
                cacTheLoai.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cacTheLoai;
    }
    
    public List<String> CacNXB() {
        List<String> cacNXB = new ArrayList<>();
        String query = "select name from publisher";

        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
                cacNXB.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cacNXB;
    }
    
    public List<String> CacTacGia() {
        List<String> cacTacGia = new ArrayList<>();
        String query = "select name from author";

        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
                cacTacGia.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cacTacGia;
    }

}
