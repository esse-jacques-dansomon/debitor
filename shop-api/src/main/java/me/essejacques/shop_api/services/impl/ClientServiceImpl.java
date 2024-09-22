package me.essejacques.shop_api.services.impl;

import me.essejacques.shop_api.dtos.ClientProjection;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.repositories.ClientRepository;
import me.essejacques.shop_api.services.interfaces.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
public class ClientServiceImpl implements ClientService {

    private final ClientRepository clientRepository;

    @Autowired
    public ClientServiceImpl(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @Override
    public Client createClient(Client client, MultipartFile file) {

        return clientRepository.save(client);
    }

    @Override
    public Client updateClient(Long id, Client clientDetails) {
        Client client = clientRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Client not found"));
        client.setSurname(clientDetails.getSurname());
        client.setTelephone(clientDetails.getTelephone());
        client.setAddress(clientDetails.getAddress());
        client.setUser(clientDetails.getUser());
        return clientRepository.save(client);
    }

    @Override
    public void deleteClient(Long id) {
        clientRepository.deleteById(id);
    }

    @Override
    public List<ClientProjection> getAllClients() {
        return clientRepository.findAllProjectedBy();
    }

    @Override
    public List<ClientProjection> getClientsWithUserAccount() {
        return clientRepository.findAllProjectedByUserIsNotNull();
    }

    @Override
    public List<ClientProjection> getClientsWithoutUserAccount() {
        return clientRepository.findAllProjectedByUserIsNull();
    }

    @Override
    public Optional<Client> getClientByTelephone(String telephone) {
        return clientRepository.findByTelephone(telephone);
    }

    @Override
    public Optional<Client> getClientById(Long clientId) {
        return clientRepository.findById(clientId);
    }
}
