import 'package:get/get.dart';
import 'package:shopapp/app/data/model/client_model.dart';

import '../../../data/repository/client_repository.dart';


class ClientsController extends GetxController {
  final ClientRepository clientRepository;
  ClientsController({required this.clientRepository});

  final clients = RxList<Client>();
  final filterClients = RxList<Client>();


  @override
  onInit()  {
    super.onInit();
  }

  Future<void> getClients() async {
    var allClients = await clientRepository.getClients();
    clients.addAll(allClients);
    filterClients.addAll(allClients);
  }

  void searchClients(String query) async {
    // Réinitialiser la liste filtrée
    filterClients.clear();

    // Filtrer les clients selon plusieurs attributs
    var filteredClients = clients.where((client) {
      return client.surname.toLowerCase().contains(query.toLowerCase()) ||
          client.telephone.toLowerCase().contains(query.toLowerCase()) ||
          client.address.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Ajouter les résultats filtrés à la liste
    filterClients.addAll(filteredClients);
  }

}
