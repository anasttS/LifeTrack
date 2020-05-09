package com.itis.app.util;


import com.itis.app.model.FileData;
import lombok.SneakyThrows;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Component
public class FileStorage {

    @Value("${storage.path}")
    private String storagePath;

    public String getStoragePath(){
        return storagePath;
    }

    @SneakyThrows
    public void copyToStorage(MultipartFile file, String storageFileName){
        Files.copy(file.getInputStream(), Paths.get(storagePath, storageFileName));
    }

    public FileData convertFromMultipart(MultipartFile file){
        String originalFileName = file.getOriginalFilename();
        String type = file.getContentType();
        long size = file.getSize();
        String storageName = createStorageName(originalFileName);
        String fileUrl = getUrlOfFile(storageName);
        return FileData.builder()
                .originalFileName(originalFileName)
                .storageFileName(storageName)
                .url(fileUrl)
                .size(size)
                .type(type)
                .build();
    }

    private String getUrlOfFile(String storageFileName){
        return storagePath + "/" + storageFileName;
    }

    private String createStorageName(String originalFileName){
        String extension = FilenameUtils.getExtension(originalFileName);
        String newFileName = UUID.randomUUID().toString();
        return newFileName + "." + extension;
    }

}