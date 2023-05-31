package ru.itis.repository;

import lombok.NonNull;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entity.Author;

import java.util.List;

@Repository
public interface AuthorRepository extends CrudRepository<Author, Long> {
    Author findByName(String name);

    Author findByInfo(String info);

    void deleteAuthorByName(String name);

    void deleteById(@NonNull Long id);

    @Query(value = "SELECT a.id, a.link_to_image, a.name, a.info FROM authors a ORDER BY (SELECT MIN(an.year) FROM animes an WHERE an.author_id= a.id)", nativeQuery = true)
    List<Author> filterByStartCareer();

    @Query(value = "SELECT a.id, a.link_to_image, a.name, a.info FROM authors a ORDER BY (SELECT MIN(an.year) FROM animes an WHERE an.author_id= a.id) DESC", nativeQuery = true)
    List<Author> filterByEndCareer();
}