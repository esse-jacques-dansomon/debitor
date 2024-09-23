package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

public interface UserService {
    User createUser(User user, MultipartFile file);

    User updateUser(User user);

    void deleteUser(Long userId);

    Optional<User> findUserById(Long id);

    Optional<User> findUserByEmail(String email);

    Optional<User> findUserProjectedByEmail(String email);

    Optional<User> findUserByEmailAndPassword(String email, String password);

    Page<User> getAll(PageRequest pageRequest);

}
