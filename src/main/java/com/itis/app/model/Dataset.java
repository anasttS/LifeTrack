package com.itis.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Dataset {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String month;
    private String year;
    private float percent;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
}
