package me.essejacques.shop_api.controllers;


import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.dtos.UserDto;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.dtos.JwtAuthResponse;
import me.essejacques.shop_api.requests.LoginRequest;
import me.essejacques.shop_api.services.interfaces.AuthService;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;


@RequiredArgsConstructor
@RequestMapping("/auth")
@RestController
@Tag(name = "Authenticator", description = "Authenticator API")
@Slf4j
public class AuthController {
    private final AuthService authService;
    private final UserService userService;
    private final ModelMapper modelMapper;


    @PostMapping("/login")
    public ResponseEntity<JwtAuthResponse> login(@Valid @RequestBody LoginRequest loginRequest) {
        String token = authService.login(loginRequest);
        JwtAuthResponse jwtAuthResponse = new JwtAuthResponse();
        jwtAuthResponse.setAccessToken(token);
        User user = userService.findUserProjectedByEmail(loginRequest.usernameOrEmail()).orElseThrow();
        UserDto userDto = modelMapper.map(user, UserDto.class);
        jwtAuthResponse.setUser(userDto);
        return new ResponseEntity<>(jwtAuthResponse, HttpStatus.OK);
    }


    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<UserDto> getAuthUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = "";
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        User user = userService.findUserProjectedByEmail(username).orElseThrow(
                () -> new RuntimeException( "User not found" )
        );
        UserDto userDto = modelMapper.map(user, UserDto.class);
        return new ResponseEntity<>(userDto, HttpStatus.OK);
    }

}
