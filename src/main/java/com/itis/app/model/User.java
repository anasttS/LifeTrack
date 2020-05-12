package com.itis.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    @Column(unique = true)
    private String email;

    private String hashPassword;
    private LocalDate birthday;

    @OneToOne
    @JoinColumn(name = "img")
    private FileData img;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Enumerated(EnumType.STRING)
    private State state;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Note> notes;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Event> events;

    @OneToOne
    @JoinColumn(name = "dataset")
    private Dataset dataset;

    private  String confirmCode;
}