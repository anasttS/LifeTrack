package com.itis.app.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

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
    private String photo;
    private String video;
    private LocalDate date;

//    // у одного пользователя много записей
//    @ManyToOne(fetch = FetchType.EAGER)
    private Long user_id;

}