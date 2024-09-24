
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/app/modules/auth/controllers/auth_controller.dart';

import '../../routes/app_pages.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();


    if (authController.hasSeenWelcome.value == false) {
      authController.persistHasSeenWelcome(true);
      return const RouteSettings(name: Routes.START);
    } else if (authController.isLoginSuccess.value == false) {
      return const RouteSettings(name: Routes.LOGIN);
    } else if (authController.isLoginSuccess == true) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}