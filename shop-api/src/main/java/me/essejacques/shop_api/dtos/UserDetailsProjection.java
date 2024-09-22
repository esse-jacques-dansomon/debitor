package me.essejacques.shop_api.dtos;

public interface UserDetailsProjection extends UserProjection {
    Long getId();

    String getEmail();

}
