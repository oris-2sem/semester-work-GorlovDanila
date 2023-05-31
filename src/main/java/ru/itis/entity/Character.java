package ru.itis.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "characters")
public class Character {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String info;

    private String link;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "anim_id", referencedColumnName = "id")
    private Anim anim;
}
