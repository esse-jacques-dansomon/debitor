package me.essejacques.shop_api.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import me.essejacques.shop_api.enums.RoleType;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.Date;


@Table(name = "users")
@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@SuperBuilder
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    protected Long id;

    @Column(unique = true, length = 100, nullable = false)
    protected String email;

    @Getter
    @Column(nullable = false)
    @ToString.Exclude
    @JsonIgnore
    protected String password;

    protected String photo;

    @CreationTimestamp
    @Column(updatable = false, name = "created_at")
    protected Date createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    protected Date updatedAt;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    protected RoleType role;

    @OneToOne(mappedBy = "user")
    private Client client;
}