package ru.itis.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.itis.entity.Anim;

import java.util.List;

@Repository
public interface AnimRepository extends CrudRepository<Anim, Long> {
    void deleteAnimByTitle(String title);

    Anim findByTitle(String title);

    @Query(value = "SELECT a.title FROM animes a WHERE author_id = (SELECT a.id FROM authors a WHERE a.name = :name)", nativeQuery = true)
    List<String> findByAuthorName(String name);

    @Query(value = "SELECT a.title FROM animes a JOIN anim_genre a_g ON a.id = a_g.anim_id JOIN genres g ON a_g.genre_id = g.id WHERE g.name = :title", nativeQuery = true)
    List<String> findByGenreTitle(String title);
}
