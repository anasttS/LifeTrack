package com.itis.app.repository;

import com.itis.app.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;


@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {
    ArrayList<Event> findAllByIduOrderByDate(Long id_user); // события пользователя, отсортированные по дате
    Event findEventByIde(Long ide);
}
