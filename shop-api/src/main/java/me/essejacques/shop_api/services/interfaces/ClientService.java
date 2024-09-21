package me.essejacques.shop_api.services.interfaces;


import me.essejacques.shop_api.entity.Client;

import java.util.List;
import java.util.Optional;

public interface ClientService {
    Client createClient(Client client);
    Client updateClient(Long id, Client client);
    void deleteClient(Long id);
    List<Client> getAllClients();
    List<Client> getClientsWithUserAccount();
    List<Client> getClientsWithoutUserAccount();
    Optional<Client> getClientByTelephone(String telephone);
    Optional<Client> getClientById(Long clientId);
}