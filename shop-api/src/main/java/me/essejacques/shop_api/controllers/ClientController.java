package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.dtos.ClientProjection;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.services.interfaces.ClientService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/clients")
@Tag(name = "Clients", description = "Clients API")
public class ClientController {

    private final ClientService clientService;

    @PostMapping(consumes = "multipart/form-data")
    public ResponseEntity<Client> createClient(@RequestBody Client client,  @RequestPart("file") MultipartFile file) {
        Client created = clientService.createClient(client, file);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Client> updateClient(@PathVariable Long id, @RequestBody Client client) {
        Client updated = clientService.updateClient(id, client);
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteClient(@PathVariable Long id) {
        clientService.deleteClient(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<ClientProjection>> getAllClients(
            @RequestParam(required = false) Boolean hasAccount ) {
        List<ClientProjection> clients;
        if (hasAccount == null) {
            clients = clientService.getAllClients();
        } else if (hasAccount) {
            clients = clientService.getClientsWithUserAccount();
        } else {
            clients = clientService.getClientsWithoutUserAccount();
        }
        return ResponseEntity.ok(clients);
    }

    @GetMapping("/search")
    public ResponseEntity<Optional<Client>> getClientByTelephone(@RequestParam String telephone) {
        Optional<Client> client = clientService.getClientByTelephone(telephone);
        return ResponseEntity.ok(client);
    }
}
