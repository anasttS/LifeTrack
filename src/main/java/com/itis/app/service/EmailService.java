package com.itis.app.service;


import com.itis.app.model.MailMessage;

public interface EmailService {
    void sendMail(MailMessage message);
}
