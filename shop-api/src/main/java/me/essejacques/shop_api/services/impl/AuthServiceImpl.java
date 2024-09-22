package me.essejacques.shop_api.services.impl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.essejacques.shop_api.config.JwtService;
import me.essejacques.shop_api.dtos.LoginDto;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.repositories.UserRepository;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Slf4j
public class AuthServiceImpl implements me.essejacques.shop_api.services.interfaces.AuthService {
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;

    public AuthServiceImpl(JwtService jwtService, AuthenticationManager authenticationManager,  UserRepository userRepository) {
        this.jwtService = jwtService;
        this.authenticationManager = authenticationManager;
        this.userRepository = userRepository;
    }

    @Override
    public String login(LoginDto loginDto) {

        User user = userRepository.findByEmail(loginDto.getUsernameOrEmail()).orElseThrow(
                () -> new RuntimeException("User not exists by Username or Email")
        );
        log.info("User: {}", user);

        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                loginDto.getUsernameOrEmail(),
                loginDto.getPassword()));
        log.info("Authentication: {}", authentication);

        SecurityContextHolder.getContext().setAuthentication(authentication);

        return jwtService.generateToken(authentication);
    }

}
