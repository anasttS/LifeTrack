package com.itis.app.dto;

import com.itis.app.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
    private String date;
    private User user;


}