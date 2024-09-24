package me.essejacques.shop_api.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import org.checkerframework.common.aliasing.qual.Unique;

public record DebtRequest(
        @NotBlank
        Long clientId,
        @NotBlank
        Long shopperId,
        @NotBlank
        @Min(500)
        Double amount,
        @NotBlank
        Boolean paid
) {
}
