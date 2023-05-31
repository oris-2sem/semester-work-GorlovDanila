package ru.itis.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entity.Character;

@Repository
public interface CharactersRepository extends CrudRepository<Character, Long> {
}
