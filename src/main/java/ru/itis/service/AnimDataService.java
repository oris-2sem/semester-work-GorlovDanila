package ru.itis.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.entity.Anim;
import ru.itis.entity.Author;
import ru.itis.entity.Genre;
import ru.itis.repository.AnimRepository;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@AllArgsConstructor
@Service
public class AnimDataService {

    private final AnimRepository animRepository;

    @Transactional
    public void save(Anim anim) {
        animRepository.save(anim);
    }

    @Transactional
    public void delete(Anim anim) {
        animRepository.delete(anim);
    }

    @Transactional
    public void deleteByTitle(String title) {
        animRepository.deleteAnimByTitle(title);
    }

    public Anim findById(Long id) {
        return animRepository.findById(id).orElse(null);
    }

    public Anim findByTitle(String title) {
        return animRepository.findByTitle(title);
    }

    public List<String> findByAuthor(String authorName) {
        return animRepository.findByAuthorName(authorName);
    }

    public List<String> findByGenre(String genreTitle) {
        return animRepository.findByGenreTitle(genreTitle);
    }

    public Set<Anim> findAll() {
        return StreamSupport.stream(animRepository.findAll().spliterator(), false).collect(Collectors.toSet());
    }

    public Set<Long> getAllYears() {
        return findAll().stream().map(Anim::getYear).collect(Collectors.toSet());
    }

    public Set<String> getAllTypes() {
        return findAll().stream().map(Anim::getType).collect(Collectors.toSet());
    }

    public Set<String> getAllStatuses() {
        return findAll().stream().map(Anim::getStatus).collect(Collectors.toSet());
    }

    public List<Anim> conditionAnimeList(String parameter, String type, List<Anim> animeListTemplate) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        List<Anim> result = new ArrayList<>();
        List<String> parameters;
        String myParameter = Arrays.stream(parameter.split("\r")).toList().get(0);
        Class<?> animEntityClass = Class.forName("ru.itis.entity.Anim");
        String nameMethod = "get" + type;
        Method method = animEntityClass.getDeclaredMethod(nameMethod);

        for (int i = 0; i < animeListTemplate.size() || i == 0; i++) {
            switch (type) {
                case "Genres":
                    parameters = ((Set<Genre>) method.invoke(animeListTemplate.get(i))).stream().map(Genre::getName).toList();
                    for (int j = 0; j < parameters.size() || j == 0; j++) {
                        if (myParameter.equals(parameters.get(j))) {
                            result.add(animeListTemplate.get(i));
                        }
                    }
                    break;
                case "AuthorId":
                    Author current = (Author) method.invoke(animeListTemplate.get(i));
                    if (current.getName().equals(myParameter)) {
                        result.add(animeListTemplate.get(i));
                    }
                    break;
                case "Year":
                    Long year = (Long) method.invoke(animeListTemplate.get(i));
                    if (String.valueOf(year).equals(myParameter))
                        result.add(animeListTemplate.get(i));
                    break;
                default:
                    if (method.invoke(animeListTemplate.get(i)).equals(myParameter)) {
                        result.add(animeListTemplate.get(i));
                    }
                    break;
            }
        }
        return result;
    }
}
