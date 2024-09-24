package me.essejacques.shop_api.requests;

import jakarta.validation.constraints.NotBlank;

public record ClientRequest(
    @NotBlank
    String email,
    @NotBlank
    String password,
    @NotBlank
    String username,
    @NotBlank
    String address,
    @NotBlank
    String telephone) {

}
