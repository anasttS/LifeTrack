package com.itis.app.service;

import com.itis.app.dto.UpdateDto;
import com.itis.app.model.FileData;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import com.itis.app.scope.SessionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Service
public class UpdateProfileServiceImpl implements UpdateProfileService {

    @Autowired
    SessionBean sessionBean;

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateProfile(UpdateDto form, Long id) {
        Optional<User> userToUpdate = userRepository.findUserById(id);
        MultipartFile file = form.getImg();
        FileData fileForUpdate;
        if (userToUpdate.isPresent()) {
            User user = userToUpdate.get();
            if (file != null){
                fileForUpdate =  fileStorageService.saveFile(form.getImg());
            } else {
                fileForUpdate = user.getImg();
            }
            user.setUsername(form.getUsername());
            user.setEmail(form.getEmail());
            user.setImg(fileForUpdate);

            userRepository.save(user);
            sessionBean.setUser(user);
        }

    }
}


