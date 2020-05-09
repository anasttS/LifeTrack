package com.itis.app.repository;


import com.itis.app.model.FileData;
import com.itis.app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findUserByEmail(String email);
    Optional<User> findByConfirmCode(String confirmCode);
    Optional<User> findUserById(Long id);

//    @Modifying
//    @Query("update User u set u.username = :username, u.img = :img, u.email = :email where u.id = :id")
//    int updateUser(@Param("username") String username, @Param("img") FileData img,
//                   @Param("email") String email, @Param("id") Long id);
}
