package com.itis.app.service;

import com.itis.app.dto.UpdateDto;
import com.itis.app.dto.UserDto;
import com.itis.app.model.User;

public interface UpdateProfileService {
//     void changeChart(User form, Long id);
    void updateProfile(UpdateDto form, Long id);
}
