package com.itis.app.service;

import com.itis.app.dto.NoteDto;
import com.itis.app.model.Note;

import java.util.ArrayList;

public interface NoteService {
    void addNote(NoteDto form, Long id);
    ArrayList<Note> getNotesByUser_id(Long id);
    ArrayList<Note> getNotesByUser_idMonthAgo(Long id);
    ArrayList<Note> getNotesByUser_idYearAgo(Long id);
}
