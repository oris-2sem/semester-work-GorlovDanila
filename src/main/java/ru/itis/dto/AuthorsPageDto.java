package ru.itis.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Schema(description = "Страница с авторами")
public class AuthorsPageDto {

    @Schema(description = "Список авторов")
    private List<AuthorDto> authorDtoList;

}
