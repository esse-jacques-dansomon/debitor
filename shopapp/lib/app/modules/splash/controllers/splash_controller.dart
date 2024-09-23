import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../clients/controllers/clients_controller.dart';
import '../../home/controllers/home_controller.dart';

class SplashController extends GetxController {

   final HomeController homeController;
   final ClientsController clientsController;

  SplashController({required this.homeController, required this.clientsController});
  @override
  onInit()  {
    super.onInit();
    homeController.authController.isLoginSuccess.stream.listen((event) {
      if(event){
        print("SplashController onInit, isLoginSuccess");
        homeController.getShopperDebts();
        clientsController.getClients();
        //wait 3 seconds to avoid the splash screen to be shown
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAllNamed(Routes.HOME);
        });
        // Get.offAllNamed(Routes.HOME);
      }else{
        print("SplashController onInit, isLoginSuccess false");
        // Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    print("SplashController close");
  }

  @override
  void onReady() {
    super.onReady();
    print("SplashController ready");
  }
}
