package ru.itis.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByLogin(String username);
}
