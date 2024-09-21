import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/themes/theme_colors.dart';
import 'package:shopapp/app/utils/dependency_injection.dart';

import 'app/routes/app_pages.dart';

void main() {

  DependencyInjection.init();
  //screen rotation disabled
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeColor().themeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );


}
