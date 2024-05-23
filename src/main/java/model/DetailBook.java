/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author coc
 */
public class DetailBook extends Book {
    private List<Author> authors;
    private List<BookCopy> bookCopies;
    private Category cate;
    

    

    public DetailBook(String masach) {
       super.setBookID(masach);
       getInfoBook();
       getAuthor();
       getBookCopy();
       getcate();
    }

    public List<Author> getAuthors() {
        return authors;
    }

    public List<BookCopy> getBookCopies() {
        return bookCopies;
    }

    public Category getCate() {
        return cate;
    }
    
    
    private void getInfoBook(){
        String query = "select title,categoryID from book where bookID = '"+super.getBookID()+"'";
        try {
            ResultSet rs = Conn.getData(query);
            while (rs.next()){
                super.setCategoryID("categoryID");
                super.setTitle(rs.getString("title"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void getAuthor(){
        this.authors = new ArrayList<>();
        String query = "select a.authorID,name from author a inner join book_author ba on a.authorID = ba.authorID "
                + "where bookID = ?";
        try {
            PreparedStatement pstm = Conn.conn().prepareStatement(query);
            pstm.setString(1, super.getBookID());
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                Author au = new Author(rs.getString(1),rs.getString(2));
                this.authors.add(au);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void getBookCopy() {
        bookCopies = new ArrayList<>();
        String query = "select bookcopyid,yearpublished,bc.bookid,publisherid "
                + "from bookcopy bc "
                + "inner join book b on b.bookid = bc.bookid "
                + "where b.bookid = ?";
        try {
            PreparedStatement pstm = Conn.conn().prepareStatement(query);
            pstm.setString(1, super.getBookID());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                BookCopy bc = new BookCopy(rs.getString("bookcopyid"),rs.getInt("yearpublished"),rs.getString("bookid"),rs.getString("publisherid"));
                this.bookCopies.add(bc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailBook.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void getcate() {
        String query = "Select c.categoryid,name "
                + "from category c "
                + "inner join book b on b.categoryid = c.categoryid "
                + "where b.bookid = ?";
        PreparedStatement pstm;
        try {
            pstm = Conn.conn().prepareStatement(query);
            pstm.setString(1, super.getBookID());
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
            this.cate = new Category(rs.getString(1),rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailBook.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
}
