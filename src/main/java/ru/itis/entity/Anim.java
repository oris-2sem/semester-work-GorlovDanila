package ru.itis.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "animes")
public class Anim {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private Author authorId;

    private String link;
    private String linkToImage;
    private Long year;
    private String type;
    private String status;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "anim_genre",
            joinColumns = @JoinColumn(name = "anim_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id"))
    private Set<Genre> genres;
}
