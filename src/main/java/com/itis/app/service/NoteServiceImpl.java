package com.itis.app.service;

import com.itis.app.dto.NoteDto;
import com.itis.app.model.Note;
import com.itis.app.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
        Note note = Note.builder()
                .name(form.getName())
                .text(form.getText())
                .photo(fileStorageService.saveFile(form.getPhoto()))
                .video(fileStorageService.saveFile(form.getVideo()))
                .date(LocalDate.now().toString())
                .idu(id)
                .build();
        noteRepository.save(note);
    }


    @Override
    public ArrayList<Note> getNotesByUser_id(Long id) {
        return noteRepository.findAllByIduOrderByDate(id);
    }

    @Override
    public ArrayList<Note> getNotesByUser_idMonthAgo(Long id) {
        Date dateNow = new Date();
        SimpleDateFormat formatForDays = new SimpleDateFormat("dd");
        SimpleDateFormat formatForDateNow = new SimpleDateFormat("MM");
        SimpleDateFormat formatForYear = new SimpleDateFormat("yyyy");
        String month = formatForDateNow.format(dateNow);
        String year = formatForYear.format(dateNow);
        String day = formatForDays.format(dateNow);
        int monthPred;
        int yearPred;
        int currentYear;
        String date;

        if (month.contains("0")) {
            month = month.substring(1);
        }

        if (month.equals("1")) {
            monthPred = 12;
            yearPred = (Integer.parseInt(year) - 1);
            date = yearPred + "-" + monthPred + "-" + day;
        } else {
            monthPred = Integer.parseInt(month) - 1;
            currentYear = Integer.parseInt(year);
            if (monthPred < 10) {
                date = currentYear + "-0" + monthPred + "-" + day;
            } else {
                date = currentYear + "-" + monthPred+ "-" + day;
            }
        }

        return noteRepository.findByIduAndDateContains(id, date);
    }

    @Override
    public ArrayList<Note> getNotesByUser_idYearAgo(Long id) {
        Date dateNow = new Date();
        SimpleDateFormat formatForDays = new SimpleDateFormat("dd");
        SimpleDateFormat formatForDateNow = new SimpleDateFormat("MM");
        SimpleDateFormat formatForYear = new SimpleDateFormat("yyyy");
        String month = formatForDateNow.format(dateNow);
        String year = formatForYear.format(dateNow);
        String day = formatForDays.format(dateNow);

        int yearPred;
        String date;

        yearPred = (Integer.parseInt(year) - 1);
        date = yearPred + "-" + month + "-" + day;

        return noteRepository.findByIduAndDateContains(id, date);
    }

}
