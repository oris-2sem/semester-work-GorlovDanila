package ru.itis.mapper.impl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import ru.itis.dto.GenreDto;
import ru.itis.entity.Genre;
import ru.itis.mapper.GenreMapper;
import ru.itis.service.AnimDataService;
import ru.itis.service.GenreDataService;

@Component
@AllArgsConstructor
public class GenreMapperImpl implements GenreMapper {

    private AnimDataService animDataService;
    private GenreDataService genreDataService;

    @Override
    public GenreDto toDto(Genre genre) {
        return GenreDto.builder()
                .title(genre.getName())
                .info(genre.getInfo())
                .anims(animDataService.findByGenre(genre.getName()))
                .build();
    }

    @Override
    public Genre toModel(GenreDto genreDto) {
        return Genre.builder()
                .id(genreDataService.findByName(genreDto.getTitle()).getId())
                .name(genreDto.getTitle())
                .info(genreDto.getInfo())
                .build();
    }
}
