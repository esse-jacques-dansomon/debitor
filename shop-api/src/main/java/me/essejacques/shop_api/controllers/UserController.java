package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.controllers.interfaces.IUserController;
import me.essejacques.shop_api.dtos.UserDetailsDto;
import me.essejacques.shop_api.dtos.UserDto;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.modelmapper.ModelMapper;
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
public class UserController implements IUserController {
    private final ModelMapper modelMapper;
    private final UserService userService;

    @Override
    @GetMapping
    public ResponseEntity<Page<UserDetailsDto>> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Page<User> userPage = userService.getAll(PageRequest.of(page, size));

        return ResponseEntity.ok(userPage.map((element) -> modelMapper.map(element, UserDetailsDto.class)));
    }

    @Override
    @PostMapping(consumes = "multipart/form-data")
    public ResponseEntity<UserDto> createUser(
            @RequestPart("user") User user,
            @RequestPart("file") MultipartFile file
                                           ) {
        log.info("Create user, user : {}, file : {}", user, file);
        User createdUser = userService.createUser(user, file);
        return ResponseEntity.ok(modelMapper.map(createdUser, UserDto.class));
    }

    @Override
    @PutMapping
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<UserDto> updateUser(@RequestBody User user) {
        User updatedUser = userService.updateUser(user);
        return ResponseEntity.ok(modelMapper.map(updatedUser, UserDto.class));
    }

    @Override
    @DeleteMapping("/{userId}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return ResponseEntity.noContent().build();
    }

    @Override
    @GetMapping("/{id}")
    public ResponseEntity<UserDto> findUserById(@PathVariable Long id) {
        User user = userService.findUserById(id).orElseThrow(
                () -> new RuntimeException("User not found")
        );
        return ResponseEntity.ok(modelMapper.map(user, UserDto.class));
    }

    @Override
    @GetMapping("/email/{email}")
    public ResponseEntity<Optional<User>> findUserByEmail(@PathVariable String email) {
        Optional<User> user = userService.findUserByEmail(email);
        return ResponseEntity.ok(user);
    }
}
