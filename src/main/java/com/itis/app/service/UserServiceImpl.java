package com.itis.app.service;

import com.itis.app.dto.UserDto;
import com.itis.app.model.Role;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
//@Scope(value = "custom", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

//    @Autowired
//    CustomBean customBean;


    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public List<UserDto> getAllUsers() {
        return UserDto.from(userRepository.findAll());
    }

    @Override
    public void delete(Long id) {
        //customBean.remove(user.getConfirmCode());
        Optional<User> user = userRepository.findUserById(id);
        if (user.isPresent()) {
            User user1 = user.get();
            userRepository.delete(user1);
        }
    }

    @Override
    public String getCodeFromUserByUserId(Long id) {
        Optional<User> user = userRepository.findUserById(id);
        String code = null;
        if (user.isPresent()) {
            User user1 = user.get();
            code = user1.getConfirmCode();
        }
        return code;
    }

    @Override
    public void changeRole(Long id) {
        Optional<User> user = userRepository.findUserById(id);
        if (user.isPresent()) {
            User user1 = user.get();
            if (user1.getRole().toString().equals("ADMIN")){
                user1.setRole(Role.USER);
            } else {
                user1.setRole(Role.ADMIN);
            }
            userRepository.save(user1);
        }
    }
}
