package ru.itis.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.entity.Genre;
import ru.itis.repository.GenreRepository;

import java.util.Set;

@AllArgsConstructor
@Service
public class GenreDataService {

    private GenreRepository genreRepository;

    @Transactional
    public void save(Genre genre) {
        genreRepository.save(genre);
    }

    @Transactional
    public void delete(Long genreId) {
        genreRepository.deleteById(genreId);
    }

    @Transactional
    public Genre findByName(String name) {
        try {
            return genreRepository.findByName(name);
        } catch (Exception e) {
            return null;
        }
    }

    @Transactional
    public Set<Genre> findAll() {
        return genreRepository.getAllGenres();
    }
}
