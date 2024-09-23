import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/theme_colors.dart';
import '../controllers/debit_controller.dart';

final optionsList = ['option1', 'option2', 'option3'];

class DebitView extends GetView<DebitController> {
  const DebitView({super.key});

  @override
  DebitController get controller => Get.find();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Debit'),
        centerTitle: true,
        backgroundColor: ThemeColor.primaryBlack,
        foregroundColor: ThemeColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Nom du client",
                style: TextStyle(
                    fontSize: 16,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ThemeColor.primaryBlue,
                  ),
                ),
                hintText: 'Entrez le nom du client',
                hintStyle: const TextStyle(color: ThemeColor.primaryBlack),
                suffixIcon: const Icon(Icons.person),
              ),
              textInputAction: TextInputAction.next,

            ),
              //montant

            const SizedBox(height: 20),
            const Text("Montant",
                style: TextStyle(
                    fontSize: 16,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ThemeColor.primaryBlue,
                  ),
                ),
                  hintText: 'Entrez le montant',
                  hintStyle: const TextStyle(color: ThemeColor.primaryBlack),
                  suffixIcon: const Icon(Icons.money),

              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.send,
             ),

            const SizedBox(
              height: 20,
            ),
            const Text("Options",
                style: TextStyle(
                    fontSize: 16,
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ThemeColor.primaryBlue,
                  ),
                ),
                 hintText: 'Select an option',
                 hintStyle: const TextStyle(color: ThemeColor.primaryBlack),
                 // suffixIcon: const Icon(Icons.arrow_drop_down),
              ),
              value: controller.selectedValue.value ?? null,
              hint: const Text('Select an option'),
              onChanged: ( newValue) {
                controller.setSelectedValue(newValue);
              },
              validator: ( value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null;
              },
              items: ['option1', 'option2', 'option3'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  //Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all(ThemeColor.primaryBlue),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.all(0)),
                ),
                child: const Center(
                  child: Text(
                    "Créer",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
