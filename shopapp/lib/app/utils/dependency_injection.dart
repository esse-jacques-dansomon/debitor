import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shopapp/app/data/repository/debt_repository.dart';
import 'package:shopapp/app/data/repository/login_repository.dart';
import 'package:shopapp/app/modules/auth/controllers/auth_controller.dart';
import 'package:shopapp/app/data/provider/app_http_client.dart';
import 'package:shopapp/app/utils/constants.dart';
import 'package:shopapp/app/utils/secure_storage.dart';

import '../data/repository/client_repository.dart';
import '../modules/clients/controllers/clients_controller.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/splash/controllers/splash_controller.dart';
import '../services/network_status_service.dart';

class DependencyInjection {
  static Future<void> init() async {
    // Secure Storage
    const flutterSecureStorage = FlutterSecureStorage();
    Get.put<SecureStorage>(SecureStorage(storage: flutterSecureStorage),
        permanent: true);
    Get.put<AppHttpClient>(
        AppHttpClient(
            baseUrl: apiBaseUrl, secureStorage: Get.find<SecureStorage>()),
        permanent: true);


    //providers
    Get.put<LoginRepository>(LoginRepository(httpClient: Get.find()),
        permanent: true);
    Get.put(DebtRepository(httpClient: Get.find()), permanent: true);
    Get.put(ClientRepository(httpClient: Get.find()), permanent: true);


    //services
    //  Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);

    //controllers
    Get.put<AuthController>(
        AuthController(loginProvider: Get.find(), secureStorage: Get.find()),
        permanent: true);
    Get.put<ClientsController>(ClientsController(clientRepository: Get.find()),
        permanent: true);
    Get.put<HomeController>(
        HomeController(debtProvider: Get.find(), authController: Get.find()),
        permanent: true);
    Get.put<SplashController>(
        SplashController(
            homeController: Get.find(), clientsController: Get.find()),
        permanent: true);
  }
}
