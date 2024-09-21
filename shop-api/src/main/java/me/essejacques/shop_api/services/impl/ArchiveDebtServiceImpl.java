package me.essejacques.shop_api.services.impl;

import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.repositories.DebtRepository;
import me.essejacques.shop_api.services.interfaces.ArchiveDebtService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ArchiveDebtServiceImpl implements ArchiveDebtService {
    private final DebtRepository debtRepository;
    @Override
    public void archiveDebt(Long debtId) throws Exception {
        debtRepository.deleteById(debtId);
    }
}
