package me.essejacques.shop_api.controllers.interfaces;

import jakarta.validation.Valid;
import me.essejacques.shop_api.dtos.ClientDto;
import me.essejacques.shop_api.requests.ClientRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RequestMapping("/clients")
public interface IClientController {

    /**
     * Create a new client with a profile picture.
     *
     * @param clientRequest the client information
     * @param file the client's profile picture
     * @return ResponseEntity containing the created ClientDto
     */
    @PostMapping(consumes = "multipart/form-data")
    ResponseEntity<ClientDto> createClient(@RequestBody ClientRequest clientRequest, @RequestPart("file") MultipartFile file);

    /**
     * Update an existing client.
     *
     * @param id the id of the client to update
     * @param clientRequest the new client information
     * @return ResponseEntity containing the updated ClientDto
     */
    @PutMapping("/{id}")
    ResponseEntity<ClientDto> updateClient(@PathVariable Long id, @Valid @RequestBody ClientRequest clientRequest);

    /**
     * Delete a client by their ID.
     *
     * @param id the id of the client to delete
     * @return ResponseEntity<Void> with no content
     */
    @DeleteMapping("/{id}")
    ResponseEntity<Void> deleteClient(@PathVariable Long id);

    /**
     * Get all clients, with an optional filter to get only those who have or don't have an account.
     *
     * @param hasAccount whether to filter clients based on having an account
     * @return ResponseEntity containing a list of ClientDto
     */
    @GetMapping
    ResponseEntity<List<ClientDto>> getAllClients(@RequestParam(required = false) Boolean hasAccount);

    /**
     * Get a client by their telephone number.
     *
     * @param telephone the client's telephone number
     * @return ResponseEntity containing an Optional ClientDto
     */
    @GetMapping("/search")
    ResponseEntity<Optional<ClientDto>> getClientByTelephone(@RequestParam String telephone);
}
