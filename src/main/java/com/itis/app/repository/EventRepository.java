package com.itis.app.repository;

import com.itis.app.model.Event;
import com.itis.app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;


@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {
    ArrayList<Event> findAllByUserOrderByDate(User user);
    Event findEventByIde(Long ide);
}
