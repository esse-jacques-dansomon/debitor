package me.essejacques.shop_api.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import me.essejacques.shop_api.entity.Client;

import java.io.Serializable;

/**
  * DTO for {@link Client}
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ClientDto implements Serializable {
    private Long id;
    private String surname;
    private String telephone;
    private String address;
    private UserDto user;
}