package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
  Optional<Client> findByTelephone(String telephone);
  List<Client> findAllProjectedBy();
  List<Client> findAllProjectedByUserIsNotNull();
  List<Client> findAllProjectedByUserIsNull();
}