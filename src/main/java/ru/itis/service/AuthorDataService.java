package ru.itis.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.entity.Author;
import ru.itis.repository.AuthorRepository;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@AllArgsConstructor
@Slf4j
@Service
public class AuthorDataService {
    private final AuthorRepository authorRepository;

    @Transactional
    public void save(Author author) {
        authorRepository.save(author);
    }

    @Transactional
    public Author saveApi(Author author) {
        authorRepository.save(author);
        return authorRepository.findByName(author.getName());
    }

    @Transactional
    public void delete(Author author) {
        authorRepository.delete(author);
    }

    @Transactional
    public Author deleteById(Long id) {
        Author author = authorRepository.findById(id).orElse(null);
        authorRepository.deleteById(id);
        return author;
    }

    @Transactional
    public void deleteByName(String name) {
        authorRepository.deleteAuthorByName(name);
    }


    @Transactional
    public Author findById(Long id) {
        return authorRepository.findById(id).orElse(null);
    }

    @Transactional
    public Author findByName(String name) {
        return authorRepository.findByName(name);
    }

    @Transactional
    public Author findByInfo(String info) {
        return authorRepository.findByInfo(info);
    }

    @Transactional
    public Set<Author> findAll() {
        return StreamSupport.stream(authorRepository.findAll().spliterator(), false).collect(Collectors.toSet());
    }

    @Transactional
    public Set<Author> filterByStartCareer() {
        return new HashSet<>(authorRepository.filterByStartCareer());
    }

    @Transactional
    public Set<Author> filterByEndCareer() {
        return new HashSet<>(authorRepository.filterByEndCareer());
    }
}
