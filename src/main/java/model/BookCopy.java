/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author coc
 */
public class BookCopy {
    private String bookCopyID;
    private int yearPublished;
    private String bookID;
    private String publisherID;

    public BookCopy(String bookCopyID, int yearPublished, String bookID, String publisherID) {
        this.bookCopyID = bookCopyID;
        this.yearPublished = yearPublished;
        this.bookID = bookID;
        this.publisherID = publisherID;
    }

    public void setBookCopyID(String bookCopyID) {
        this.bookCopyID = bookCopyID;
    }

    public void setYearPublished(int yearPublished) {
        this.yearPublished = yearPublished;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    // Getter và setter cho các thuộc tính
    public void setPublisherID(String publisherID) {
        this.publisherID = publisherID;
    }

    // ...
    public String getBookCopyID() {
        return bookCopyID;
    }

    public int getYearPublished() {
        return yearPublished;
    }

    public String getBookID() {
        return bookID;
    }

    public String getPublisherID() {
        return publisherID;
    }
}