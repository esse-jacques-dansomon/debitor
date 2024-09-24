package me.essejacques.shop_api.controllers.interfaces;

import me.essejacques.shop_api.dtos.DebtDetailsDto;
import me.essejacques.shop_api.entity.Debt;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/debts")
public interface IDebtController {

    /**
     * Create a new debt.
     *
     * @param debt the debt entity to create
     * @return ResponseEntity containing the created DebtDetailsDto
     */
    @PostMapping
    ResponseEntity<DebtDetailsDto> createDebt(@RequestBody Debt debt);

    /**
     * Update an existing debt.
     *
     * @param id the id of the debt to update
     * @param debt the updated debt information
     * @return ResponseEntity containing the updated DebtDetailsDto
     */
    @PutMapping("/{id}")
    ResponseEntity<DebtDetailsDto> updateDebt(@PathVariable Long id, @RequestBody Debt debt);

    /**
     * Delete a debt by its ID.
     *
     * @param id the id of the debt to delete
     * @return ResponseEntity<Void> with no content
     */
    @DeleteMapping("/{id}")
    ResponseEntity<Void> deleteDebt(@PathVariable Long id);

    /**
     * Get all debts.
     *
     * @return ResponseEntity containing a list of DebtDetailsDto
     */
    @GetMapping
    ResponseEntity<List<DebtDetailsDto>> getAllDebts();

    /**
     * Get all debts for a specific client.
     *
     * @param clientId the id of the client
     * @return ResponseEntity containing a list of DebtDetailsDto
     */
    @GetMapping("/client/{clientId}")
    ResponseEntity<List<DebtDetailsDto>> getDebtsByClient(@PathVariable Long clientId);

    /**
     * Get all debts managed by a specific shopper.
     *
     * @param userId the id of the shopper
     * @return ResponseEntity containing a list of DebtDetailsDto
     */
    @GetMapping("/user/{userId}")
    ResponseEntity<List<DebtDetailsDto>> getDebtsByShoper(@PathVariable Long userId);

    /**
     * Get a debt by its ID.
     *
     * @param id the id of the debt
     * @return ResponseEntity containing the DebtDetailsDto
     */
    @GetMapping("/{id}")
    ResponseEntity<DebtDetailsDto> getDebtById(@PathVariable Long id);
}
