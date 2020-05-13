package com.itis.app.dto;


import lombok.Data;

@Data
public class MessageDto {
    private MessageType type;
    private String content;
    private String sender;
    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE
    }
}