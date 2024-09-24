package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.requests.LoginRequest;

public interface AuthService {
    String login(LoginRequest loginRequest);
}
