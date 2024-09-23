package me.essejacques.shop_api.controllers.interfaces;

import me.essejacques.shop_api.dtos.UserDetailsDto;
import me.essejacques.shop_api.dtos.UserDto;
import me.essejacques.shop_api.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@RequestMapping("/users")
public interface IUserController {

    /**
     * Retrieve all users with pagination.
     *
     * @param page the page number
     * @param size the number of elements per page
     * @return ResponseEntity containing a page of UserDetailsDto
     */
    @GetMapping
    ResponseEntity<Page<UserDetailsDto>> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    );

    /**
     * Create a new user with a profile image.
     *
     * @param user the user entity to create
     * @param file the file to upload
     * @return ResponseEntity containing the created UserDto
     */
    @PostMapping(consumes = "multipart/form-data")
    ResponseEntity<UserDto> createUser(
            @RequestPart("user") User user,
            @RequestPart("file") MultipartFile file
    );

    /**
     * Update an existing user.
     *
     * @param user the updated user entity
     * @return ResponseEntity containing the updated UserDto
     */
    @PutMapping
    ResponseEntity<UserDto> updateUser(@RequestBody User user);

    /**
     * Delete a user by ID.
     *
     * @param userId the ID of the user to delete
     * @return ResponseEntity<Void> with no content
     */
    @DeleteMapping("/{userId}")
    ResponseEntity<Void> deleteUser(@PathVariable Long userId);

    /**
     * Find a user by their ID.
     *
     * @param id the ID of the user
     * @return ResponseEntity containing the UserDto
     */
    @GetMapping("/{id}")
    ResponseEntity<UserDto> findUserById(@PathVariable Long id);

    /**
     * Find a user by their email.
     *
     * @param email the email of the user
     * @return ResponseEntity containing an Optional of User
     */
    @GetMapping("/email/{email}")
    ResponseEntity<Optional<User>> findUserByEmail(@PathVariable String email);
}
