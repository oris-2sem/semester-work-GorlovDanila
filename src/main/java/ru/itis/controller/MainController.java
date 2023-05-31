package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.entity.Anim;
import ru.itis.service.AnimDataService;
import ru.itis.service.AuthorDataService;
import ru.itis.service.GenreDataService;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping(value = "/")
public class MainController {
    private final AnimDataService animDataService;
    private final GenreDataService genreDataService;
    private final AuthorDataService authorDataService;

    @GetMapping
    public String view(Model model, HttpServletRequest req) {
//        genreDataService.save(new Genre(null, "Фэнтези", "Фэнтези — занимает особую нишу в области анимационного творчества. Данный жанр привлекает зрителей своими оригинальными сюжетами и яркими персонажами. "));
//        genreDataService.save(new Genre(null, "Приключения", "Приключения — в аниме являются очень востребованным жанром, ведь они рассказывают публике невероятно интересные и захватывающие истории. Главные герои картин данного стиля живут в поразительной атмосфере бесконечных происшествий и испытаний."));
//        genreDataService.save(new Genre(null, "Сверхъестественное", "Сверхъестественное — основной акцент делается на сверхъестественных и необъяснимых явлениях. Непременные персонажи этого жанра - вампиры, призраки, духи, демоны."));
//        genreDataService.save(new Genre(null, "Ужасы", "Ужасы — с первых секунд вызывает у зрителей дикий поток острых ощущений, невероятного напряжения и бушующего адреналина. Зачастую совершенно невозможно предугадать, куда заведёт сюжетная линия."));
//        genreDataService.save(new Genre(null, "Комедия", "Комедия — в этом жанре основной упор делается на юмор. Он предназначен для легкого восприятия, где зрители могут отдохнуть от обыденной рутины и насладиться смешными и забавными сценами."));
//        genreDataService.save(new Genre(null, "Экшен", "Экшен - этому жанру свойственна динамичность и быстрое развитие событий. Чаще всего, вы будете свидетелями захватывающих сражений и боевых сцен. Сюжет построен на сильном эмоциональном напряжении, ему характерен накал страстей и резкие спады."));
//        genreDataService.save(new Genre(null, "Фантастика", "-"));
//        genreDataService.save(new Genre(null, "Супер сила", "-"));
//        genreDataService.save(new Genre(null, "Шпионская фантастика", "-"));
//        genreDataService.save(new Genre(null, "Сёнэн", "-"));
//        genreDataService.save(new Genre(null, "Спорт", "-"));
//        genreDataService.save(new Genre(null, "Драма", "-"));
//        genreDataService.save(new Genre(null, "Психология", "-"));
//
//        authorDataService.save(new Author(null, "Мунэюки Канэсиро", "Мунэюки Канэсиро - японский художник манги. Он дебютировал в 2011 году в фильме \"По воле богов\", который был экранизирован. В 2018 году он выпустил \"Синий замок\" с Юсуке Номурой, который получил 45-ю премию \"Коданша Манга\" в категории \"сенэн\"."));
//        authorDataService.save(new Author(null, "Тацуя Эндо", "Тацуя Эндо - японский художник манги. Эндо наиболее известен по созданию манги Tista, Gekka Bijin и Spy × Family, а также других работ. Последняя работа в журнале Shonen Jump+ достигла рубежа в 10 миллионов физических и цифровых копий."));
//        authorDataService.save(new Author(null, "CD Projekt Red", "CD Projekt RED — компания-разработчик компьютерных игр, расположенная в Польше. Является дочерним предприятием компании CD Projekt."));
//        authorDataService.save(new Author(null, "One", "One - псевдоним японского мангаки, ставшего известным из-за перерисованной версии своей веб-манги «Ванпанчмен». ONE публикует  «Моб Психо 100» в онлайн-версии Weekly Shonen Sunday."));
//        authorDataService.save(new Author(null, "Тайте Кубо", "Тайте Кубо - японский мангака. Он наиболее известен своей мангой «Блич». Часто встречаются ошибочные варианты написания его псевдонима, например: Титэ Кубо, Кубо Тайт, Куботайт, Куботайто, Куботитэ."));
//        authorDataService.save(new Author(null, "Тацуки Фудзимото", "Тацуки Фудзимото - японский мангака, наиболее известный своими работами Fire Punch и «Человек-бензопила». Окончил среднюю школу Никахо префектуры Акита и университет искусств и дизайна Тохоку, учился на факультете изящных искусств."));
////        authorDataService.save(new Author(null, "", "", null));
//        authorDataService.save(new Author(null, "", "", null));
//        authorDataService.save(new Author(null, "", "", null));
//        animDataService.save(new Anim(null, "Синяя тюрьма", authorDataService.findById(1L), "/resources/videos/blue_lock.mp4", "/resources/images/blue_prison.jpg", "2022", "ТВ Сериал", "Онгоинг", Set.of(genreDataService.findById(18L), genreDataService.findById(19L), genreDataService.findById(20L), genreDataService.findById(21L))));
//        animDataService.save(new Anim(null, "Блич: Тысячелетняя кровавая война", authorDataService.findById(5L), "/resources/videos/bleach.mp4", "/resources/images/bleach.jpg", "2022", "ТВ Сериал", "Онгоинг", Set.of(genreDataService.findById(1L), genreDataService.findById(3L), genreDataService.findById(4L))));
//        animDataService.save(new Anim(null, "Человек-бензопила", authorDataService.findById(6L), "/resources/videos/chainsaw man.mp4", "/resources/images/Human-benz.png", "2022", "ТВ Сериал", "Онгоинг", Set.of(genreDataService.findById(11L), genreDataService.findById(1L), genreDataService.findById(5L))));
//        animDataService.save(new Anim(null, "Семья шпиона", authorDataService.findById(2L), "/resources/videos/spy x family.mp4", "/resources/images/spy_family.jpg", "2022", "ТВ Сериал", "Онгоинг", Set.of(genreDataService.findById(11L), genreDataService.findById(6L), genreDataService.findById(10L))));
//        animDataService.save(new Anim(null, "Киберпанк: Бегущие по краю", authorDataService.findById(3L), "/resources/videos/cyberpunk_edgerunners.mp4", "/resources/images/cyberpank.jpg", "2022", "ONA", "Вышел", Set.of(genreDataService.findById(7L), genreDataService.findById(8L))));
//        animDataService.save(new Anim(null, "Моб Психо 100", authorDataService.findById(4L), "/resources/videos/mob psycho 100 III.mp4", "/resources/images/mob.jpg", "2022", "ТВ Сериал", "Вышел", Set.of(genreDataService.findById(6L), genreDataService.findById(4L), genreDataService.findById(9L), genreDataService.findById(7L))));


        model.addAttribute("listForFilterYears", animDataService.getAllYears());
        model.addAttribute("listForFilterGenres", genreDataService.findAll());
        model.addAttribute("listForFilterTypes", animDataService.getAllTypes());
        model.addAttribute("listForFilterStatus", animDataService.getAllStatuses());
        model.addAttribute("listForFilterAuthors", authorDataService.findAll());

        if (req.getServletContext().getAttribute("finalList") != null) {
            model.addAttribute("animList", req.getServletContext().getAttribute("finalList"));
        } else {
            model.addAttribute("animList", animDataService.findAll());
        }
        return "main_page";
    }

