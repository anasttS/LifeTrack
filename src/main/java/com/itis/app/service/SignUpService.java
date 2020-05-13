package com.itis.app.service;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.User;

public interface SignUpService {
    void signUp(SignUpDto signUpDto);
    User signUpDiscord(SignUpDto signUpDto);
}
