package ru.itis.controller.api;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.dto.AuthorDto;
import ru.itis.dto.AuthorsPageDto;

@Tags(value = {
        @Tag(name = "Authors")
})
public interface AuthorsApi {

    @Operation(summary = "Получение множества авторов")
    @ApiResponse(responseCode = "200", description = "Страница с авторами",
            content = {
                    @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorsPageDto.class))
            })
    @GetMapping("/get")
    ResponseEntity<AuthorsPageDto> getAuthors(Model model);

    @Operation(summary = "Создание автора")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Автор создан",
                    content = {
                            @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorDto.class))
                    }),
            @ApiResponse(responseCode = "400", description = "Автор с таким именем уже существует")
    })
    @PostMapping("/post")
    ResponseEntity<AuthorDto> addAuthor(@RequestParam("name") String name,
                                        @RequestParam("info") String info);

    @Operation(summary = "Фильтр авторов по году выпуска их первого аниме")
    @ApiResponse(responseCode = "200", description = "Авторы отсортированы",
            content = {
                    @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorsPageDto.class))
            })
    @GetMapping("/get/filter-by-start-career")
    ResponseEntity<AuthorsPageDto> filterByStartCareer();

    @Operation(summary = "Фильтр авторов по году выпуска их последнего аниме")
    @ApiResponse(responseCode = "200", description = "Авторы отсортированы",
            content = {
                    @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorsPageDto.class))
            })
    @GetMapping("/get/filter-by-end-career")
    ResponseEntity<AuthorsPageDto> filterByEndCareer();

    @Operation(summary = "Изменение автора")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Автор изменён",
                    content = {
                            @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorDto.class))
                    }),
            @ApiResponse(responseCode = "203", description = "Параметры для изменения не были предоставлены"),
            @ApiResponse(responseCode = "400", description = "Автора с таким идентификатором не существует")
    })
    @PatchMapping("/patch")
    ResponseEntity<AuthorDto> deleteAuthor(@RequestParam("id") Long id,
                                           @RequestParam(value = "name", required = false) String name,
                                           @RequestParam(value = "info", required = false) String info);

    @Operation(summary = "Удаление автора")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Автор удалён",
                    content = {
                            @Content(mediaType = "application/json", schema = @Schema(implementation = AuthorDto.class))
                    }),
            @ApiResponse(responseCode = "400", description = "Автор с таким идентификатором не существует")
    })
    @DeleteMapping("/delete")
    ResponseEntity<AuthorDto> deleteAuthor(@RequestParam("id") Long id);
}
