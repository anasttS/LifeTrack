package com.itis.app.service;

import com.itis.app.dto.UserDto;
import com.itis.app.model.User;

import java.util.List;

public interface UserService {
    void save(User user);
    List<UserDto> getAllUsers();
    void delete(Long id);
    String getCodeFromUserByUserId(Long id);
    void changeRole(Long id);
}
