package me.essejacques.shop_api.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import me.essejacques.shop_api.entity.Payment;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * DTO for {@link Payment}
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDto implements Serializable {
    private Long id;
    private LocalDate date;
    private Double amount;
}