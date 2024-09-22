package me.essejacques.shop_api.dtos;

import java.time.LocalDate;

public interface DebtDetailsProjection {
    Long getId();
    LocalDate getDate();
    Double getAmount();
    Boolean getPaid();
    UserProjection getShopper();
    ClientProjection getClient();
}
