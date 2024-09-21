package me.essejacques.shop_api.services.impl;

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
@RequiredArgsConstructor
@Slf4j
public class AuthServiceImpl implements me.essejacques.shop_api.services.interfaces.AuthService {
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;

    @Override
    public String login(LoginDto loginDto) {

        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                loginDto.getUsernameOrEmail(),
                loginDto.getPassword()));
        log.info("Authentication successful", authentication.getPrincipal());

        Optional<User> user = userRepository.findByEmail(loginDto.getUsernameOrEmail());
        //            SecurityContextHolder.getContext().setAuthentication(authentication);
        return user.map(jwtService::generateToken).orElse(null);


    }

}
