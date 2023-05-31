package ru.itis.mapper.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ru.itis.dto.AuthorsPageDto;
import ru.itis.entity.Author;
import ru.itis.mapper.AuthorMapper;
import ru.itis.mapper.AuthorPageMapper;

import java.util.Set;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Component
public class AuthorPageMapperImpl implements AuthorPageMapper {

    private final AuthorMapper authorMapper;

    @Override
    public AuthorsPageDto toDto(Set<Author> authors) {
        return AuthorsPageDto
                .builder()
                .authorDtoList(
                        authors
                                .stream()
                                .map(authorMapper::toDto)
                                .toList()
                ).build();
    }

    @Override
    public Set<Author> toModel(AuthorsPageDto authorsPageDto) {
        return authorsPageDto
                .getAuthorDtoList()
                .stream()
                .map(authorMapper::toModel)
                .collect(Collectors.toSet());
    }
}
