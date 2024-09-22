package me.essejacques.shop_api.services.impl;


import me.essejacques.shop_api.dtos.DebtDetailsProjection;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.repositories.DebtRepository;
import me.essejacques.shop_api.services.interfaces.DebtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Optional;


@Service
public class DebtServiceImpl implements DebtService {

    private final DebtRepository debtRepository;

    @Autowired
    public DebtServiceImpl(DebtRepository debtRepository) {
        this.debtRepository = debtRepository;
    }

    @Override
    public Debt createDebt(Debt debt) {
        return debtRepository.save(debt);
    }

    @Override
    public Debt updateDebt(Long id, Debt debtDetails) {
        Debt debt = debtRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dette non trouvée"));
        debt.setDate(debtDetails.getDate());
        debt.setAmount(debtDetails.getAmount());
        debt.setClient(debtDetails.getClient());
        return debtRepository.save(debt);
    }

    @Override
    public void deleteDebt(Long id) {
        debtRepository.deleteById(id);
    }

    @Override
    public List<Debt> getAllDebts() {
        return debtRepository.findAll();
    }

    @Override
    public List<Debt> getDebtsByClient(Client client) {
        return debtRepository.findByClient(client);
    }

    @Override
    public Optional<Debt> getDebtById(Long id) {
        return debtRepository.findById(id);
    }

    @Override
    public List<Long> findSettledDebts() {
        List<Debt> debts = debtRepository.findAll();
        return debts.stream()
                .filter(debt -> debt.getPayments().stream()
                        .mapToDouble(payment -> payment.getAmount())
                        .sum() >= debt.getAmount())
                .map(Debt::getId)
                .collect(Collectors.toList());
    }

    @Override
    public List<DebtDetailsProjection> getDebtsByShoper(User user) {
        return debtRepository.findAllProjectedByShopper(user);
    }
}

