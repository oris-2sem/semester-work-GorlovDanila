package ru.itis.mapper.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ru.itis.dto.GenresPageDto;
import ru.itis.entity.Genre;
import ru.itis.mapper.GenreMapper;
import ru.itis.mapper.GenrePageMapper;

import java.util.Set;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Component
public class GenresPageMapperImpl implements GenrePageMapper {

    private final GenreMapper genreMapper;

    @Override
    public GenresPageDto toDto(Set<Genre> genres) {
        return GenresPageDto.builder()
                .genreDtoList(
                        genres
                                .stream()
                                .map(genreMapper::toDto)
                                .toList()
                ).build();
    }

    @Override
    public Set<Genre> toModel(GenresPageDto genresPageDto) {
        return genresPageDto
                .getGenreDtoList()
                .stream()
                .map(genreMapper::toModel)
                .collect(Collectors.toSet());
    }
}
