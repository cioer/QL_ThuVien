/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;



/**
 *
 * @author coc
 */
public class Notification {
    private String noteID;
    private Date sentAt;
    private String type;
    private String patronID;

    public Notification(String noteID, Date sentAt, String type, String patronID) {
        this.noteID = noteID;
        this.sentAt = sentAt;
        this.type = type;
        this.patronID = patronID;
    }

    // Getter và setter cho các thuộc tính

    // ...

    public String getNoteID() {
        return noteID;
    }

    public void setNoteID(String noteID) {
        this.noteID = noteID;
    }

    public Date getSentAt() {
        return sentAt;
    }

    public void setSentAt(Date sentAt) {
        this.sentAt = sentAt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPatronID() {
        return patronID;
    }

    public void setPatronID(String patronID) {
        this.patronID = patronID;
    }
}
