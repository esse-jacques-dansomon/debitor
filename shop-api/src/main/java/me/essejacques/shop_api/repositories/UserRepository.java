package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    Optional<User> findProjectedByEmail(String email);
    Optional<User> findByEmailAndPassword(String email, String password);
    Page<User> findPagedProjectedBy(Pageable pageable);
}