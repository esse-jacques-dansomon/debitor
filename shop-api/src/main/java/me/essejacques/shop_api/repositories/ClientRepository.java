package me.essejacques.shop_api.repositories;

import me.essejacques.shop_api.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
  // Lister les clients qui ont un compte utilisateur
  List<Client> findByUserIsNotNull();
  // Lister les clients qui n'ont pas de compte utilisateur
  List<Client> findByUserIsNull();
  // Liste un client par son numéro de téléphone
  Optional<Client> findByTelephone(String telephone);
}