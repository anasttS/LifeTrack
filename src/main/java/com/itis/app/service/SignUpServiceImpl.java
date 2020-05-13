package com.itis.app.service;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.MailMessage;
import com.itis.app.model.Role;
import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import jdk.nashorn.internal.objects.annotations.ScriptClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.UUID;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailService emailService;

    @Autowired
    UserService userService;


    @Override
    public void signUp(SignUpDto signUpDto) {
        User user = User.builder()
                .email(signUpDto.getEmail())
                .username(signUpDto.getUsername())
                .hashPassword(passwordEncoder.encode(signUpDto.getPassword()))
                .role(Role.USER)
                .state(State.NOT_CONFIRMED)
                .confirmCode(UUID.randomUUID().toString())
                .build();
        userRepository.save(user);

        String message ="Hello, "+   user.getUsername() +"! \n" +
                        "Welcome to LifeTrack. Please, visit next link: " + "http://localhost:8080/activate?code=" +  user.getConfirmCode();

        MailMessage mailMessage = MailMessage.builder()
                .mailTo(user.getEmail())
                .subject("Activation")
                .text(message)
                .build();

        emailService.sendMail(mailMessage);

    }

    @Override
    public User signUpDiscord(SignUpDto signUpDto) {

        User user = User.builder()
                .email(signUpDto.getEmail())
                .username(signUpDto.getUsername())
                .hashPassword(UUID.randomUUID().toString())
                .role(Role.USER)
                .state(State.CONFIRMED)
                .build();

        userRepository.save(user);

        return userService.getUserByEmail(signUpDto.getEmail());

    }
}
