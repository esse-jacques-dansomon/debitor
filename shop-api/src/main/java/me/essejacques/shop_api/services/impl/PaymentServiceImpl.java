package me.essejacques.shop_api.services.impl;


import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.Payment;
import me.essejacques.shop_api.repositories.PaymentRepository;
import me.essejacques.shop_api.services.interfaces.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PaymentServiceImpl implements PaymentService {

    private final PaymentRepository paymentRepository;

    @Autowired
    public PaymentServiceImpl(PaymentRepository paymentRepository) {
        this.paymentRepository = paymentRepository;
    }

    @Override
    public Payment createPayment(Payment payment) {
        return paymentRepository.save(payment);
    }

    @Override
    public Payment updatePayment(Long id, Payment paymentDetails) {
        Payment payment = paymentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Paiement non trouvé"));
        payment.setDate(paymentDetails.getDate());
        payment.setAmount(paymentDetails.getAmount());
        payment.setDebt(paymentDetails.getDebt());
        return paymentRepository.save(payment);
    }

    @Override
    public void deletePayment(Long id) {
        paymentRepository.deleteById(id);
    }

    @Override
    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    @Override
    public List<Payment> getPaymentsByDebt(Debt debt) {
        return paymentRepository.findByDebt(debt);
    }

    @Override
    public Optional<Payment> getPaymentById(Long id) {
        return paymentRepository.findById(id);
    }
}
