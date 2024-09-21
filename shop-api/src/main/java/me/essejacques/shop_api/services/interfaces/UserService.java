package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.dtos.UserDetailsProjection;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Optional;

public interface UserService {
    User createUser(User user);

    User updateUser(User user);

    void deleteUser(Long userId);

    User findUserById(Long id);

    Optional<User> findUserByEmail(String email);

    Optional<UserDetailsProjection> findUserProjectedByEmail(String email);

    Optional<User> findUserByEmailAndPassword(String email, String password);

    Page<UserDetailsProjection> getAll(PageRequest pageRequest);
}
