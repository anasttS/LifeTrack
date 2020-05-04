package com.itis.app.service;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.MailMessage;
import com.itis.app.model.Role;
import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailService emailService;


    @Override
    public void signUp(SignUpDto signUpDto) {
        User user = User.builder()
                .email(signUpDto.getEmail())
                .username(signUpDto.getUsername())
                .hashPassword(passwordEncoder.encode(signUpDto.getPassword()))
                .role(Role.USER)
                .state(State.NOT_CONFIRMED)
                .birthday(signUpDto.getBirthday())
                .confirmCode(UUID.randomUUID().toString())
                .build();
        userRepository.save(user);

        String message ="Hello, "+   user.getUsername() +"! \n" +
                        "Welcome to LifeTrack. Please, visit next link: " + "http://localhost:8080/activate?code=" +  user.getConfirmCode();



//        System.out.println(message);

        MailMessage mailMessage = MailMessage.builder()
                .mailTo(user.getEmail())
                .subject("Activation")
                .text(message)
                .build();
        emailService.sendMail(mailMessage);

    }
}
