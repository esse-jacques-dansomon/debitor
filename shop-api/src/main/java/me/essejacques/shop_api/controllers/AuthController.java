package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.config.JwtService;
import me.essejacques.shop_api.dtos.UserDetailsProjection;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.response.JwtAuthResponse;
import me.essejacques.shop_api.dtos.LoginDto;
import me.essejacques.shop_api.services.interfaces.AuthService;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RequiredArgsConstructor
@RequestMapping("/auth")
@RestController
@Tag(name = "Authenticator", description = "Authenticator API")
@Slf4j
public class AuthController {
    private final AuthService authService;
    private final UserService userService;
    private final JwtService jwtService;

    @PostMapping("/login")
    public ResponseEntity<JwtAuthResponse> login(@Valid @RequestBody LoginDto loginDto) {
        Optional<UserDetailsProjection> user = userService.findUserProjectedByEmail(loginDto.getUsernameOrEmail());
        log.info("User: {}", user);
        String token = authService.login(loginDto);
        log.info("Token: {}", token);
        JwtAuthResponse jwtAuthResponse = new JwtAuthResponse();
        jwtAuthResponse.setAccessToken(token);

        user.ifPresent(jwtAuthResponse::setUser);
        return new ResponseEntity<>(jwtAuthResponse, HttpStatus.OK);
    }

    @GetMapping("/user")
    public Optional<User> userDetails(HttpServletRequest request) {
        String token = jwtService.getTokenFormRequest(request);
        String username = jwtService.getUsername(token);
        return userService.findUserByEmail(username);
    }


    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<UserDetailsProjection> getAuthUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = "";
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        Optional<UserDetailsProjection> user = userService.findUserProjectedByEmail(username);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

}
