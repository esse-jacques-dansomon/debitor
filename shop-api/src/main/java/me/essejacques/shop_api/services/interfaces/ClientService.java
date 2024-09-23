package me.essejacques.shop_api.services.interfaces;


import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.requests.ClientRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface ClientService {
    Client createClient(ClientRequest clientRequest, MultipartFile file);
    Client updateClient(Long id, ClientRequest clientRequest);
    void deleteClient(Long id);
    List<Client> getAllClients();
    List<Client> getClientsWithUserAccount();
    List<Client> getClientsWithoutUserAccount();
    Optional<Client> getClientByTelephone(String telephone);
    Optional<Client> getClientById(Long clientId);
}