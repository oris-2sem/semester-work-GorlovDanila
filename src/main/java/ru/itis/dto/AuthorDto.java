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
@Schema(description = "Автор")
public class AuthorDto {

    @Schema(description = "Изображение автора", example = "/example.jpg")
    private String linkToImage;
    @Schema(description = "Имя автора", example = "Ivan")
    private String name;
    @Schema(description = "Информация об авторе", example = "He was born in ...")
    private String info;
    @Schema(description = "Работы автора, представленные на сайте", example = "First title, Second title")
    private List<String> anims;
}
