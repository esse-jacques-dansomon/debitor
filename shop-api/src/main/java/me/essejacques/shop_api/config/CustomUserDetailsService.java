package me.essejacques.shop_api.config;

import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

        @Autowired
        private UserRepository userRepository;

        @Override
        public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
                // Vérification que l'email n'est pas vide ou null
                if (email == null || email.trim().isEmpty()) {
                        throw new UsernameNotFoundException("Email ne peut pas être vide");
                }

                // Recherche de l'utilisateur par email
                User user = userRepository.findByEmail(email).orElseThrow(
                        () -> new UsernameNotFoundException("Aucun utilisateur trouvé avec l'email : " + email)
                );
                if (user == null) {
                        throw new UsernameNotFoundException("Aucun utilisateur trouvé avec l'email : " + email);
                }

                // Vérification que le mot de passe n'est pas vide ou null
                if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
                        throw new UsernameNotFoundException("Mot de passe vide pour l'utilisateur : " + email);
                }

                // Création de l'objet UserDetails avec les informations nécessaires
                return new org.springframework.security.core.userdetails.User(
                        user.getEmail(),
                        user.getPassword(),
                        Collections.emptyList() // Remplacez par les rôles/autorités si nécessaire
                );
        }
}
