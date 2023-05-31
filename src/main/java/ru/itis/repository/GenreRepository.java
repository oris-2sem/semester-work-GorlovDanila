package ru.itis.repository;

import ru.itis.entity.Genre;

import java.util.Set;

public interface GenreRepository {
    Set<Genre> getAllGenres();

    Genre findByName(String name);

    void deleteById(Long id);

    void save(Genre genre);
}
