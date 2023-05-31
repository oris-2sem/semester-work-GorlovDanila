package ru.itis.mapper.impl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import ru.itis.dto.AuthorDto;
import ru.itis.entity.Author;
import ru.itis.mapper.AuthorMapper;
import ru.itis.service.AnimDataService;
import ru.itis.service.AuthorDataService;

@Component
@AllArgsConstructor
public class AuthorMapperImpl implements AuthorMapper {

    private AnimDataService animDataService;
    private AuthorDataService authorDataService;

    @Override
    public AuthorDto toDto(Author author) {
        return AuthorDto.builder()
                .linkToImage(author.getLinkToImage())
                .name(author.getName())
                .info(author.getInfo())
                .anims(animDataService.findByAuthor(author.getName()))
                .build();
    }

    @Override
    public Author toModel(AuthorDto authorDto) {
        return Author.builder()
                .id(authorDataService.findByName(authorDto.getName()).getId())
                .linkToImage(authorDto.getLinkToImage())
                .name(authorDto.getName())
                .info(authorDto.getInfo())
                .build();
    }
}
