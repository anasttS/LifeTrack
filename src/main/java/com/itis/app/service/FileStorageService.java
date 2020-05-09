package com.itis.app.service;

import com.itis.app.model.FileData;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

public interface FileStorageService {
    FileData saveFile(MultipartFile file);
    void writeFileToResponse(String fileName, HttpServletResponse response);
}
