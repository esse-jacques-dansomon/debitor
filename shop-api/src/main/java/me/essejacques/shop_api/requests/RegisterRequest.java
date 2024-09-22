package me.essejacques.shop_api.requests;

import jakarta.validation.constraints.NotEmpty;

public record RegisterRequest (
        @NotEmpty
        String email,
        @NotEmpty
        String password
) {
}
