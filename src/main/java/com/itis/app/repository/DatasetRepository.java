package com.itis.app.repository;

import com.itis.app.model.Dataset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DatasetRepository extends JpaRepository<Dataset, Integer> {
    ArrayList<Dataset> getAllByIduAndYear(Long idu, String year);
    ArrayList<Dataset> findAllByIdu(Long id);
}
