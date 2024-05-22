/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author coc
 */
public class BookAuthor {
    private String bookID;
    private String authorID;

    // Constructors, getters, and setters

    public BookAuthor() {
    }

    public BookAuthor(String bookID, String authorID) {
        this.bookID = bookID;
        this.authorID = authorID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }
}