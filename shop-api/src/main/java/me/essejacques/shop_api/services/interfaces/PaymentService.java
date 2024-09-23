package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.Payment;

import java.util.List;
import java.util.Optional;

public interface PaymentService {
    Payment createPayment(Payment payment);
    Payment updatePayment(Long id, Payment payment);
    void deletePayment(Long id);
    List<Payment> getAllPayments();
    List<Payment> getPaymentsByDebt(Long debtIt);
    Optional<Payment> getPaymentById(Long id);
}
