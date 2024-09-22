
import 'package:flutter/material.dart';

import '../../../themes/theme_colors.dart';
import '../../../widgets/text_icon.dart';
class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({super.key, required this.balance });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
             Text("XOF ${balance.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 20,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600)),

            const SizedBox(height: 10),

            // Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextIcon(text: 'Depot', icon: Icons.arrow_upward, onTap: () {}),
                TextIcon(text: 'Archives', icon: Icons.arrow_forward, onTap: () {}),
                TextIcon(text: 'Payments', icon: Icons.money, onTap: () {}),
                TextIcon(text: 'Clients', icon: Icons.add_card, onTap: () {}),
              ],
            )

          ],
        ),

      ),
    );
  }
}
