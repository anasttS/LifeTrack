package com.itis.app.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_note;

    private String name;
    private String text;
    @OneToOne
    @JoinColumn(name = "photo")
    private FileData photo;
    @OneToOne
    @JoinColumn(name = "video")
    private FileData  video;

    private String date;
//    // у одного пользователя много записей
//    @ManyToOne(fetch = FetchType.EAGER)
    private Long idu;


}