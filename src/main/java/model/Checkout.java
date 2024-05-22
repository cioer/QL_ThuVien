/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author coc
 */
public class Checkout {
    private String checkoutID;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private String patronID;
    private String bookCopyID;
    private boolean isReturn;

    public Checkout(String checkoutID, LocalDateTime startTime, LocalDateTime endTime, String patronID, String bookCopyID, boolean isReturn) {
        this.checkoutID = checkoutID;
        this.startTime = startTime;
        this.endTime = endTime;
        this.patronID = patronID;
        this.bookCopyID = bookCopyID;
        this.isReturn = isReturn;
    }

    public void setCheckoutID(String checkoutID) {
        this.checkoutID = checkoutID;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public void setPatronID(String patronID) {
        this.patronID = patronID;
    }

    public void setBookCopyID(String bookCopyID) {
        this.bookCopyID = bookCopyID;
    }

    // Getter và setter cho các thuộc tính
    public void setIsReturn(boolean isReturn) {
        this.isReturn = isReturn;
    }

    // ...
    public String getCheckoutID() {
        return checkoutID;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public String getPatronID() {
        return patronID;
    }

    public String getBookCopyID() {
        return bookCopyID;
    }

    public boolean isIsReturn() {
        return isReturn;
    }
}
