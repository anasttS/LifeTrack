package com.itis.app.repository;

import com.itis.app.model.FileData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepository extends JpaRepository<FileData, Long> {
    FileData findOneByStorageFileName(String storageFileName);
    FileData findOneById(Long id);
}
