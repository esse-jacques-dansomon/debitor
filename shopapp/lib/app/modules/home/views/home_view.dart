import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/themes/theme_colors.dart';
import 'package:shopapp/app/widgets/text_icon.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
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
                      child: const SafeArea(
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
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:
                                    NetworkImage('https://via.placeholder.com/150'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Hello Esse!",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                    //welcome message
                                    Text("Welcome back",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                )
                              ],
                            ),
                            Icon(Icons.notification_add,
                                color: Colors.white, size: 25),
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
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 15),

                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ThemeColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //avatar
                                    const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                        NetworkImage('https://via.placeholder.com/150'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    //space
                                    const SizedBox(width: 10),
                                    //user infos
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Text(
                                            "Transaction ${index + 1}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ThemeColor.primaryBlack,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "15 May 2023",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: ThemeColor.primaryShadowGrey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // details
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "XOF 1,000,000",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ThemeColor.primaryBlack,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Deposit",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: ThemeColor.primaryShadowGrey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
              Positioned(
                top: 130,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("VOTRE SOLDE",
                          style: TextStyle(
                              fontSize: 14,
                              color: ThemeColor.primaryDarkGrey,
                              fontWeight: FontWeight.normal)),
                      const SizedBox(height: 10),
                      const Text("XOF 1,000,000",
                          style: TextStyle(
                              fontSize: 20,
                              color: ThemeColor.primaryBlack,
                              fontWeight: FontWeight.w600)),

                      const SizedBox(height: 10),

                      // Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(text: 'Transfer', icon: Icons.arrow_upward, onTap: () {}),
                          TextIcon(text: 'Withdraw', icon: Icons.arrow_forward, onTap: () {}),
                          TextIcon(text: 'Deposit', icon: Icons.money, onTap: () {}),
                          TextIcon(text: 'Clients', icon: Icons.add_card, onTap: () {}),
                          SizedBox(width: 10),
                        ],
                      )

                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
