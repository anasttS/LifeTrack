package com.itis.app.service;

import com.itis.app.dto.UpdateDto;
import com.itis.app.model.User;

public interface UpdateInfoService {
    User updateInfo(UpdateDto updateDto);
}
