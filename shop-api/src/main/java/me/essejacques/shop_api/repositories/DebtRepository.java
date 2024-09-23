package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DebtRepository extends JpaRepository<Debt, Long> {
    List<Debt> findAllByClient_Id(Long client);
    List<Debt> findAllByShopper_Id(Long user);
}