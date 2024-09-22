package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
  List<Payment> findByDebt(Debt debt);
}