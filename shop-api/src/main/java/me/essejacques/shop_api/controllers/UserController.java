package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.dtos.UserDetailsProjection;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
@Tag(name = "Users", description = "Users API")
@Slf4j
public class UserController {

    private final UserService userService;

    @GetMapping
    public ResponseEntity<Page<UserDetailsProjection>> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Page<UserDetailsProjection> users = userService.getAll(PageRequest.of(page, size));
        return ResponseEntity.ok(users);
    }

    @PostMapping(consumes = "multipart/form-data")
    public ResponseEntity<User> createUser(
            @RequestPart("user") User user,
            @RequestPart("file") MultipartFile file
                                           ) {
        log.info("Create user, user : {}, file : {}", user, file);
        User createdUser = userService.createUser(user, file);
        return ResponseEntity.ok(createdUser);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        User updatedUser = userService.updateUser(user);
        return ResponseEntity.ok(updatedUser);
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> findUserById(@PathVariable Long id) {
        User user = userService.findUserById(id);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<Optional<User>> findUserByEmail(@PathVariable String email) {
        Optional<User> user = userService.findUserByEmail(email);
        return ResponseEntity.ok(user);
    }
}
