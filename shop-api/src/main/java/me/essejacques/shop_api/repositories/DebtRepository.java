package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DebtRepository extends JpaRepository<Debt, Long> {
    // Lister les dettes non soldées d'un client
    List<Debt> findByClientAndPaymentsIsNull(Client client);
    List<Debt> findByClient(Client client);
}