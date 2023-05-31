package ru.itis.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String login;
    private String password;
    private String number;

    @ManyToOne(fetch = FetchType.EAGER)
    private Role role;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "user_anim",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "anim_id"))
    private Set<Anim> anims;

}
