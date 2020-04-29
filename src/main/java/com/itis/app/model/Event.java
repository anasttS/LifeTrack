package com.itis.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_event;

    private String name;
    private String description;
    private String password;
    private LocalDateTime date;

//    // у одного пользователя много событий
//    @ManyToOne(fetch = FetchType.EAGER)
//    private Integer id_user;

}