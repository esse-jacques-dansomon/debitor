//package me.essejacques.shop_api.config;
//
//import lombok.AllArgsConstructor;
//
//import lombok.RequiredArgsConstructor;
//import me.essejacques.shop_api.entity.User;
//import me.essejacques.shop_api.repositories.UserRepository;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//
//import java.util.Set;
//import java.util.stream.Collectors;
//import java.util.stream.Stream;
//
//@Service
//@RequiredArgsConstructor
//public class CustomUserDetailsService implements UserDetailsService {
//
//        private UserRepository userRepository;
//
//        @Override
//        public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//
//                User user = userRepository.findByEmail(email)
//                                .orElseThrow(() -> new UsernameNotFoundException(
//                                                "User not exists by Username or Email"));
//
//                Set<GrantedAuthority> authorities =
//                        Stream.of(new SimpleGrantedAuthority(user.getRole().name())).collect(Collectors.toSet());
//                //  user.getRoles().stream()
//                // .map(role -> new SimpleGrantedAuthority(role.getName()))
//                //  .collect(Collectors.toSet());
//
//                return new org.springframework.security.core.userdetails.User(
//                                email,
//                                null,
//                                authorities);
//        }
//}
