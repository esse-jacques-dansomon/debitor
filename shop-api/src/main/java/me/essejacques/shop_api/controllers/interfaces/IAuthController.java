package me.essejacques.shop_api.controllers.interfaces;

import jakarta.validation.Valid;
import me.essejacques.shop_api.dtos.JwtAuthResponse;
import me.essejacques.shop_api.dtos.UserDto;
import me.essejacques.shop_api.requests.LoginRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/auth")
public interface IAuthController {

    /**
     * Handles user login.
     *
     * @param loginRequest the login request containing username and password
     * @return JwtAuthResponse containing access token and user details
     */
    ResponseEntity<JwtAuthResponse> login(@Valid @RequestBody LoginRequest loginRequest);

    /**
     * Returns the authenticated user's details.
     *
     * @return UserDto containing authenticated user's information
     */
    ResponseEntity<UserDto> getAuthUser();
}
