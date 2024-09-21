import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/routes/app_pages.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff73cf29),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gerer Votre\nBoutique \nPlus Facilement",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 33,
                    textBaseline: TextBaseline.ideographic,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 20),
            const Text(
                "Manage your finances easily using our intuitive and user-friendly interface and set financial goals to help you reach your financial goals.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300)),
            // button
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(0)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Démarrer",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
