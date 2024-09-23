import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopapp/app/modules/debt-details/views/text_key_value.dart';

import '../../../data/model/debt_model.dart';
import '../../../themes/theme_colors.dart';
import '../controllers/debt_details_controller.dart';

class DebtDetailsView extends GetView<DebtDetailsController> {

  const DebtDetailsView({super.key});

  @override
  DebtDetailsController get controller =>  Get.find();
  @override
  Widget build(BuildContext context) {
    Debt debt =Debt.fromJson( Get.arguments as Map<String, dynamic>);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: ThemeColor.primaryBlack,
        foregroundColor: Colors.white,
        title:  const Text('Details de la dette'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(debt.client.user.photo),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 10),
            // user name
            Text(
              debt.client.surname,
              style: const TextStyle(
                fontSize: 16,
                color: ThemeColor.primaryBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 0),
            // debt amount
            // debt date
            Text(
              "${debt.client.address}\n ${debt.client.telephone}\n ${debt.client.user.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: ThemeColor.primaryBlack,
                fontWeight: FontWeight.w600,

              ),
            ),

            //debt details
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                color: ThemeColor.secondaryBlack,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  // debt amount
                  const Text(
                    "Details de la dette",
                    style: TextStyle(
                      fontSize: 20,
                      color: ThemeColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // paid
                      Text(
                        debt.paid ? "Paid" : "Dette",
                        style: const TextStyle(
                          fontSize: 16,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: ThemeColor.gradient2,
                        size: 15,
                      ),
                    ],
                  ),
                  TextKeyValue(
                    title: "Montant",
                    value: "${debt.amount.toStringAsFixed(2)} XOF",
                  ),
                  TextKeyValue(
                    title: "Date",
                    value: debt.date.toString(),
                  ),
                  TextKeyValue(
                    title: "Client",
                    value: debt.client.surname,
                  ),
                  TextKeyValue(
                    title: "Boutique",
                    value: debt.shopper.email,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Payements",
                    style: TextStyle(
                      fontSize: 20,
                      color: ThemeColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.payment),
                        minLeadingWidth: 0,
                        horizontalTitleGap: 10,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                        dense: false,
                        selectedTileColor: ThemeColor.gradient2,
                        selectedColor: ThemeColor.gradient2,
                        iconColor: ThemeColor.white,

                        textColor: ThemeColor.white,
                        title: Text("Payment ${index + 1}"),
                        subtitle: Text( "Subtitle ${index + 1}"),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 100,
                  ),

                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
