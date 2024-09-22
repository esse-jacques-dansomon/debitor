package me.essejacques.shop_api.requests;

public record DebtRequest(
        Long clientId,
        Double amount,
        Boolean paid
) {
}
