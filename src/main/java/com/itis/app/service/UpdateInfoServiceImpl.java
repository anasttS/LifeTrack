package com.itis.app.service;

import com.itis.app.dto.UpdateDto;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UpdateInfoServiceImpl implements UpdateInfoService {

    @Autowired
    UserRepository userRepository;

    @Override
    public User updateInfo(UpdateDto form) {
        User user = User.builder()
                .username(form.getUsername())
                .email(form.getEmail())
                .birthday(form.getBirthday())
                .build();

        userRepository.save(user);
        return user;
    }
}
