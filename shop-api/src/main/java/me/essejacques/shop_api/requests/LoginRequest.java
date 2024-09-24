package me.essejacques.shop_api.requests;

import jakarta.validation.constraints.NotBlank;


public record LoginRequest(
        @NotBlank String usernameOrEmail,
        @NotBlank String password
) {}
