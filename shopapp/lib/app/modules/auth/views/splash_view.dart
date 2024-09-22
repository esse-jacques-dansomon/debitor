import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/app/modules/auth/controllers/auth_controller.dart';
import 'package:shopapp/app/modules/start/views/start_view.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../../home/views/home_view.dart';


class SplashView extends GetView<AuthController> {


  @override
  AuthController get controller => Get.find<AuthController>();


  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {


    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(child: Lottie.asset("assets/lotties/splash.json"))
        ],
      ),
      disableNavigation: true,
      duration: 4000,
      backgroundColor: ThemeColor.primaryBlue,
      splashIconSize: 200,
      nextScreen: CircularProgressIndicator(
        color: ThemeColor.primaryBlue,
      ),
    );
  }
}
