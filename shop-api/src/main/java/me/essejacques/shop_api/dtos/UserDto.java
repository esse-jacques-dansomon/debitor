package me.essejacques.shop_api.dtos;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import me.essejacques.shop_api.entity.User;

import java.io.Serializable;


/**
 * Dto for {@link User}
 * @param id
 * @param email
 * @param photo
 * @param role
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto implements Serializable {
    private Long id;
    private String email;
    private String photo;
    private String role;
}
