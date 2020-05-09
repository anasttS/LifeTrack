package com.itis.app.service;

import com.itis.app.dto.UpdateDto;

public interface UpdateProfileService {

    void updateProfile(UpdateDto form, Long id);
}
