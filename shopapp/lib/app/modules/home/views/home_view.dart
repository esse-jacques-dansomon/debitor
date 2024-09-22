import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/modules/auth/controllers/auth_controller.dart';
import 'package:shopapp/app/themes/theme_colors.dart';


import '../../../widgets/transaction_card.dart';
import '../controllers/home_controller.dart';
import 'balance_card.dart';

class HomeView extends GetView<HomeController> {
   const HomeView({super.key});


  HomeController get controller => Get.find();



  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: ThemeColor.primaryBlack,
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
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color:ThemeColor.primaryBlack,
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child:  SafeArea(
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
                                  child: Obx((){
                                     return CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                        NetworkImage(authController.user.value?.photo ?? 'https://via.placeholder.com/150'),
                                        backgroundColor: Colors.transparent,
                                      );
                                    }
                                  ),
                                ),
                                const SizedBox(width: 10),
                                 Obx(() {
                                  if(authController.user.value != null){
                                 return    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(authController.user.value!.email,
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
                                  }else {
                                    return const SizedBox();
                                  }
                                }),
                              ],
                            ),
                            InkWell(
                              onTap: ()  {
                                 authController.logout();
                              },
                              child: const Icon(Icons.login_outlined,
                                  color: Colors.white, size: 25),
                            ),
                          ],

                        ),
                      ),

                    ),
                     const SizedBox(height: 50),
                   //container
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          ListView.builder(
                            itemCount: 50,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return TransactionCard(
                                title: 'Transaction ${index + 1}',
                                date: '15 May 2023',
                                amount: 'XOF 1,000,000',
                                type: 'Deposit',
                              );

                            },
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              // balance card
              const BalanceCard(),
            ],
          ),
        ),
      ),
    );
  }
}
