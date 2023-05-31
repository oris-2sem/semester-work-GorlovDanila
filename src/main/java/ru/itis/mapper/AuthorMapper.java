package ru.itis.mapper;

import org.mapstruct.Mapper;
import ru.itis.dto.AuthorDto;
import ru.itis.entity.Author;

@Mapper(componentModel = "spring")
public interface AuthorMapper {
    AuthorDto toDto(Author author);

    Author toModel(AuthorDto authorDto);
}
