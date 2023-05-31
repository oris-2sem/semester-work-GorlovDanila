package ru.itis.service;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.entity.User;
import ru.itis.repository.RoleRepository;
import ru.itis.repository.UserRepository;

@AllArgsConstructor
@Service
public class UserDataService {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    private final PasswordEncoder passwordEncoder;

    public User findByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    public boolean save(User user) {
        User userFromDB = userRepository.findByLogin(user.getLogin());

        if (userFromDB != null) {
            return false;
        }

        user.setRole(roleRepository.findByName("USER"));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean delete(Long id) {
        if (userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
