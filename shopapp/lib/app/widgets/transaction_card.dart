import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopapp/app/themes/theme_colors.dart';

import '../data/model/debt_model.dart';
import '../routes/app_pages.dart';

class TransactionCard extends StatelessWidget {
  final Debt debt;
  const TransactionCard({super.key, required this.debt});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){

        Get.toNamed(Routes.DEBT_DETAILS, arguments: debt.toJson());
      },
      child: Container(
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
             SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage(debt.client.user.photo),
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
                    debt.client.surname,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ThemeColor.primaryBlack,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    debt.date.toString(),
                    style: const TextStyle(
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
                  "${debt.amount.toStringAsFixed(2)} XOF",
                  style: const TextStyle(
                    fontSize: 12,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  debt.paid ? "Paid" : "Dette",
                  style: const TextStyle(
                    fontSize: 11,
                    color: ThemeColor.primaryShadowGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

