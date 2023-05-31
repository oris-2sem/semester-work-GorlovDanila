package ru.itis.repository.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.entity.Genre;
import ru.itis.repository.GenreRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.HashSet;
import java.util.Set;

@Repository
public class GenreRepositoryImpl implements GenreRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public Set<Genre> getAllGenres() {
        return new HashSet<>(entityManager.createQuery("SELECT g FROM Genre g", Genre.class)
                .getResultList());
    }

    @Override
    @Transactional
    public Genre findByName(String name) {
        return (Genre) entityManager.createQuery("SELECT g FROM Genre g WHERE g.name = ?1")
                .setParameter(1, name)
                .getSingleResult();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        entityManager.createQuery("DELETE FROM Genre WHERE id = ?1")
                .setParameter(1, id)
                .executeUpdate();
    }

    @Override
    @Transactional
    public void save(Genre genre) {
        entityManager.persist(genre);
    }
}
