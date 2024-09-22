import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/widgets/client_card.dart';

import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  const ClientsView({super.key});

  @override
  ClientsController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Retourne à la page précédente
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Action pour le bouton de recherche
                showSearch(context: context, delegate: CustomSearchDelegate(controller));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: controller.clients.length,
          scrollDirection: Axis.vertical,
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return ClientCard( client: controller.clients[index]);
          },
        ),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
  final ClientsController controller;
  CustomSearchDelegate(this.controller);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Réinitialiser la recherche
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Ferme la recherche
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Afficher les résultats de la recherche
    controller.searchClients(query);
    return Center(child: Text('Résultats pour "$query"'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions pendant la recherche
    return ListView.builder(
      itemCount: query.isEmpty ? controller.clients.length : controller.filterClients.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(query.isEmpty ? "${controller.clients[index].surname} ${controller.clients[index].user.email}" : controller.filterClients[index].surname),
          onTap: () {
            query = query.isEmpty ? controller.clients[index].surname : controller.filterClients[index].surname;
            showResults(context); // Affiche les résultats de la recherche
          },
        );
      },
    );
  }
  }
