package com.itis.app.repository;

import com.itis.app.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public interface NoteRepository extends JpaRepository<Note, Integer> {
    ArrayList<Note> findAllByIduOrderByDate(Long id);

//    @Query(value = "SELECT n from note n where n.date like :date")
    ArrayList<Note> findByIduAndDateContains(Long id, String date);


//    Integer countAllByDateIsContaining(String date);
}