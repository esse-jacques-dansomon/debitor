package me.essejacques.shop_api.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import me.essejacques.shop_api.entity.Debt;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

/**
 * DTO for {@link Debt}
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DebtDto implements Serializable {
        private Long id;
        private LocalDate date;
        private Double amount;
        private Boolean paid;
}