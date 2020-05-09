package com.itis.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoteDto {

    private Long id_note;
    private String name;
    private String text;
    private MultipartFile photo;
    private MultipartFile  video;
    private Date date;
    private Long idu;


}