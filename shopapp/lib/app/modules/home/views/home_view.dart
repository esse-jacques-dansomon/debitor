import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../../../widgets/transaction_card.dart';
import '../controllers/home_controller.dart';
import 'balance_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controller =>  Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryBlack,
      appBar: AppBar(
        backgroundColor: ThemeColor.primaryBlack,
        foregroundColor: ThemeColor.white,
        leadingWidth: double.infinity,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Obx(() {
                        return CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(controller
                              .authController
                              .user
                              .value
                              ?.photo ??
                              'https://via.placeholder.com/150'),
                          backgroundColor: Colors.transparent,
                        );
                      }),
                    ),
                    const SizedBox(width: 10),
                    Obx(() {
                      if (controller.authController.user.value !=
                          null) {
                        return Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Text(
                                controller.authController.user
                                    .value!.email,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            //welcome message
                            const Text("Welcome back",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ],
                ),
                InkWell(
                  onTap: () {
                    controller.authController.logout();
                  },
                  child: const Icon(Icons.login_outlined,
                      color: Colors.white, size: 25),
                ),
              ],
            ),
          ),
        ),

      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: ThemeColor.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      color: ThemeColor.primaryBlack,
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: SafeArea(
                        child: Container(),
                      ),
                    ),
                    const SizedBox(height: 80),
                    //container
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text("Transactions",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.primaryBlack,
                                  fontWeight: FontWeight.normal)),
                          const SizedBox(height: 20),
                          Obx(() {
                            if (controller.debts.isEmpty) {
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: const Center(
                                      child: Text("Vous n'avez pas de débit")));
                            } else {
                              return ListView.builder(
                                itemCount: controller.debts.length,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return TransactionCard(
                                      debt: controller.debts[index]);
                                },
                              );
                            }
                          }),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // balance card
              Obx(() {
                if (controller.authController.user.value != null) {
                  return BalanceCard(balance: controller.getBalance());
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
