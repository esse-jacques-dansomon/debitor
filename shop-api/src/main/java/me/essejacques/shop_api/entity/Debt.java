package me.essejacques.shop_api.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Builder
public class Debt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;
    private Double amount;
    private Boolean paid = Boolean.FALSE;

    // Une dette est associée à un client
    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    // Une dette est associée à un butiquier
    @ManyToOne
    @JoinColumn(name = "butiquier_id")
    private User shopper;

    // Une dette peut avoir plusieurs paiements
    @OneToMany(mappedBy = "debt", cascade = CascadeType.ALL)
    private Set<Payment> payments;
}
