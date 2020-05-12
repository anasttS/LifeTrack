package com.itis.app.repository;

import com.itis.app.model.Note;
import com.itis.app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public interface NoteRepository extends JpaRepository<Note, Integer> {
    ArrayList<Note> findAllByUserOrderByDate(User user);
    ArrayList<Note> findByUserAndDateContains(User user, String date);

}