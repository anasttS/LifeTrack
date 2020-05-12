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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "photo")
    private FileData photo;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "video")
    private FileData  video;

    private String date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

}