import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/modules/home/controllers/home_controller.dart';

import '../../../themes/theme_colors.dart';
import '../../../widgets/transaction_card.dart';


class ArchivesView extends GetView<HomeController> {
  const ArchivesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: const [
          Text('Archives', style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: ThemeColor.primaryBlack,
        foregroundColor: ThemeColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 20),
        child: ListView.builder(
          itemCount: controller.debts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return TransactionCard(debt: controller.debts[index]);
          },
        ),
      ),
    );
  }
}
