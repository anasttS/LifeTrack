package com.itis.app.service;

import com.itis.app.model.FileData;
import com.itis.app.repository.FileRepository;
import com.itis.app.util.FileStorage;
import lombok.SneakyThrows;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

@Service
public class FileStorageServiceImpl implements FileStorageService {

    @Autowired
    private FileRepository fileRepository;

    @Autowired
    private FileStorage fileStorage;

    @Override
    public FileData saveFile(MultipartFile file) {
        FileData fileData = fileStorage.convertFromMultipart(file);
        fileRepository.save(fileData);
        fileStorage.copyToStorage(file, fileData.getStorageFileName());
        return fileData;
    }

    @SneakyThrows
    @Override
    public void writeFileToResponse(String fileName, HttpServletResponse response) {
        FileData file = fileRepository.findOneByStorageFileName(fileName);
        response.setContentType(file.getType());
        InputStream inputStream = new FileInputStream(new File(file.getUrl()));
        IOUtils.copy(inputStream, response.getOutputStream());
        response.flushBuffer();
    }
}
