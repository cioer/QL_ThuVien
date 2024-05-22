/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;



/**
 *
 * @author coc
 */
public class Book {

    private String bookID;
    private String title;
    private String categoryID;

    // Constructors, getters, and setters
    public Book() {
    }

    public Book(String bookID, String title, String categoryID) {
        this.bookID = bookID;
        this.title = title;
        this.categoryID = categoryID;
    }

    
    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

}
