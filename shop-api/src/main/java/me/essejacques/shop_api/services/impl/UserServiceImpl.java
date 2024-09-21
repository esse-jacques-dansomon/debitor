package me.essejacques.shop_api.services.impl;

import me.essejacques.shop_api.config.SecurityConfiguration;
import me.essejacques.shop_api.dtos.UserDetailsProjection;
import me.essejacques.shop_api.entity.User;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.repositories.UserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements me.essejacques.shop_api.services.interfaces.UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    /**
     * @param user
     * @return User
     */
    @Override
    public User createUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return this.userRepository.save(user);
    }

    /**
     * @param user
     * @return User
     */
    @Override
    public User updateUser(User user) {
        return this.userRepository.save(user);
    }

    /**
     * @param userId
     */
    @Override
    public void deleteUser(Long userId) {
        this.userRepository.deleteById(userId);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public User findUserById(Long id) {
        return this.userRepository.findById(id).orElseThrow();
    }

    /**
     * @param email
     * @return
     */
    @Override
    public Optional<User> findUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    /**
     * @param email
     * @param password
     * @return
     */
    @Override
    public Optional<User> findUserByEmailAndPassword(String email, String password) {
        return this.userRepository.findByEmailAndPassword(email, password);
    }

    /**
     * @param pageRequest
     * @return
     */
    @Override
    public Page<UserDetailsProjection> getAll(PageRequest pageRequest) {
        return this.userRepository.findPagedProjectedBy(pageRequest);
    }

    @Override
    public Optional<UserDetailsProjection> findUserProjectedByEmail(String email) {
        return this.userRepository.findProjectedByEmail(email);
    }
}
