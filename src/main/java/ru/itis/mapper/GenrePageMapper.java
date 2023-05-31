package ru.itis.mapper;

import org.mapstruct.Mapper;
import ru.itis.dto.GenresPageDto;
import ru.itis.entity.Genre;

import java.util.Set;

@Mapper(componentModel = "spring", uses = GenreMapper.class)
public interface GenrePageMapper {
    GenresPageDto toDto(Set<Genre> genres);
    Set<Genre> toModel(GenresPageDto genresPageDto);
}
