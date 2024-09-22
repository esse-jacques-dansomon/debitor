package me.essejacques.shop_api.services.interfaces;


import me.essejacques.shop_api.dtos.ClientProjection;
import me.essejacques.shop_api.entity.Client;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface ClientService {
    Client createClient(Client client, MultipartFile file);
    Client updateClient(Long id, Client client);
    void deleteClient(Long id);
    List<ClientProjection> getAllClients();
    List<ClientProjection> getClientsWithUserAccount();
    List<ClientProjection> getClientsWithoutUserAccount();
    Optional<Client> getClientByTelephone(String telephone);
    Optional<Client> getClientById(Long clientId);
}