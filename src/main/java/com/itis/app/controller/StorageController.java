package com.itis.app.controller;

import com.itis.app.service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletResponse;

@Controller
public class StorageController {

    @Autowired
    private FileStorageService service;

    @GetMapping("/storage")
    public String getStoragePage(){
        return "uploadFile";
    }

    @GetMapping("/files/{file-name:.+}")
    public void getFile(@PathVariable("file-name") String fileName,
                        HttpServletResponse response) {
        service.writeFileToResponse(fileName, response);
    }

}
