package com.itis.app.repository;

import com.itis.app.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;

public interface NoteRepository extends JpaRepository<Note, Integer> {
    ArrayList<Note> findAllByIduOrderByDate(Long id);
}