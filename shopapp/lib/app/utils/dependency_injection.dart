import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopapp/app/data/provider/debt_provider.dart';
import 'package:shopapp/app/data/provider/login_provider.dart';
import 'package:shopapp/app/modules/auth/controllers/auth_controller.dart';
import 'package:shopapp/app/services/network_status_service.dart';
import 'package:shopapp/app/utils/app_http_client.dart';
import 'package:shopapp/app/utils/constants.dart';
import 'package:shopapp/app/utils/secure_storage.dart';

import '../data/provider/client_provider.dart';
import '../modules/clients/controllers/clients_controller.dart';
import '../modules/home/controllers/home_controller.dart';

class DependencyInjection {
  static Future<void> init() async {
    // Secure Storage
    const flutterSecureStorage = FlutterSecureStorage();
    Get.put<SecureStorage>(SecureStorage( storage: flutterSecureStorage), permanent: true);
    Get.put<AppHttpClient>( AppHttpClient(
        baseUrl: apiBaseUrl, secureStorage: Get.find<SecureStorage>()), permanent: true);

    //providers
    Get.put<LoginProvider>(LoginProvider( httpClient: Get.find()), permanent: true);
    Get.put(DebtProvider(httpClient: Get.find()), permanent: true);
    Get.put(ClientProvider(httpClient: Get.find()), permanent: true);


    //services
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);

    //controllers
    Get.put<AuthController>(AuthController(loginProvider: Get.find(), secureStorage: Get.find()), permanent: true);
    Get.put<ClientsController>(ClientsController(clientProvider:  Get.find()), permanent: true);
    // Get.put<HomeController>(HomeController(debtProvider: Get.find(), authController: Get.find()), permanent: true);

  }
}
