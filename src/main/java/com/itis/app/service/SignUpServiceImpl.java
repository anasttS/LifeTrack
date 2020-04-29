package com.itis.app.service;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.Role;
import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SignUpServiceImpl implements SignUpService  {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void signUp(SignUpDto signUpDto) {
        User user = User.builder()
                .email(signUpDto.getEmail())
                .username(signUpDto.getUsername())
                .hashPassword(passwordEncoder.encode(signUpDto.getPassword()))
                .role(Role.USER)
                .state(State.NOT_CONFIRMED)
                .birthday(signUpDto.getBirthday())
                .build();

        userRepository.save(user);
    }
}
