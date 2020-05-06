package com.itis.app.service;

import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
//@Scope(value = "custom", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ConfirmServiceImpl implements ConfirmService {

    @Autowired
    UserRepository userRepository;

//    @Autowired
//    CustomBean customBean;

    @Override

    public boolean activateUser(String code) {
       // customBean.activate(code);
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

