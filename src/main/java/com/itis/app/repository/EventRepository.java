package com.itis.app.repository;

import com.itis.app.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {
    ArrayList<Event> findAllByIdu(Long id_user); // события пользователя, отсортированные по дате

}
