package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.dtos.DebtDetailsProjection;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.Debt;
import me.essejacques.shop_api.entity.User;

import java.util.List;
import java.util.Optional;

public interface DebtService {
    Debt createDebt(Debt debt);
    Debt updateDebt(Long id, Debt debt);
    void deleteDebt(Long id);
    List<Debt> getAllDebts();
    List<Debt> getDebtsByClient(Client client);
    Optional<Debt> getDebtById(Long id);
    List<Long> findSettledDebts(); // Définir les dettes soldées // Définir les dettes soldées
    List<DebtDetailsProjection> getDebtsByShoper(User user);
}
