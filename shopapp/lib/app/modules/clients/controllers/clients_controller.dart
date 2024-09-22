import 'package:get/get.dart';
import 'package:shopapp/app/data/model/client_model.dart';

import '../../../data/provider/client_provider.dart';

class ClientsController extends GetxController {
  final ClientProvider clientProvider;
  ClientsController({required this.clientProvider});

  final clients = RxList<Client>();

  @override
  onInit()  {
    super.onInit();
    getClients();
  }

  void getClients() async {
    var allClients = await clientProvider.getClients();
    print(allClients);
    clients.addAll(allClients);
  }

}
