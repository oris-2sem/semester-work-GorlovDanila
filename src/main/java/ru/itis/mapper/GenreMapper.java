package ru.itis.mapper;

import org.mapstruct.Mapper;
import ru.itis.dto.GenreDto;
import ru.itis.entity.Genre;

@Mapper(componentModel = "spring")
public interface GenreMapper {

    GenreDto toDto(Genre genre);

    Genre toModel(GenreDto genreDto);
}
