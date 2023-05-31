package ru.itis.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.entity.Character;
import ru.itis.repository.CharactersRepository;

import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@RequiredArgsConstructor
@Service
public class CharacterDataService {

    private final CharactersRepository charactersRepository;

    @Transactional
    public Set<Character> findAll() {
        return StreamSupport.stream(charactersRepository.findAll().spliterator(), false).collect(Collectors.toSet());
    }
}
