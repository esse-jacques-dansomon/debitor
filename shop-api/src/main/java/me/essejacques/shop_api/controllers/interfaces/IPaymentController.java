package me.essejacques.shop_api.controllers.interfaces;

import me.essejacques.shop_api.dtos.PaymentDto;
import me.essejacques.shop_api.entity.Payment;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RequestMapping("/payments")
public interface IPaymentController {

    /**
     * Create a new payment.
     *
     * @param payment the payment entity to create
     * @return ResponseEntity containing the created PaymentDto
     */
    @PostMapping
    ResponseEntity<PaymentDto> createPayment(@RequestBody Payment payment);

    /**
     * Update an existing payment.
     *
     * @param id the id of the payment to update
     * @param payment the updated payment information
     * @return ResponseEntity containing the updated PaymentDto
     */
    @PutMapping("/{id}")
    ResponseEntity<PaymentDto> updatePayment(@PathVariable Long id, @RequestBody Payment payment);

    /**
     * Delete a payment by its ID.
     *
     * @param id the id of the payment to delete
     * @return ResponseEntity<Void> with no content
     */
    @DeleteMapping("/{id}")
    ResponseEntity<Void> deletePayment(@PathVariable Long id);

    /**
     * Get all payments.
     *
     * @return ResponseEntity containing a list of PaymentDto
     */
    @GetMapping
    ResponseEntity<List<PaymentDto>> getAllPayments();

    /**
     * Get all payments for a specific debt.
     *
     * @param debtId the id of the debt
     * @return ResponseEntity containing a list of PaymentDto
     */
    @GetMapping("/debt/{debtId}")
    ResponseEntity<List<PaymentDto>> getPaymentsByDebt(@PathVariable Long debtId);

    /**
     * Get a payment by its ID.
     *
     * @param id the id of the payment
     * @return ResponseEntity containing an Optional of PaymentDto
     */
    @GetMapping("/{id}")
    ResponseEntity<Optional<PaymentDto>> getPaymentById(@PathVariable Long id);
}
