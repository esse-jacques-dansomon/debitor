package me.essejacques.shop_api.dtos;

public interface ClientProjection {
    Long getId();
    String getSurname();
    String getTelephone();
    String getAddress();

    UserProjection getUser();
}