    @PostMapping
    public String filter(HttpServletRequest req,
                         @RequestParam("selectedYear") String selectedYear,
                         @RequestParam("selectedGenre") String selectedGenre,
                         @RequestParam("selectedType") String selectedType,
                         @RequestParam("selectedStatus") String selectedStatus,
                         @RequestParam("selectedAuthor") String selectedAuthor) {

        List<Anim> animeListTemplate = animDataService.findAll().stream().toList();
        List<Anim> finalAnimeList = new ArrayList<>();

        try {
            if (!selectedYear.equals("Выберите год")) {
                finalAnimeList = animDataService.conditionAnimeList(selectedYear, "Year", animeListTemplate);
            }

            if (!selectedGenre.equals("Выберите жанр")) {
                finalAnimeList = animDataService.conditionAnimeList(selectedGenre, "Genres", animeListTemplate);
            }

            if (!selectedType.equals("Выберите тип")) {
                finalAnimeList = animDataService.conditionAnimeList(selectedType, "Type", animeListTemplate);
            }

            if (!selectedStatus.equals("Выберите статус")) {
                finalAnimeList = animDataService.conditionAnimeList(selectedStatus, "Status", animeListTemplate);
            }

            if (!selectedAuthor.equals("Выберите создателя")) {
                finalAnimeList = animDataService.conditionAnimeList(selectedAuthor, "AuthorId", animeListTemplate);
            }
        } catch (ClassNotFoundException | InvocationTargetException | NoSuchMethodException |
                 IllegalAccessException e) {
            log.error("MainControllerException", e);
        }

        if (finalAnimeList.size() > 0) {
            req.getServletContext().setAttribute("finalList", finalAnimeList);
        }
        return "redirect:/";
    }
}
