package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.controllers.interfaces.IPaymentController;
import me.essejacques.shop_api.dtos.PaymentDto;
import me.essejacques.shop_api.entity.Payment;
import me.essejacques.shop_api.services.interfaces.PaymentService;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/payments")
@Tag(name = "Payments", description = "Payments API")
@RequiredArgsConstructor
public class PaymentController  implements IPaymentController {

    private final PaymentService paymentService;
    private final ModelMapper modelMapper;

    @Override
    @PostMapping
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<PaymentDto> createPayment(@RequestBody Payment payment) {
        Payment created = paymentService.createPayment(payment);
        return ResponseEntity.ok(modelMapper.map(created, PaymentDto.class));
    }

    @Override
    @PutMapping("/{id}")
    public ResponseEntity<PaymentDto> updatePayment(@PathVariable Long id, @RequestBody Payment payment) {
        Payment updated = paymentService.updatePayment(id, payment);
        return ResponseEntity.ok(modelMapper.map(updated, PaymentDto.class));
    }

    @Override
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePayment(@PathVariable Long id) {
        paymentService.deletePayment(id);
        return ResponseEntity.noContent().build();
    }

    @Override
    @GetMapping
    public ResponseEntity<List<PaymentDto>> getAllPayments() {
        List<Payment> payments = paymentService.getAllPayments();
        return ResponseEntity.ok(payments.stream().map((element) -> modelMapper.map(element, PaymentDto.class)).collect(Collectors.toList()));
    }

    @Override
    @GetMapping("/debt/{debtId}")
    public ResponseEntity<List<PaymentDto>> getPaymentsByDebt(@PathVariable Long debtId) {
            List<Payment> payments = paymentService.getPaymentsByDebt(debtId);
            return ResponseEntity.ok(payments.stream().map((element) -> modelMapper.map(element, PaymentDto.class)).collect(Collectors.toList()));
    }

    @Override
    @GetMapping("/{id}")
    public ResponseEntity<Optional<PaymentDto>> getPaymentById(@PathVariable Long id) {
        Optional<Payment> payment = paymentService.getPaymentById(id);
        return ResponseEntity.ok(payment.map((element) -> modelMapper.map(element, PaymentDto.class)));
    }
}

