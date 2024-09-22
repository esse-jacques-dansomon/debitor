package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import me.essejacques.shop_api.dtos.DebtDetailsProjection;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.services.interfaces.ClientService;
import me.essejacques.shop_api.services.interfaces.DebtService;
import me.essejacques.shop_api.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/debts")
@Tag(name = "Debts", description = "Debts API")
public class DebtController {

    private final DebtService debtService;
    private final ClientService clientService;
    private final UserService userService;

    @Autowired
    public DebtController(DebtService debtService, ClientService clientService, UserService userService) {
        this.debtService = debtService;
        this.clientService = clientService;
        this.userService = userService;
    }

    @PostMapping
    public ResponseEntity<Debt> createDebt(@RequestBody Debt debt) {
        Debt created = debtService.createDebt(debt);
        return ResponseEntity.ok(created);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Debt> updateDebt(@PathVariable Long id, @RequestBody Debt debt) {
        Debt updated = debtService.updateDebt(id, debt);
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDebt(@PathVariable Long id) {
        debtService.deleteDebt(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<Debt>> getAllDebts() {
        List<Debt> debts = debtService.getAllDebts();
        return ResponseEntity.ok(debts);
    }

    @GetMapping("/client/{clientId}")
    public ResponseEntity<List<Debt>> getDebtsByClient(@PathVariable Long clientId) {
        Optional<Client> clientOpt = clientService.getClientById(clientId);
        if (clientOpt.isPresent()) {
            List<Debt> debts = debtService.getDebtsByClient(clientOpt.get());
            return ResponseEntity.ok(debts);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<DebtDetailsProjection>> getDebtsByShoper(@PathVariable Long userId) {
        Optional<User> userOptional = userService.findUserById(userId);
        if (userOptional.isPresent()) {
            List<DebtDetailsProjection> debts = debtService.getDebtsByShoper(userOptional.get());
            return ResponseEntity.ok(debts);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<Debt>> getDebtById(@PathVariable Long id) {
        Optional<Debt> debt = debtService.getDebtById(id);
        return ResponseEntity.ok(debt);
    }
}
