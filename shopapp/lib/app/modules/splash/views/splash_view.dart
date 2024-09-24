import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/app/modules/splash/controllers/splash_controller.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../../../routes/app_pages.dart';
import '../../auth/controllers/auth_controller.dart';


class SplashView extends GetView<SplashController> {

  const SplashView({super.key});

  @override
  SplashController get controller => Get.find();

  AuthController get authController => Get.find();


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [Expanded(child: Lottie.asset("assets/lotties/splash.json"))],
      ),
      duration: 2000,
      backgroundColor: ThemeColor.primaryBlue,
      splashIconSize: 200,
      nextScreen:  Container(
        color: ThemeColor.primaryBlue,
        width: double.infinity,
        height: double.infinity,
        child:  const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
