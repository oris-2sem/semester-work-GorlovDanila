package ru.itis.mapper;

import org.mapstruct.Mapper;
import ru.itis.dto.AuthorsPageDto;
import ru.itis.entity.Author;

import java.util.Set;

@Mapper(componentModel = "spring", uses = AuthorMapper.class)
public interface AuthorPageMapper {
    AuthorsPageDto toDto(Set<Author> authors);
    Set<Author> toModel(AuthorsPageDto authorsPageDto);
}
