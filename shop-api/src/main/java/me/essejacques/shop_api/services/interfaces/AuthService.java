package me.essejacques.shop_api.services.interfaces;

import me.essejacques.shop_api.dtos.LoginDto;

public interface AuthService {
    String login(LoginDto loginDto);
}
