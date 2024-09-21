package me.essejacques.shop_api.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Set;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@SuperBuilder
@AllArgsConstructor
public class Client  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String surname;
    private String telephone;
    private String address;

    // Un client peut avoir un compte utilisateur ou pas
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    // Un client peut avoir plusieurs dettes
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private Set<Debt> debts;

}

