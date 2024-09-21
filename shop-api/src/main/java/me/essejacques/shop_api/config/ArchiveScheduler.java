package me.essejacques.shop_api.config;

import me.essejacques.shop_api.services.interfaces.ArchiveDebtService;
import me.essejacques.shop_api.services.interfaces.DebtService;
import org.springframework.stereotype.Component;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import java.util.List;

@Component
public class ArchiveScheduler {

    private final DebtService debtService;
    private final ArchiveDebtService archiveDebtService;

    @Autowired
    public ArchiveScheduler(DebtService debtService, ArchiveDebtService archiveDebtService) {
        this.debtService = debtService;
        this.archiveDebtService = archiveDebtService;
    }

    @Scheduled(cron = "0 0 23 * * ?")
    public void archiveEndOfDayDebts() {
        List<Long> debtsToArchive = debtService.findSettledDebts(); // Méthode à implémenter
        for (Long debtId : debtsToArchive) {
            try {
                archiveDebtService.archiveDebt(debtId);
            } catch (Exception e) {
                // Gérer les exceptions (logging, alertes, etc.)
            }
        }
    }
}
