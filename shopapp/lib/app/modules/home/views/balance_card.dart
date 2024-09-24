import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopapp/app/routes/app_pages.dart';

import '../../../themes/theme_colors.dart';
import '../../../widgets/text_icon.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
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
            Text("XOF ${balance.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 20,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600)),

            const SizedBox(height: 10),

            // Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextIcon(
                    text: 'Depot',
                    icon: Icons.arrow_upward,
                    onTap: () {
                      Get.toNamed(Routes.DEBIT);
                    }),
                TextIcon(
                    text: 'Archives',
                    icon: Icons.arrow_forward,
                    onTap: () {
                      Get.toNamed(Routes.DEBIT);
                    }),
                TextIcon(
                    text: 'Clients',
                    icon: Icons.add_card,
                    onTap: () {
                      Get.toNamed(Routes.CLIENTS);
                    }),

                TextIcon(
                    text: 'Paiements',
                    icon: Icons.payments_rounded,
                    onTap: () {
                      Get.toNamed(Routes.CLIENTS);
                    }),

                SizedBox(
                  width: 10,
                )
                  //width: 100,

              ],
            )
          ],
        ),
      ),
    );
  }
}
