package com.itis.app.service;

import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Service
public class ConfirmServiceImpl implements ConfirmService {

    @Autowired
    UserRepository userRepository;

    @Override
    public boolean activateUser(String code) {
        Optional<User> user = userRepository.findByConfirmCode(code);

        if (!user.isPresent()) {
            return false;
        }
        User user1 = user.get();
        user1.setState(State.CONFIRMED);
        userRepository.save(user1);
        return true;
    }

}

