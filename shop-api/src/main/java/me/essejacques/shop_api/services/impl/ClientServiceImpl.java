package me.essejacques.shop_api.services.impl;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.entity.User;
import me.essejacques.shop_api.enums.RoleType;
import me.essejacques.shop_api.repositories.ClientRepository;
import me.essejacques.shop_api.requests.ClientRequest;
import me.essejacques.shop_api.services.interfaces.ClientService;
import me.essejacques.shop_api.services.interfaces.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class ClientServiceImpl implements ClientService {

    private final ClientRepository clientRepository;
    private final PhotoService photoService;


    @Override
    public Client createClient(ClientRequest clientRequest, MultipartFile file) {
        Client client = Client.builder()
                .surname(clientRequest.username())
                .address(clientRequest.address())
                .telephone(clientRequest.telephone())
                .build();
        try {
            String link = photoService.uploadPhoto(file);
            User user = new User();
            user.setEmail(clientRequest.email());
            user.setRole(RoleType.ROLE_USER);
            user.setPhoto(link);
            client.setUser(user);
            return clientRepository.save(client);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Client updateClient(Long id, ClientRequest clientRequest) {
        Client client = clientRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Client not found"));
        client.setSurname(clientRequest.username());
        client.setTelephone(clientRequest.telephone());
        client.setAddress(clientRequest.address());
        return clientRepository.save(client);
    }

    @Override
    public void deleteClient(Long id) {
        clientRepository.deleteById(id);
    }

    @Override
    public List<Client> getAllClients() {
        return clientRepository.findAllProjectedBy();
    }

    @Override
    public List<Client> getClientsWithUserAccount() {
        return clientRepository.findAllProjectedByUserIsNotNull();
    }

    @Override
    public List<Client> getClientsWithoutUserAccount() {
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
