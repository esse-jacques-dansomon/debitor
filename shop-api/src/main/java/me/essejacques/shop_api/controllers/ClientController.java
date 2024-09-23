package me.essejacques.shop_api.controllers;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import me.essejacques.shop_api.dtos.ClientDto;
import me.essejacques.shop_api.entity.Client;
import me.essejacques.shop_api.requests.ClientRequest;
import me.essejacques.shop_api.services.interfaces.ClientService;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/clients")
@Tag(name = "Clients", description = "Clients API")
public class ClientController {
    private final ClientService clientService;
    private final ModelMapper modelMapper;

    @PostMapping(consumes = "multipart/form-data")
    public ResponseEntity<ClientDto> createClient(@RequestBody ClientRequest clientRequest, @RequestPart("file") MultipartFile file) {
        Client clientCreated = clientService.createClient(clientRequest, file);
        return ResponseEntity.status(HttpStatus.CREATED).body(modelMapper.map(clientCreated, ClientDto.class));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ClientDto> updateClient(@PathVariable Long id,@Valid @RequestBody ClientRequest clientRequest) {
        Client updateClient = clientService.updateClient(id, clientRequest);
        return ResponseEntity.ok(modelMapper.map(updateClient, ClientDto.class));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteClient(@PathVariable Long id) {
        clientService.deleteClient(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<ClientDto>> getAllClients(
            @RequestParam(required = false) Boolean hasAccount ) {
        List<Client> clients;
        if (hasAccount == null) {
            clients = clientService.getAllClients();
        } else if (hasAccount) {
            clients = clientService.getClientsWithUserAccount();
        } else {
            clients = clientService.getClientsWithoutUserAccount();
        }
        return ResponseEntity.ok(
                clients.stream().map((element) -> modelMapper.map(element, ClientDto.class)).collect(Collectors.toList())
        );
    }

    @GetMapping("/search")
    public ResponseEntity<Optional<ClientDto>> getClientByTelephone(@RequestParam String telephone) {
        Optional<Client> client = clientService.getClientByTelephone(telephone);
        return ResponseEntity.ok(client.map((element) -> modelMapper.map(element, ClientDto.class)));
    }
}
