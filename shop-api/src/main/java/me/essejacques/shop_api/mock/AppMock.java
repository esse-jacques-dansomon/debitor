package me.essejacques.shop_api.mock;

import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.enums.RoleType;
import me.essejacques.shop_api.repositories.ClientRepository;
import me.essejacques.shop_api.repositories.DebtRepository;
import me.essejacques.shop_api.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
@RequiredArgsConstructor
@Order(1)
public class AppMock implements CommandLineRunner {
//public class AppMock {

     private final ClientRepository clientRepository;
     private final PasswordEncoder passwordEncoder;
     private final UserRepository userRepository;
     private final DebtRepository debtRepository;


    List<String> frenchNames = new ArrayList<>(Arrays.asList(
            "Paul", "Pierre", "Jean",  "François", "Marie", "Anne", "Jeanne", "Marie-Claire", "Catherine", "Sophie", "Charlotte", "Victoire", "Hélène", "Isabelle", "Nathalie", "Laure", "Valérie", "Sylvie", "Suzanne", "Céline", "Elisabeth", "Marguerite", "Virginie", "Blanche", "Florence", "Alice", "Louise", "Pauline", "Lydia", "Alexandra", "Grace", "Julie", "Rose", "Amelie", "Caroline", "Denise", "Gabrielle", "Inès", "Joséphine", "Madeleine", "Nathalie", "Noémie", "Olivia", "Paulette", "Stéphanie", "Thérèse", "Violette", "Yolande" ));


    //@Override
    public void run(String... args) throws Exception {
        if (clientRepository.count() == 0) {
            System.out.println("Création des clients");

            for (String name : frenchNames) {
                String email = name.toLowerCase() + "@gmail.com";
                if (userRepository.findByEmail(email).isEmpty()) {
                    User user = User.builder()
                            .email(name.toLowerCase() + "@gmail.com")
                            .password(passwordEncoder.encode("password"))
                            .photo("https://www.placeholder.com/300x300?text=" + name)
                            .role(RoleType.ROLE_USER)
                            .build();


                    Client client = Client.builder()
                            .address("12 rue de la Légion d'Honneur")
                            .surname(name)
                            .telephone("06 00 00 00 00")
                            .user(user)
                            .build();
                    clientRepository.save(client);

                }
            }



            //recuperation des boutiquers
            List<User> users = userRepository.findAll();
            List<User> butiquiers = new ArrayList<>();
            users.forEach(user -> {
                if (user.getRole() == RoleType.ROLE_SHOP_MANAGER) {
                    butiquiers.add(user);
                }
            });

            List<Client> clients = clientRepository.findAll();

            //création 20 débit
            for (int i = 0; i < 20; i++) {
                Debt debt = Debt.builder()
                        .date(LocalDate.now())
                        .amount(Math.random() * 1000)
                        .paid(false)
                        .client(clients.get(i % users.size()))
                        .shopper(butiquiers.get(i % butiquiers.size()))
                        .build();
                debtRepository.save(debt);
            }
        }





    }
}
