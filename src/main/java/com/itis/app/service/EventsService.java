package com.itis.app.service;

import com.itis.app.dto.EventDto;
import com.itis.app.model.Event;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface EventsService {
    void addEvent(EventDto eventDto, Long id);
    void changeEvent(EventDto eventDto, Long id);
    void deleteEvent(Long id);
    ArrayList<Event> getEventsByUser_id(Long id);

}
