package com.itis.app.service;

import com.itis.app.dto.NoteDto;
import com.itis.app.model.Note;
import com.itis.app.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Date;


@Service
public class NoteServiceImpl implements NoteService {


    @Autowired
    private FileStorageService fileStorageService;


    @Autowired
    private NoteRepository noteRepository;


    @Override
    public void addNote(NoteDto form, Long id) {
        Date utilDate = new Date();
        Note note = Note.builder()
                .name(form.getName())
                .text(form.getText())
                .photo(fileStorageService.saveFile(form.getPhoto()))
                .video(fileStorageService.saveFile(form.getVideo()))
                .date(new java.sql.Date(utilDate.getTime()))
                .idu(id)
                .build();
        noteRepository.save(note);
    }


    @Override
    public ArrayList<Note> getNotesByUser_id(Long id) {
        return noteRepository.findAllByIduOrderByDate(id);
    }

}
