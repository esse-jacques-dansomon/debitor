package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.controllers.interfaces.IDebtController;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.dtos.DebtDetailsDto;
import me.essejacques.shop_api.services.interfaces.DebtService;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/debts")
@RequiredArgsConstructor
@Tag(name = "Debts", description = "Debts API")
public class DebtController implements IDebtController {
    private final DebtService debtService;
    private final ModelMapper modelMapper;


    @Override
    @PostMapping
    public ResponseEntity<DebtDetailsDto> createDebt(@RequestBody Debt debt) {
        Debt created = debtService.createDebt(debt);
        return ResponseEntity.ok(modelMapper.map(created, DebtDetailsDto.class));
    }

    @Override
    @PutMapping("/{id}")
    public ResponseEntity<DebtDetailsDto> updateDebt(@PathVariable Long id, @RequestBody Debt debt) {
        Debt updated = debtService.updateDebt(id, debt);
        return ResponseEntity.ok(modelMapper.map(updated, DebtDetailsDto.class));
    }

    @Override
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDebt(@PathVariable Long id) {
        debtService.deleteDebt(id);
        return ResponseEntity.noContent().build();
    }

    @Override
    @GetMapping
    public ResponseEntity<List<DebtDetailsDto>> getAllDebts() {
        List<Debt> debts = debtService.getAllDebts();
        return ResponseEntity.ok(debts.stream().map((element) -> modelMapper.map(element, DebtDetailsDto.class)).collect(Collectors.toList()));
    }

    @Override
    @GetMapping("/client/{clientId}")
    public ResponseEntity<List<DebtDetailsDto>> getDebtsByClient(@PathVariable Long clientId) {
        List<Debt> debts = debtService.getDebtsByClient(clientId);
        return ResponseEntity.ok(debts.stream().map((element) -> modelMapper.map(element, DebtDetailsDto.class)).collect(Collectors.toList()));
    }

    @Override
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<DebtDetailsDto>> getDebtsByShoper(@PathVariable Long userId) {
        List<Debt> debts = debtService.getDebtsByShoper(userId);
        return ResponseEntity.ok(debts.stream().map((element) -> modelMapper.map(element, DebtDetailsDto.class)).collect(Collectors.toList()));
    }

    @Override
    @GetMapping("/{id}")
    public ResponseEntity<DebtDetailsDto> getDebtById(@PathVariable Long id) {
        Debt debt = debtService.getDebtById(id).orElseThrow( () -> new RuntimeException("Could not find debt with id: " + id));
        return ResponseEntity.ok(modelMapper.map(debt, DebtDetailsDto.class));
    }
}
