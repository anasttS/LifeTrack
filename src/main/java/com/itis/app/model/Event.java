package com.itis.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ide;

    private String name;
    private String description;
    private Date date;
    private LocalTime time;

//    // у одного пользователя много событий
//    @ManyToOne(fetch = FetchType.EAGER)
    private Long idu;

}