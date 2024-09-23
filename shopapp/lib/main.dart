import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/themes/theme_colors.dart';
import 'package:shopapp/app/utils/dependency_injection.dart';

import 'app/modules/auth/bindings/auth_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized( );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  //screen rotation disabled
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Application",
      theme: ThemeColor().themeData,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      initialBinding: AuthBinding(),
    ),
  );

  await DependencyInjection.init();

}
