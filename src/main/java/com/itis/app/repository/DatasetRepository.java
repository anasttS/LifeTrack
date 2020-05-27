package com.itis.app.repository;

import com.itis.app.model.Dataset;
import com.itis.app.model.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DatasetRepository extends JpaRepository<Dataset, Integer> {
    ArrayList<Dataset> getAllByUserAndYear(User user, String year);
    ArrayList<Dataset> findAllByUser(User user);
}
