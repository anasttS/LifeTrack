package com.itis.app.repository;

import com.itis.app.model.FileData;
import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public interface FileRepository extends JpaRepository<FileData, Long> {
    FileData findOneByStorageFileName(String storageFileName);
    FileData findOneById(Long id);
}
