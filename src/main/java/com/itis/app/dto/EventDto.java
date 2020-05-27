package com.itis.app.dto;


import com.itis.app.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EventDto {
    private Long ide;
    private String name;
    private String description;
    private Date date;
    private LocalTime time;
    private User user;
}