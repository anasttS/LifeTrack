package com.itis.app.service;

import com.itis.app.dto.EventDto;
import com.itis.app.model.Event;
import com.itis.app.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class EventsServiceImpl implements EventsService {

    @Autowired
    EventRepository eventRepository;

    @Override
    public void addEvent(EventDto form, Long id_user) {
        Event event = Event.builder()
                .name(form.getName())
                .description(form.getDescription())
                .date(form.getDate())
                .time(form.getTime())
                .idu(id_user)
                .build();
        eventRepository.save(event);
    }

    @Override
    public void changeEvent(EventDto form, Long id_event) {

    }

    @Override
    public void deleteEvent(Long id_event) {

    }

    @Override
    public ArrayList<Event> getEventsByUser_id(Long id) {
        return eventRepository.findAllByIdu(id);
    }
}
